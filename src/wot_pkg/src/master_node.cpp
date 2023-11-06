#include <ros/ros.h>
#include <iostream>
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
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


struct tf_pub{

    tf_pub(ros::NodeHandle n_):n(n_),tfListener(tfBuffer)
    {
        
		
	}
	~tf_pub(){}

    geometry_msgs::PoseStamped hitpoint_relative;


    geometry_msgs::PoseStamped cal_odom(ros::Time tmstamp, std_msgs::Int32 i){
        std::string target_frame = "map";
        std::string vehicle_number = std::to_string(i.data+1);
        std::string source_frame = "vehicle" + vehicle_number + "/base_link";
        if (tfBuffer.canTransform(source_frame,
                            target_frame,
                            tmstamp,
                            ros::Duration(0.01)))
        {
        // Getting the transformation
        auto trans_world2baselink = tfBuffer.lookupTransform(source_frame,
                                                    target_frame,
                                                    tmstamp);           
        geometry_msgs::PoseStamped transformed_point;
        transformed_point.pose.position.x = 0.0;
        transformed_point.pose.position.y = 0.0;
        transformed_point.pose.position.z = 0.0;
        transformed_point.pose.orientation.w = 1.0;
        tf2::doTransform(transformed_point, transformed_point, trans_world2baselink);
                
        
        hitpoint_relative.header = trans_world2baselink.header;
        
        hitpoint_relative.pose = transformed_point.pose;
        return hitpoint_relative;    
        }
        return hitpoint_relative;
    }	

    geometry_msgs::PoseStamped callback_odom( geometry_msgs::PoseStamped msg, std_msgs::Int32 i){
        
        geometry_msgs::TransformStamped tf_stamped;
        tf_stamped.header = msg.header;
        
        

        tf_stamped.transform.translation.x = msg.pose.position.x;
        tf_stamped.transform.translation.y = msg.pose.position.y;
        tf_stamped.transform.translation.z = msg.pose.position.z;
    
        tf_stamped.transform.rotation = msg.pose.orientation;
        
        broadcaster.sendTransform(tf_stamped);

        return cal_odom(msg.header.stamp, i);
    }

    int whichHit( geometry_msgs::PoseStamped hit_location, visualization_msgs::MarkerArray hitboxes) 
    {
        std_msgs::Int32 std_i;
        int i = 0;
        geometry_msgs::PoseStamped hit_location_value = hit_location;
        for (auto hitbox : hitboxes.markers) {
            std_i.data = i;
            auto hit_base = callback_odom(hit_location_value, std_i);
            if(hit_base.pose.position.x <= hitbox.pose.position.x + hitbox.scale.x/2 && hit_base.pose.position.x >= hitbox.pose.position.x - hitbox.scale.x/2 && 
            hit_base.pose.position.y <= hitbox.pose.position.y + hitbox.scale.y/2 && hit_base.pose.position.y >= hitbox.pose.position.y - hitbox.scale.y/2 && 
            hit_base.pose.position.z <= hitbox.pose.position.z + hitbox.scale.z/2 && hit_base.pose.position.z >= hitbox.pose.position.z - hitbox.scale.z/2)
                {
                    return i+1;
                }
            i++;
        }
        return -1;
    }

    visualization_msgs::MarkerArray global_marker_array;

    void markerCallback(const visualization_msgs::Marker::ConstPtr& msg )
    {
        global_marker_array.markers.push_back(*msg);
    }

    bool isHit(wot_pkg::is_hit::Request &req, wot_pkg::is_hit::Response &res)
    {
        res.is_hit.data = whichHit(req.hit_location, global_marker_array);
        ROS_INFO("%d",res.is_hit.data);
        return true;
    }

    tf2_ros::Buffer tfBuffer;
    tf2_ros::TransformBroadcaster broadcaster;
    
    ros::NodeHandle n;
    ros::Publisher pub;
    tf2_ros::TransformListener tfListener;

};

// Subscriber to the coordinates topic
void coordinatesCallback(const std_msgs::String::ConstPtr& msg)
{
   ROS_INFO("I heard: [%s]", msg->data.c_str());
}



int main(int argc, char **argv)
{
    ros::init(argc, argv, "master_node");
    ros::NodeHandle n("~");
    tf_pub hp_tf(n);
    ros::Publisher pub = n.advertise<std_msgs::String>("master_topic", 1000);
    std::vector<ros::Subscriber> subs(2);
        for(int i = 0; i < 2; i++){
            std::string vehicle_number = std::to_string(i+1);
            std::string topic_name = "/vehicle" + vehicle_number + "/visualization_marker";
            subs[i] = n.subscribe(topic_name, 1000, &tf_pub::markerCallback, &hp_tf);
        }
    ros::ServiceServer service = n.advertiseService("/is_hit", &tf_pub::isHit, &hp_tf);
    
    ros::Rate r(100);
    while (ros::ok())
    {
        std_msgs::String msg;
        msg.data = "Itt vagyok!";
        pub.publish(msg);
        ros::Subscriber sub = n.subscribe("coordinates", 1000, coordinatesCallback);
        ros::spinOnce();
        r.sleep();
    }
    return 0;
}