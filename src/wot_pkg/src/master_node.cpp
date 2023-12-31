#include <ros/ros.h>
#include <iostream>
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
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
#include <std_msgs_stamped/Int32Stamped.h>


struct tf_pub{

    tf_pub(ros::NodeHandle n_):n(n_),tfListener(tfBuffer)
    {
        scoreboard_pub = n.advertise<std_msgs::String>("scoreboard", 1000);
	}
	~tf_pub(){}

    geometry_msgs::PoseStamped hitpoint_relative;
    int scores[2] = {0,0};

    geometry_msgs::PoseStamped tf_hitpoint(geometry_msgs::PoseStamped msg, ros::Time tmstamp, std_msgs::Int32 i){
        std::string vehicle_number = std::to_string(i.data+1);
        if (tfBuffer.canTransform("vehicle" + vehicle_number + "/base_link",
                            "map",
                            tmstamp,
                            ros::Duration(0.01)))
        {
        // Getting the transformation
        auto trans_world2baselink = tfBuffer.lookupTransform("vehicle" + vehicle_number + "/base_link",
                                                    "map",
                                                    tmstamp);
                   
        tf2::doTransform(msg, hitpoint_relative, trans_world2baselink);
                
        return hitpoint_relative;    
        }
        return hitpoint_relative;
    }	

    int whichHit( geometry_msgs::PoseStamped hit_location, visualization_msgs::MarkerArray hitboxes) 
    {
        std_msgs::Int32 std_i;
        int i = 0;
        geometry_msgs::PoseStamped hit_location_value = hit_location;
        for (auto hitbox : hitboxes.markers) {
            std_i.data = i;
            auto hit_base = tf_hitpoint(hit_location_value, ros::Time(), std_i);

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
        auto i = msg -> id;
        global_marker_array.markers.push_back(*msg);
        if(global_marker_array.markers.size() > 1){
            for (int j = 0; j < global_marker_array.markers.size()-1; j++){
                if (global_marker_array.markers[j].id == i){
                    global_marker_array.markers.erase(global_marker_array.markers.begin()+j);
                }
            }
        }
    }

    bool isHit(wot_pkg::is_hit::Request &req, wot_pkg::is_hit::Response &res)
    {
        res.is_hit.data = whichHit(req.hit_location, global_marker_array);
        return true;
    }

    void displayScoreboard(std_msgs_stamped::Int32Stamped msg)
    {
        if (msg.header.frame_id == "vehicle1"){
            scores[0] = msg.data;
        }
        else if (msg.header.frame_id == "vehicle2"){
            scores[1] = msg.data;
        }
        scoreboard.data = "The current score is: Player 1: " + std::to_string(scores[0]) + " Player 2: " + std::to_string(scores[1]);
        scoreboard_pub.publish(scoreboard);
    }

    tf2_ros::Buffer tfBuffer;
    tf2_ros::TransformBroadcaster broadcaster;
    
    ros::NodeHandle n;
    ros::Publisher scoreboard_pub;
    tf2_ros::TransformListener tfListener;
    std_msgs::String scoreboard;

};


int main(int argc, char **argv)
{
    ros::init(argc, argv, "master_node");
    ros::NodeHandle n("~");
    tf_pub hp_tf(n);
    std::vector<ros::Subscriber> subs(2);
    std::vector<ros::Subscriber> hit_subs(2);
        for(int i = 0; i < subs.size(); i++){
            std::string vehicle_number = std::to_string(i+1);
            std::string topic_name = "/vehicle" + vehicle_number + "/bounding_box";
            subs[i] = n.subscribe(topic_name, 1000, &tf_pub::markerCallback, &hp_tf);
            hit_subs[i] = n.subscribe("/vehicle" + vehicle_number + "/hit_count", 1000, &tf_pub::displayScoreboard, &hp_tf);
        }
    ros::ServiceServer service = n.advertiseService("/is_hit", &tf_pub::isHit, &hp_tf);

    
    ros::Rate r(100);
    while (ros::ok())
    {
        ros::spinOnce();
        r.sleep();
    }
    return 0;
}