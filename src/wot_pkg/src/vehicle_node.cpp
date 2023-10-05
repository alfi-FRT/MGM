#include <ros/ros.h>
#include <iostream>
#include <std_msgs/String.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/PoseStamped.h>

geometry_msgs::PoseStamped actual_pose;


void odomCallBack(const nav_msgs::Odometry msg)
	{
		
        actual_pose.pose = msg.pose.pose;

	}


int main(int argc, char **argv)
{
    ros::init(argc, argv,"vehicle_node");
    ros::NodeHandle n("~");
    std::string vehicle_name;
    n.getParam("vehicle_name", vehicle_name);
    std::string odom_topic_name;
    std::string pose_topic_name;
    n.param<std::string>("/" + vehicle_name + "/odom/ground_truth" , odom_topic_name, "/" + vehicle_name + "/odom/ground_truth");
    n.param<std::string>("/" + vehicle_name + "/position" , pose_topic_name, "/" + vehicle_name + "/position");

    ros::Subscriber sub = n.subscribe(odom_topic_name, 1000, odomCallBack);
    ros::Publisher pub = n.advertise<nav_msgs::Odometry>(pose_topic_name, 1000);        
    ros::Rate r(10);

    while (ros::ok())
    {
       
        geometry_msgs::PoseStamped msg;
        msg.pose = actual_pose.pose;
        pub.publish(msg);           
        

        ros::spinOnce();
        r.sleep();
    }
    
    return 0;
}