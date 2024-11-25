// Generated by gencpp from file morai_msgs/GuideData.msg
// DO NOT EDIT!


#ifndef MORAI_MSGS_MESSAGE_GUIDEDATA_H
#define MORAI_MSGS_MESSAGE_GUIDEDATA_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace morai_msgs
{
template <class ContainerAllocator>
struct GuideData_
{
  typedef GuideData_<ContainerAllocator> Type;

  GuideData_()
    : header()
    , velocity(0.0)
    , steering(0.0)  {
    }
  GuideData_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , velocity(0.0)
    , steering(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef double _velocity_type;
  _velocity_type velocity;

   typedef double _steering_type;
  _steering_type steering;





  typedef boost::shared_ptr< ::morai_msgs::GuideData_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::morai_msgs::GuideData_<ContainerAllocator> const> ConstPtr;

}; // struct GuideData_

typedef ::morai_msgs::GuideData_<std::allocator<void> > GuideData;

typedef boost::shared_ptr< ::morai_msgs::GuideData > GuideDataPtr;
typedef boost::shared_ptr< ::morai_msgs::GuideData const> GuideDataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::morai_msgs::GuideData_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::morai_msgs::GuideData_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::morai_msgs::GuideData_<ContainerAllocator1> & lhs, const ::morai_msgs::GuideData_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.velocity == rhs.velocity &&
    lhs.steering == rhs.steering;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::morai_msgs::GuideData_<ContainerAllocator1> & lhs, const ::morai_msgs::GuideData_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace morai_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::morai_msgs::GuideData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::morai_msgs::GuideData_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::morai_msgs::GuideData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::morai_msgs::GuideData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::morai_msgs::GuideData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::morai_msgs::GuideData_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::morai_msgs::GuideData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6e224df9b6a22dcc05977bd5760e7fac";
  }

  static const char* value(const ::morai_msgs::GuideData_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6e224df9b6a22dccULL;
  static const uint64_t static_value2 = 0x05977bd5760e7facULL;
};

template<class ContainerAllocator>
struct DataType< ::morai_msgs::GuideData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "morai_msgs/GuideData";
  }

  static const char* value(const ::morai_msgs::GuideData_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::morai_msgs::GuideData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"\n"
"float64 velocity\n"
"float64 steering\n"
"\n"
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

  static const char* value(const ::morai_msgs::GuideData_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::morai_msgs::GuideData_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.velocity);
      stream.next(m.steering);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GuideData_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::morai_msgs::GuideData_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::morai_msgs::GuideData_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "velocity: ";
    Printer<double>::stream(s, indent + "  ", v.velocity);
    s << indent << "steering: ";
    Printer<double>::stream(s, indent + "  ", v.steering);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MORAI_MSGS_MESSAGE_GUIDEDATA_H
