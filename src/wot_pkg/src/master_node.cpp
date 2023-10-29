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

    tf2_ros::Buffer tfBuffer;
    tf2_ros::TransformBroadcaster broadcaster;
    nav_msgs::Odometry hitpoint_relative;
    ros::NodeHandle n;
    ros::Publisher pub;
    tf2_ros::TransformListener tfListener;



    nav_msgs::Odometry cal_odom(ros::Time tmstamp, std_msgs::Int32 i){
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
        hitpoint_relative.child_frame_id = trans_world2baselink.child_frame_id;
        hitpoint_relative.pose.pose = transformed_point.pose;
        return hitpoint_relative;    
        }
        return hitpoint_relative;
    }	

    nav_msgs::Odometry callback_odom( nav_msgs::Odometry msg, std_msgs::Int32 i){
        
        geometry_msgs::TransformStamped tf_stamped;
        tf_stamped.header = msg.header;
        tf_stamped.child_frame_id = msg.child_frame_id;
        

        tf_stamped.transform.translation.x = msg.pose.pose.position.x;
        tf_stamped.transform.translation.y = msg.pose.pose.position.y;
        tf_stamped.transform.translation.z = msg.pose.pose.position.z;
    
        tf_stamped.transform.rotation = msg.pose.pose.orientation;
        
        broadcaster.sendTransform(tf_stamped);

        return cal_odom(msg.header.stamp, i);
    }

    int whichHit(const nav_msgs::Odometry::ConstPtr& hit_location, const visualization_msgs::MarkerArray::ConstPtr& hitboxes) 
    {
        std_msgs::Int32 std_i;
        int i = 0;
        nav_msgs::Odometry hit_location_value = *hit_location;
        for (auto hitbox : hitboxes->markers) {
            std_i.data = i;
            auto hit_base = callback_odom(hit_location_value, std_i);
            if(hit_base.pose.pose.position.x <= hitbox.pose.position.x + hitbox.scale.x/2 && hit_base.pose.pose.position.x >= hitbox.pose.position.x - hitbox.scale.x/2 && 
            hit_base.pose.pose.position.y <= hitbox.pose.position.y + hitbox.scale.y/2 && hit_base.pose.pose.position.y >= hitbox.pose.position.y - hitbox.scale.y/2 && 
            hit_base.pose.pose.position.z <= hitbox.pose.position.z + hitbox.scale.z/2 && hit_base.pose.pose.position.z >= hitbox.pose.position.z - hitbox.scale.z/2)
                {
                    return i+1;
                }
            i++;
        }
        return -1;
    }
};

// Subscriber to the coordinates topic
void coordinatesCallback(const std_msgs::String::ConstPtr& msg)
{
   ROS_INFO("I heard: [%s]", msg->data.c_str());
}


bool isHit(wot_pkg::is_hit::Request &req, wot_pkg::is_hit::Response &res)
{

    res.is_hit.data = 0;
    return true;
}






int main(int argc, char **argv)
{
    ros::init(argc, argv, "master_node");
    ros::NodeHandle n("~");
    tf_pub tf_pub(n);
    ros::Publisher pub = n.advertise<std_msgs::String>("master_topic", 1000);
    /*
    for(int i = 0; i < 3; i++){
        std::string vehicle_number = std::to_string(i+1);
        std::string topic_name = "vehicle" + vehicle_number + "/visualization_marker";
        ros::Subscriber sub = n.subscribe(topic_name, 1000, coordinatesCallback);
    }*/
    ros::ServiceServer service = n.advertiseService("is_hit", isHit);
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