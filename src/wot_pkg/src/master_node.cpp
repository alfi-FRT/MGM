#include <ros/ros.h>
#include <iostream>
#include <std_msgs/String.h>

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
        ros::spinOnce();
        r.sleep();
    }
    return 0;
}