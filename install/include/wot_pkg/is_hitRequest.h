// Generated by gencpp from file wot_pkg/is_hitRequest.msg
// DO NOT EDIT!


#ifndef WOT_PKG_MESSAGE_IS_HITREQUEST_H
#define WOT_PKG_MESSAGE_IS_HITREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <visualization_msgs/Marker.h>
#include <nav_msgs/Odometry.h>

namespace wot_pkg
{
template <class ContainerAllocator>
struct is_hitRequest_
{
  typedef is_hitRequest_<ContainerAllocator> Type;

  is_hitRequest_()
    : hitbox()
    , hit_location()  {
    }
  is_hitRequest_(const ContainerAllocator& _alloc)
    : hitbox(_alloc)
    , hit_location(_alloc)  {
  (void)_alloc;
    }



   typedef  ::visualization_msgs::Marker_<ContainerAllocator>  _hitbox_type;
  _hitbox_type hitbox;

   typedef  ::nav_msgs::Odometry_<ContainerAllocator>  _hit_location_type;
  _hit_location_type hit_location;





  typedef boost::shared_ptr< ::wot_pkg::is_hitRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::wot_pkg::is_hitRequest_<ContainerAllocator> const> ConstPtr;

}; // struct is_hitRequest_

typedef ::wot_pkg::is_hitRequest_<std::allocator<void> > is_hitRequest;

typedef boost::shared_ptr< ::wot_pkg::is_hitRequest > is_hitRequestPtr;
typedef boost::shared_ptr< ::wot_pkg::is_hitRequest const> is_hitRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::wot_pkg::is_hitRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::wot_pkg::is_hitRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::wot_pkg::is_hitRequest_<ContainerAllocator1> & lhs, const ::wot_pkg::is_hitRequest_<ContainerAllocator2> & rhs)
{
  return lhs.hitbox == rhs.hitbox &&
    lhs.hit_location == rhs.hit_location;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::wot_pkg::is_hitRequest_<ContainerAllocator1> & lhs, const ::wot_pkg::is_hitRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace wot_pkg

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::wot_pkg::is_hitRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::wot_pkg::is_hitRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wot_pkg::is_hitRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wot_pkg::is_hitRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wot_pkg::is_hitRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wot_pkg::is_hitRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::wot_pkg::is_hitRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "94c7e6ad96bf8dcff171d5713a8b0458";
  }

  static const char* value(const ::wot_pkg::is_hitRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x94c7e6ad96bf8dcfULL;
  static const uint64_t static_value2 = 0xf171d5713a8b0458ULL;
};

template<class ContainerAllocator>
struct DataType< ::wot_pkg::is_hitRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "wot_pkg/is_hitRequest";
  }

  static const char* value(const ::wot_pkg::is_hitRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::wot_pkg::is_hitRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Request\n"
"visualization_msgs/Marker hitbox\n"
"nav_msgs/Odometry hit_location\n"
"\n"
"\n"
"================================================================================\n"
"MSG: visualization_msgs/Marker\n"
"# See http://www.ros.org/wiki/rviz/DisplayTypes/Marker and http://www.ros.org/wiki/rviz/Tutorials/Markers%3A%20Basic%20Shapes for more information on using this message with rviz\n"
"\n"
"uint8 ARROW=0\n"
"uint8 CUBE=1\n"
"uint8 SPHERE=2\n"
"uint8 CYLINDER=3\n"
"uint8 LINE_STRIP=4\n"
"uint8 LINE_LIST=5\n"
"uint8 CUBE_LIST=6\n"
"uint8 SPHERE_LIST=7\n"
"uint8 POINTS=8\n"
"uint8 TEXT_VIEW_FACING=9\n"
"uint8 MESH_RESOURCE=10\n"
"uint8 TRIANGLE_LIST=11\n"
"\n"
"uint8 ADD=0\n"
"uint8 MODIFY=0\n"
"uint8 DELETE=2\n"
"uint8 DELETEALL=3\n"
"\n"
"Header header                        # header for time/frame information\n"
"string ns                            # Namespace to place this object in... used in conjunction with id to create a unique name for the object\n"
"int32 id 		                         # object ID useful in conjunction with the namespace for manipulating and deleting the object later\n"
"int32 type 		                       # Type of object\n"
"int32 action 	                       # 0 add/modify an object, 1 (deprecated), 2 deletes an object, 3 deletes all objects\n"
"geometry_msgs/Pose pose                 # Pose of the object\n"
"geometry_msgs/Vector3 scale             # Scale of the object 1,1,1 means default (usually 1 meter square)\n"
"std_msgs/ColorRGBA color             # Color [0.0-1.0]\n"
"duration lifetime                    # How long the object should last before being automatically deleted.  0 means forever\n"
"bool frame_locked                    # If this marker should be frame-locked, i.e. retransformed into its frame every timestep\n"
"\n"
"#Only used if the type specified has some use for them (eg. POINTS, LINE_STRIP, ...)\n"
"geometry_msgs/Point[] points\n"
"#Only used if the type specified has some use for them (eg. POINTS, LINE_STRIP, ...)\n"
"#number of colors must either be 0 or equal to the number of points\n"
"#NOTE: alpha is not yet used\n"
"std_msgs/ColorRGBA[] colors\n"
"\n"
"# NOTE: only used for text markers\n"
"string text\n"
"\n"
"# NOTE: only used for MESH_RESOURCE markers\n"
"string mesh_resource\n"
"bool mesh_use_embedded_materials\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"================================================================================\n"
"MSG: std_msgs/ColorRGBA\n"
"float32 r\n"
"float32 g\n"
"float32 b\n"
"float32 a\n"
"\n"
"================================================================================\n"
"MSG: nav_msgs/Odometry\n"
"# This represents an estimate of a position and velocity in free space.  \n"
"# The pose in this message should be specified in the coordinate frame given by header.frame_id.\n"
"# The twist in this message should be specified in the coordinate frame given by the child_frame_id\n"
"Header header\n"
"string child_frame_id\n"
"geometry_msgs/PoseWithCovariance pose\n"
"geometry_msgs/TwistWithCovariance twist\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/PoseWithCovariance\n"
"# This represents a pose in free space with uncertainty.\n"
"\n"
"Pose pose\n"
"\n"
"# Row-major representation of the 6x6 covariance matrix\n"
"# The orientation parameters use a fixed-axis representation.\n"
"# In order, the parameters are:\n"
"# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)\n"
"float64[36] covariance\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/TwistWithCovariance\n"
"# This expresses velocity in free space with uncertainty.\n"
"\n"
"Twist twist\n"
"\n"
"# Row-major representation of the 6x6 covariance matrix\n"
"# The orientation parameters use a fixed-axis representation.\n"
"# In order, the parameters are:\n"
"# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)\n"
"float64[36] covariance\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Twist\n"
"# This expresses velocity in free space broken into its linear and angular parts.\n"
"Vector3  linear\n"
"Vector3  angular\n"
;
  }

  static const char* value(const ::wot_pkg::is_hitRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::wot_pkg::is_hitRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.hitbox);
      stream.next(m.hit_location);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct is_hitRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::wot_pkg::is_hitRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::wot_pkg::is_hitRequest_<ContainerAllocator>& v)
  {
    s << indent << "hitbox: ";
    s << std::endl;
    Printer< ::visualization_msgs::Marker_<ContainerAllocator> >::stream(s, indent + "  ", v.hitbox);
    s << indent << "hit_location: ";
    s << std::endl;
    Printer< ::nav_msgs::Odometry_<ContainerAllocator> >::stream(s, indent + "  ", v.hit_location);
  }
};

} // namespace message_operations
} // namespace ros

#endif // WOT_PKG_MESSAGE_IS_HITREQUEST_H