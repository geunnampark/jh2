// Generated by gencpp from file morai_msgs/EgoVehicleStatus.msg
// DO NOT EDIT!


#ifndef MORAI_MSGS_MESSAGE_EGOVEHICLESTATUS_H
#define MORAI_MSGS_MESSAGE_EGOVEHICLESTATUS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace morai_msgs
{
template <class ContainerAllocator>
struct EgoVehicleStatus_
{
  typedef EgoVehicleStatus_<ContainerAllocator> Type;

  EgoVehicleStatus_()
    : pose_x(0.0)
    , pose_y(0.0)
    , pose_z(0.0)
    , heading(0.0)
    , velocity(0.0)  {
    }
  EgoVehicleStatus_(const ContainerAllocator& _alloc)
    : pose_x(0.0)
    , pose_y(0.0)
    , pose_z(0.0)
    , heading(0.0)
    , velocity(0.0)  {
  (void)_alloc;
    }



   typedef double _pose_x_type;
  _pose_x_type pose_x;

   typedef double _pose_y_type;
  _pose_y_type pose_y;

   typedef double _pose_z_type;
  _pose_z_type pose_z;

   typedef double _heading_type;
  _heading_type heading;

   typedef double _velocity_type;
  _velocity_type velocity;





  typedef boost::shared_ptr< ::morai_msgs::EgoVehicleStatus_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::morai_msgs::EgoVehicleStatus_<ContainerAllocator> const> ConstPtr;

}; // struct EgoVehicleStatus_

typedef ::morai_msgs::EgoVehicleStatus_<std::allocator<void> > EgoVehicleStatus;

typedef boost::shared_ptr< ::morai_msgs::EgoVehicleStatus > EgoVehicleStatusPtr;
typedef boost::shared_ptr< ::morai_msgs::EgoVehicleStatus const> EgoVehicleStatusConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::morai_msgs::EgoVehicleStatus_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::morai_msgs::EgoVehicleStatus_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::morai_msgs::EgoVehicleStatus_<ContainerAllocator1> & lhs, const ::morai_msgs::EgoVehicleStatus_<ContainerAllocator2> & rhs)
{
  return lhs.pose_x == rhs.pose_x &&
    lhs.pose_y == rhs.pose_y &&
    lhs.pose_z == rhs.pose_z &&
    lhs.heading == rhs.heading &&
    lhs.velocity == rhs.velocity;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::morai_msgs::EgoVehicleStatus_<ContainerAllocator1> & lhs, const ::morai_msgs::EgoVehicleStatus_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace morai_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::morai_msgs::EgoVehicleStatus_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::morai_msgs::EgoVehicleStatus_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::morai_msgs::EgoVehicleStatus_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::morai_msgs::EgoVehicleStatus_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::morai_msgs::EgoVehicleStatus_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::morai_msgs::EgoVehicleStatus_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::morai_msgs::EgoVehicleStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6c83b1d1a60dcab36fb22e0cc1f8f2aa";
  }

  static const char* value(const ::morai_msgs::EgoVehicleStatus_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6c83b1d1a60dcab3ULL;
  static const uint64_t static_value2 = 0x6fb22e0cc1f8f2aaULL;
};

template<class ContainerAllocator>
struct DataType< ::morai_msgs::EgoVehicleStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "morai_msgs/EgoVehicleStatus";
  }

  static const char* value(const ::morai_msgs::EgoVehicleStatus_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::morai_msgs::EgoVehicleStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 pose_x\n"
"float64 pose_y\n"
"float64 pose_z\n"
"float64 heading\n"
"float64 velocity\n"
"\n"
;
  }

  static const char* value(const ::morai_msgs::EgoVehicleStatus_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::morai_msgs::EgoVehicleStatus_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.pose_x);
      stream.next(m.pose_y);
      stream.next(m.pose_z);
      stream.next(m.heading);
      stream.next(m.velocity);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct EgoVehicleStatus_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::morai_msgs::EgoVehicleStatus_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::morai_msgs::EgoVehicleStatus_<ContainerAllocator>& v)
  {
    s << indent << "pose_x: ";
    Printer<double>::stream(s, indent + "  ", v.pose_x);
    s << indent << "pose_y: ";
    Printer<double>::stream(s, indent + "  ", v.pose_y);
    s << indent << "pose_z: ";
    Printer<double>::stream(s, indent + "  ", v.pose_z);
    s << indent << "heading: ";
    Printer<double>::stream(s, indent + "  ", v.heading);
    s << indent << "velocity: ";
    Printer<double>::stream(s, indent + "  ", v.velocity);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MORAI_MSGS_MESSAGE_EGOVEHICLESTATUS_H
