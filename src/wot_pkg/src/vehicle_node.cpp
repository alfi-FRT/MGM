#include <ros/ros.h>
#include <iostream>
#include <std_msgs/String.h>

int main(int argc, char **argv)
{
    ros::init(argc, argv, "vehicle_node");
    ros::NodeHandle n;
    ros::Publisher pub = n.advertise<std_msgs::String>("coordinates", 1000);
    ros::Rate r(1);
    while (ros::ok())
    {
        std_msgs::String msg;
        msg.data = "Koordinataim: x y";
        pub.publish(msg);
        ros::spinOnce();
        r.sleep();
    }
    return 0;
}