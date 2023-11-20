#include <ros/ros.h>
#include <iostream>
#include <stdlib.h>
#include <std_msgs/String.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/TransformStamped.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <sensor_msgs/LaserScan.h>
#include <tf/transform_datatypes.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_ros/transform_broadcaster.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include "wot_pkg/is_hit.h"
#include <std_msgs_stamped/BoolStamped.h>
#include <gazebo_msgs/ModelState.h>
#include <gazebo_msgs/ModelStates.h>
#include <random>


std::string vehicle_name;
ros::Time last_shoot_time;

struct tf_pub{

    tf_pub(ros::NodeHandle n_):n(n_),tfListener(tfBuffer)
	{
        n.getParam("vehicle_name", vehicle_name);
        scanner = n.subscribe("/" + vehicle_name + "/scan", 1000, &tf_pub::scanCallBack, this);
		hit_pose_pub = n.advertise<geometry_msgs::PoseStamped>("global_hit_pose", 1000);
        hit_viz_pub = n.advertise<visualization_msgs::Marker>("hit_pose", 1000);
	}
	~tf_pub(){}

    
    void scanCallBack(const sensor_msgs::LaserScan::ConstPtr& msg)
    {
        hit_range = 12;		
        for (int i = 0; i <= 4 ; i++)
        {
            if (msg -> ranges[i] < hit_range && msg -> ranges[i] > 0.15)
            {
                hit_range = msg -> ranges[i];
            }
        }
        for (int i= msg -> ranges.size()-4; i <= msg -> ranges.size(); i++)
        {
            if (msg -> ranges[i] < hit_range && msg -> ranges[i] > 0.15)
            {
                hit_range = msg -> ranges[i];
            }
        }
        hit_pose.pose.position.x = - hit_range ;
        hit_pose.pose.position.y = 0;
        hit_pose.pose.position.z = 0;
        hit_pose.pose.orientation.w = 1.0;

        vis_hit_pose(hit_marker);

        hit_viz_pub.publish(hit_marker);

		cal_scan(msg -> header.stamp);
    }

    void vis_hit_pose(visualization_msgs::Marker& marker){
        marker.header.stamp = ros::Time();			
        marker.header.frame_id = vehicle_name + "/lidar_link";
        marker.id = 0;
        marker.action = visualization_msgs::Marker::ADD;
        marker.lifetime = ros::Duration(0.1);
        marker.ns = "hit_marker";
        marker.type = visualization_msgs::Marker::SPHERE;
        marker.pose = hit_pose.pose;
        marker.color.r = 1.0;
        marker.color.g = 0.0;
        marker.color.b = 0.0;
        marker.color.a = 1.0;
        marker.scale.x = 0.1;
        marker.scale.y = 0.1;
        marker.scale.z = 0.1;
    }

    geometry_msgs::PoseStamped hitpoint_global;
    
    void cal_scan(ros::Time tmstamp){

        if (tfBuffer.canTransform("map",
							vehicle_name + "/lidar_link",
							tmstamp,
							ros::Duration(1.0)))
		{
        // Getting the transformation
        auto trans_world2baselink = tfBuffer.lookupTransform("map",
                                                    vehicle_name + "/lidar_link",
                                                    tmstamp);           

        tf2::doTransform(hit_pose, hitpoint_global, trans_world2baselink);
			
		hit_pose_pub.publish(hitpoint_global);
        }	
    }
    
    geometry_msgs::PoseStamped hit_pose;
    double hit_range = 12.0;
    visualization_msgs::Marker hit_marker;

    ros::NodeHandle n;
    ros::Subscriber scanner;
	ros::Publisher hit_pose_pub;
    ros::Publisher hit_viz_pub;

	tf2_ros::Buffer tfBuffer;
    tf2_ros::TransformListener tfListener;
    tf2_ros::TransformBroadcaster broadcaster;
};

struct visualizer{
    visualizer(ros::NodeHandle n_, visualization_msgs::Marker& bounding_box_marker_):n(n_)
    {
        bounding_box_pub = n.advertise<visualization_msgs::Marker>("bounding_box", 1000);
        vis_bounding_box(bounding_box_marker_);
    }
    ~visualizer(){}

    void vis_bounding_box(visualization_msgs::Marker& marker){
        marker.header.stamp = ros::Time();			
        marker.header.frame_id = vehicle_name + "/base_link";			
        marker.action = visualization_msgs::Marker::ADD;			
        marker.lifetime = ros::Duration(0.1);
        char vehicle_number = vehicle_name.back();
        marker.id = atoi(&vehicle_number);			
        marker.ns = "bounding_box";			
        marker.type = visualization_msgs::Marker::CUBE;			
        marker.pose.position.x = 0;			
        marker.pose.position.y = 0;			
        marker.pose.position.z = 0.1;		
        marker.pose.orientation.w = 1.0;			
        marker.color.r = 0.0;			
        marker.color.g = 0.0;			
        marker.color.b = 1.0;			
        marker.color.a = 1.0;			
        marker.scale.x = 0.25;			
        marker.scale.y = 0.2;			
        marker.scale.z = 0.2;
    }

    void pub_bounding_box(visualization_msgs::Marker& marker){
        bounding_box_pub.publish(marker);
    }

    ros::NodeHandle n;
    ros::Publisher bounding_box_pub;

};

bool shoot = false;
void shootCallBack(const std_msgs_stamped::BoolStamped msg)
{
    shoot=msg.data;
}

std::vector<geometry_msgs::Pose> model_poses;

void modelsCallback(const gazebo_msgs::ModelStates::ConstPtr& msg)
{
    model_poses = msg -> pose;
}




int main(int argc, char **argv)
{
    ros::init(argc, argv,"vehicle_node");
    ros::NodeHandle n("~");
    tf_pub tf_publisher(n);

    ros::Subscriber shoot_sub = n.subscribe("/" + vehicle_name + "/shooting", 1000, shootCallBack);

    ros::ServiceClient client = n.serviceClient<wot_pkg::is_hit>("/is_hit");
    wot_pkg::is_hit srv;
    srv.request.hit_location = tf_publisher.hitpoint_global;
    ros::Publisher move_pub = n.advertise<gazebo_msgs::ModelState>("/gazebo/set_model_state", 1000);
    ros::Subscriber models_sub = n.subscribe("/gazebo/model_states", 1000, modelsCallback);

    ros::Rate r(100);

    

    visualization_msgs::Marker bounding_box_marker;
    visualizer visualize_bounding_box(n, bounding_box_marker);
    last_shoot_time = ros::Time::now();
    
    while (ros::ok())
    {
        visualize_bounding_box.pub_bounding_box(bounding_box_marker);

        if (shoot)
        {
            srv.request.hit_location = tf_publisher.hitpoint_global;
            srv.request.vehicle_name = vehicle_name;
            if(ros::Time::now()-last_shoot_time > ros::Duration(5.0))
            {
                last_shoot_time = ros::Time::now();
                ros::service::call("/is_hit", srv);
                ROS_INFO("Hit:%d\n", srv.response.is_hit.data);
                if (srv.response.is_hit.data != -1)
                {
                    bool is_occupied = false;
                    double x = 0;
                    double y = 0;
                    do
                    {   //random double generation, source: https://stackoverflow.com/questions/2704521/generate-random-double-numbers-in-c
                        std::uniform_real_distribution<double> distribution(-10.0, 10.0);
                        std::default_random_engine generator(std::time(0));
                        x = distribution(generator);
                        y = distribution(generator);
                        is_occupied = false;
                        for(int i = 0; i < model_poses.size(); i++)
                        {
                            if (model_poses[i].position.x <= x + 0.5 && model_poses[i].position.x >= x - 0.5 && 
                                model_poses[i].position.y <= y + 0.5 && model_poses[i].position.y >= y - 0.5)
                            {
                                is_occupied = true;
                            }
                        }

                    }while(is_occupied);

                    gazebo_msgs::ModelState new_spawn_state;
                    new_spawn_state.model_name = "vehicle" + std::to_string(srv.response.is_hit.data);
                    new_spawn_state.pose.position.x = x;
                    new_spawn_state.pose.position.y = y;
                    new_spawn_state.pose.orientation.w = 1;
                    new_spawn_state.reference_frame = "map";
                    move_pub.publish(new_spawn_state);
                }
            } 

        }

        ros::spinOnce();
        r.sleep();
    }
    
    return 0;
}