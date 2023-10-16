#include <ros/ros.h>
#include <iostream>
#include <std_msgs/String.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/TransformStamped.h>
#include <visualization_msgs/Marker.h>
#include <sensor_msgs/LaserScan.h>
#include <tf/transform_datatypes.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_ros/transform_broadcaster.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <Eigen/Core>
#include <Eigen/Geometry>
#include "wot_pkg/is_hit.h"


// Subscriber to the coordinates topic
void coordinatesCallback(const std_msgs::String::ConstPtr& msg)
{
   ROS_INFO("I heard: [%s]", msg->data.c_str());
};

bool isHit(wot_pkg::is_hit::Request &req, wot_pkg::is_hit::Response &res)) {
   
    Eigen::Vector3d point_eigen(req.hit_location.pose.position.x, req.hit_location.pose.position.y, req.hit_location.pose.position.z);
    Eigen::Vector3d box_center(req.hitbox.pose.position.x, req.hitbox.pose.position.y, req.hitbox.pose.position.z);

    Eigen::Vector3d half_lengths(box.scale.x / 2.0, box.scale.y / 2.0, box.scale.z / 2.0);

    Eigen::Quaterniond box_rotation(box.pose.orientation.w, box.pose.orientation.x, box.pose.orientation.y, box.pose.orientation.z);
  
    Eigen::Vector3d rel_pos = box_rotation.inverse() * (point_eigen - box_center);

    res.is_hit =  (std::abs(rel_pos.x()) <= half_lengths.x() && std::abs(rel_pos.y()) <= half_lengths.y() && std::abs(rel_pos.z()) <= half_lengths.z());

    return true;
}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "master_node");
    ros::NodeHandle n;
    ros::Publisher pub = n.advertise<std_msgs::String>("master_topic", 1000);
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