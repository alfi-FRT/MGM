// Generated by gencpp from file std_msgs_stamped/DurationStamped.msg
// DO NOT EDIT!


#ifndef STD_MSGS_STAMPED_MESSAGE_DURATIONSTAMPED_H
#define STD_MSGS_STAMPED_MESSAGE_DURATIONSTAMPED_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace std_msgs_stamped
{
template <class ContainerAllocator>
struct DurationStamped_
{
  typedef DurationStamped_<ContainerAllocator> Type;

  DurationStamped_()
    : header()
    , data()  {
    }
  DurationStamped_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , data()  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef ros::Duration _data_type;
  _data_type data;





  typedef boost::shared_ptr< ::std_msgs_stamped::DurationStamped_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::std_msgs_stamped::DurationStamped_<ContainerAllocator> const> ConstPtr;

}; // struct DurationStamped_

typedef ::std_msgs_stamped::DurationStamped_<std::allocator<void> > DurationStamped;

typedef boost::shared_ptr< ::std_msgs_stamped::DurationStamped > DurationStampedPtr;
typedef boost::shared_ptr< ::std_msgs_stamped::DurationStamped const> DurationStampedConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::std_msgs_stamped::DurationStamped_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::std_msgs_stamped::DurationStamped_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::std_msgs_stamped::DurationStamped_<ContainerAllocator1> & lhs, const ::std_msgs_stamped::DurationStamped_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.data == rhs.data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::std_msgs_stamped::DurationStamped_<ContainerAllocator1> & lhs, const ::std_msgs_stamped::DurationStamped_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace std_msgs_stamped

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::std_msgs_stamped::DurationStamped_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::std_msgs_stamped::DurationStamped_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::std_msgs_stamped::DurationStamped_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::std_msgs_stamped::DurationStamped_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::std_msgs_stamped::DurationStamped_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::std_msgs_stamped::DurationStamped_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::std_msgs_stamped::DurationStamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8db2469c4985fab04e25ff97f58b4251";
  }

  static const char* value(const ::std_msgs_stamped::DurationStamped_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8db2469c4985fab0ULL;
  static const uint64_t static_value2 = 0x4e25ff97f58b4251ULL;
};

template<class ContainerAllocator>
struct DataType< ::std_msgs_stamped::DurationStamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs_stamped/DurationStamped";
  }

  static const char* value(const ::std_msgs_stamped::DurationStamped_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::std_msgs_stamped::DurationStamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"duration data\n"
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
;
  }

  static const char* value(const ::std_msgs_stamped::DurationStamped_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::std_msgs_stamped::DurationStamped_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DurationStamped_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::std_msgs_stamped::DurationStamped_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::std_msgs_stamped::DurationStamped_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "data: ";
    Printer<ros::Duration>::stream(s, indent + "  ", v.data);
  }
};

} // namespace message_operations
} // namespace ros

#endif // STD_MSGS_STAMPED_MESSAGE_DURATIONSTAMPED_H
