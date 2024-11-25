// Generated by gencpp from file morai_msgs/EgoVehicleVelocity.msg
// DO NOT EDIT!


#ifndef MORAI_MSGS_MESSAGE_EGOVEHICLEVELOCITY_H
#define MORAI_MSGS_MESSAGE_EGOVEHICLEVELOCITY_H


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
struct EgoVehicleVelocity_
{
  typedef EgoVehicleVelocity_<ContainerAllocator> Type;

  EgoVehicleVelocity_()
    : velocity(0.0)  {
    }
  EgoVehicleVelocity_(const ContainerAllocator& _alloc)
    : velocity(0.0)  {
  (void)_alloc;
    }



   typedef double _velocity_type;
  _velocity_type velocity;





  typedef boost::shared_ptr< ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator> const> ConstPtr;

}; // struct EgoVehicleVelocity_

typedef ::morai_msgs::EgoVehicleVelocity_<std::allocator<void> > EgoVehicleVelocity;

typedef boost::shared_ptr< ::morai_msgs::EgoVehicleVelocity > EgoVehicleVelocityPtr;
typedef boost::shared_ptr< ::morai_msgs::EgoVehicleVelocity const> EgoVehicleVelocityConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator1> & lhs, const ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator2> & rhs)
{
  return lhs.velocity == rhs.velocity;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator1> & lhs, const ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace morai_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6d3b2ef8452c2fe21adb709618d2518f";
  }

  static const char* value(const ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6d3b2ef8452c2fe2ULL;
  static const uint64_t static_value2 = 0x1adb709618d2518fULL;
};

template<class ContainerAllocator>
struct DataType< ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator> >
{
  static const char* value()
  {
    return "morai_msgs/EgoVehicleVelocity";
  }

  static const char* value(const ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 velocity\n"
;
  }

  static const char* value(const ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.velocity);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct EgoVehicleVelocity_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::morai_msgs::EgoVehicleVelocity_<ContainerAllocator>& v)
  {
    s << indent << "velocity: ";
    Printer<double>::stream(s, indent + "  ", v.velocity);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MORAI_MSGS_MESSAGE_EGOVEHICLEVELOCITY_H
