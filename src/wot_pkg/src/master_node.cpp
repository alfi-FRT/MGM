#include <ros/ros.h>
#include <iostream>
#include <std_msgs/String.h>

// Subscriber to the coordinates topic
void coordinatesCallback(const std_msgs::String::ConstPtr& msg)
{
   ROS_INFO("I heard: [%s]", msg->data.c_str());
};


int main(int argc, char **argv)
{
    ros::init(argc, argv, "master_node");
    ros::NodeHandle n;
    ros::Publisher pub = n.advertise<std_msgs::String>("master_topic", 1000);
    ros::Rate r(1);
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