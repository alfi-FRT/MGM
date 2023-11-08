#include <ros/ros.h>
#include <iostream>
#include <std_msgs/String.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/TransformStamped.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <sensor_msgs/LaserScan.h>
#include <tf/transform_datatypes.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_ros/transform_broadcaster.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <Eigen/Core>
#include <Eigen/Geometry>
#include "wot_pkg/is_hit.h"
#include <std_msgs_stamped/BoolStamped.h>


geometry_msgs::PoseStamped actual_pose;
geometry_msgs::PoseStamped hit_pose;
double hit_range = 12.0;
visualization_msgs::Marker hit_marker;
std::string vehicle_name;

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
        hit_marker.header = msg -> header;
        hit_marker.id = 0;
        hit_marker.action = visualization_msgs::Marker::ADD;
        hit_marker.lifetime = ros::Duration(1);
        hit_marker.ns = "hit_marker";
        hit_marker.type = visualization_msgs::Marker::SPHERE;
        hit_marker.pose = hit_pose.pose;
        hit_marker.color.r = 1.0;
        hit_marker.color.g = 0.0;
        hit_marker.color.b = 0.0;
        hit_marker.color.a = 1.0;
        hit_marker.scale.x = 0.1;
        hit_marker.scale.y = 0.1;
        hit_marker.scale.z = 0.1;

        hit_viz_pub.publish(hit_marker);


		cal_scan(msg -> header.stamp);
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
    
    ros::NodeHandle n;
    ros::Subscriber scanner;
	ros::Publisher hit_pose_pub;
    ros::Publisher hit_viz_pub;

	tf2_ros::Buffer tfBuffer;
    tf2_ros::TransformListener tfListener;
    tf2_ros::TransformBroadcaster broadcaster;
};

struct visualizer{
    visualizer(ros::NodeHandle n_):n(n_)
    {
        bounding_box_pub = n.advertise<visualization_msgs::Marker>("bounding_box", 1000);
    }
    ~visualizer(){}

    void vis_bounding_box(visualization_msgs::Marker& marker){
        marker.header.stamp = ros::Time();			
        marker.header.frame_id = vehicle_name + "/base_link";			
        marker.action = visualization_msgs::Marker::ADD;			
        marker.lifetime = ros::Duration(0.5);			
        marker.ns = "bounding_box";			
        marker.type = visualization_msgs::Marker::CUBE;			
        marker.pose.position.x = 0;			
        marker.pose.position.y = 0;			
        marker.pose.position.z = 0;		
        marker.pose.orientation.w = 1.0;			
        marker.color.r = 0.0;			
        marker.color.g = 0.0;			
        marker.color.b = 1.0;			
        marker.color.a = 1.0;			
        marker.scale.x = 0.25;			
        marker.scale.y = 0.2;			
        marker.scale.z = 0.55;
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

int main(int argc, char **argv)
{
    ros::init(argc, argv,"vehicle_node");
    ros::NodeHandle n("~");
    tf_pub tf_publisher(n);

    ros::Subscriber shoot_sub = n.subscribe("/" + vehicle_name + "/shooting", 1000, shootCallBack);

    ros::ServiceClient client = n.serviceClient<wot_pkg::is_hit>("/is_hit");
    wot_pkg::is_hit srv;
    srv.request.hit_location = tf_publisher.hitpoint_global;


    ros::Rate r(1);

    visualization_msgs::Marker bounding_box_marker;
    visualizer visualize_bounding_box(n);
    
    
    while (ros::ok())
    {
        visualize_bounding_box.vis_bounding_box(bounding_box_marker);

        if (shoot)
        {
            srv.request.hit_location = tf_publisher.hitpoint_global;
            srv.request.vehicle_name = vehicle_name;
            ros::service::call("/is_hit", srv);
            ROS_INFO("Hit:%d\n", srv.response.is_hit.data);
            
            //client.call(srv);
        }
        else
        {
            ROS_INFO("Not shooting");
        }
        ROS_INFO("%d",shoot);
        ros::spinOnce();
        r.sleep();
    }
    
    return 0;
}