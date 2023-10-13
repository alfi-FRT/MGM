#include <ros/ros.h>
#include <iostream>
#include <std_msgs/String.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/PoseStamped.h>
#include <visualization_msgs/Marker.h>
#include <sensor_msgs/LaserScan.h>
#include <tf/transform_datatypes.h>

geometry_msgs::PoseStamped actual_pose;
geometry_msgs::PoseStamped hit_pose;
double hit_range = 12.0;
visualization_msgs::Marker hit_marker;



void odomCallBack(const nav_msgs::Odometry msg)
{		
    actual_pose.pose = msg.pose.pose;
}

void scanCallBack(const sensor_msgs::LaserScan msg)
{		
    for (int i = 0; i <= 4 ; i++)
    {
        if (msg.ranges[i] < hit_range && msg.ranges[i] > 0.1)
        {
            hit_range = msg.ranges[i];
        }
    }
    for (int i= msg.ranges.size()-4; i <= msg.ranges.size(); i++)
    {
        if (msg.ranges[i] < hit_range && msg.ranges[i] > 0.1)
        {
            hit_range = msg.ranges[i];
        }
    }
    hit_pose.pose.position.x = - hit_range ;
    hit_pose.pose.position.y = 0;
    hit_pose.pose.position.z = 0;
    hit_pose.pose.orientation.w = 1.0; 
    hit_marker.header = msg.header;
    hit_marker.id = 0;
    hit_marker.action = visualization_msgs::Marker::ADD;
    hit_marker.lifetime = ros::Duration(0.1);
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
    ros::Publisher pub = n.advertise<geometry_msgs::PoseStamped>(pose_topic_name, 1000);   
    ros::Publisher vis_pub = n.advertise<visualization_msgs::Marker>( "visualization_marker", 0 );
    ros::Subscriber scanner = n.subscribe("/" + vehicle_name + "/scan", 1000, scanCallBack);
    ros::Publisher hit_pub = n.advertise<visualization_msgs::Marker>("hit_pose", 1000);
    ros::Rate r(10);

    visualization_msgs::Marker cluster_marker;
    cluster_marker.header.stamp = ros::Time();			
    cluster_marker.header.frame_id = vehicle_name + "/base_link";			
    cluster_marker.action = visualization_msgs::Marker::ADD;			
    cluster_marker.lifetime = ros::Duration(0.5);			
    cluster_marker.ns = "bounding_box";			
    cluster_marker.type = visualization_msgs::Marker::CUBE;			
    cluster_marker.pose.position.x = 0;			
    cluster_marker.pose.position.y = 0;			
    cluster_marker.pose.position.z = 0;		
    cluster_marker.pose.orientation.w = 1.0;			
    cluster_marker.color.r = 0.0;			
    cluster_marker.color.g = 0.0;			
    cluster_marker.color.b = 1.0;			
    cluster_marker.color.a = 1.0;			
    cluster_marker.scale.x = 0.25;			
    cluster_marker.scale.y = 0.2;			
    cluster_marker.scale.z = 0.15;


    while (ros::ok())
    {
       
        geometry_msgs::PoseStamped msg;
        msg.pose = actual_pose.pose;
        pub.publish(msg);           
        vis_pub.publish(cluster_marker);
        hit_pub.publish(hit_marker);
        ROS_INFO("I heard: [%f]", hit_range);
        
        ros::spinOnce();
        r.sleep();
    }
    
    return 0;
}