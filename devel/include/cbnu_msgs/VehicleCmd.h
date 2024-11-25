// Generated by gencpp from file cbnu_msgs/VehicleCmd.msg
// DO NOT EDIT!


#ifndef CBNU_MSGS_MESSAGE_VEHICLECMD_H
#define CBNU_MSGS_MESSAGE_VEHICLECMD_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace cbnu_msgs
{
template <class ContainerAllocator>
struct VehicleCmd_
{
  typedef VehicleCmd_<ContainerAllocator> Type;

  VehicleCmd_()
    : longlCmdType(0)
    , accel(0.0)
    , brake(0.0)
    , steering(0.0)
    , velocity(0.0)
    , acceleration(0.0)
    , gear_cmd(0)  {
    }
  VehicleCmd_(const ContainerAllocator& _alloc)
    : longlCmdType(0)
    , accel(0.0)
    , brake(0.0)
    , steering(0.0)
    , velocity(0.0)
    , acceleration(0.0)
    , gear_cmd(0)  {
  (void)_alloc;
    }



   typedef int32_t _longlCmdType_type;
  _longlCmdType_type longlCmdType;

   typedef double _accel_type;
  _accel_type accel;

   typedef double _brake_type;
  _brake_type brake;

   typedef double _steering_type;
  _steering_type steering;

   typedef double _velocity_type;
  _velocity_type velocity;

   typedef double _acceleration_type;
  _acceleration_type acceleration;

   typedef int32_t _gear_cmd_type;
  _gear_cmd_type gear_cmd;





  typedef boost::shared_ptr< ::cbnu_msgs::VehicleCmd_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cbnu_msgs::VehicleCmd_<ContainerAllocator> const> ConstPtr;

}; // struct VehicleCmd_

typedef ::cbnu_msgs::VehicleCmd_<std::allocator<void> > VehicleCmd;

typedef boost::shared_ptr< ::cbnu_msgs::VehicleCmd > VehicleCmdPtr;
typedef boost::shared_ptr< ::cbnu_msgs::VehicleCmd const> VehicleCmdConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cbnu_msgs::VehicleCmd_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cbnu_msgs::VehicleCmd_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cbnu_msgs::VehicleCmd_<ContainerAllocator1> & lhs, const ::cbnu_msgs::VehicleCmd_<ContainerAllocator2> & rhs)
{
  return lhs.longlCmdType == rhs.longlCmdType &&
    lhs.accel == rhs.accel &&
    lhs.brake == rhs.brake &&
    lhs.steering == rhs.steering &&
    lhs.velocity == rhs.velocity &&
    lhs.acceleration == rhs.acceleration &&
    lhs.gear_cmd == rhs.gear_cmd;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cbnu_msgs::VehicleCmd_<ContainerAllocator1> & lhs, const ::cbnu_msgs::VehicleCmd_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cbnu_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::cbnu_msgs::VehicleCmd_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cbnu_msgs::VehicleCmd_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cbnu_msgs::VehicleCmd_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cbnu_msgs::VehicleCmd_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cbnu_msgs::VehicleCmd_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cbnu_msgs::VehicleCmd_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cbnu_msgs::VehicleCmd_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bc5dabc414df130ec3a9ba0a4c5344ce";
  }

  static const char* value(const ::cbnu_msgs::VehicleCmd_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xbc5dabc414df130eULL;
  static const uint64_t static_value2 = 0xc3a9ba0a4c5344ceULL;
};

template<class ContainerAllocator>
struct DataType< ::cbnu_msgs::VehicleCmd_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cbnu_msgs/VehicleCmd";
  }

  static const char* value(const ::cbnu_msgs::VehicleCmd_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cbnu_msgs::VehicleCmd_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 longlCmdType\n"
"float64 accel\n"
"float64 brake\n"
"float64 steering\n"
"float64 velocity\n"
"float64 acceleration\n"
"int32 gear_cmd\n"
"\n"
"\n"
"\n"
;
  }

  static const char* value(const ::cbnu_msgs::VehicleCmd_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cbnu_msgs::VehicleCmd_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.longlCmdType);
      stream.next(m.accel);
      stream.next(m.brake);
      stream.next(m.steering);
      stream.next(m.velocity);
      stream.next(m.acceleration);
      stream.next(m.gear_cmd);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct VehicleCmd_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cbnu_msgs::VehicleCmd_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cbnu_msgs::VehicleCmd_<ContainerAllocator>& v)
  {
    s << indent << "longlCmdType: ";
    Printer<int32_t>::stream(s, indent + "  ", v.longlCmdType);
    s << indent << "accel: ";
    Printer<double>::stream(s, indent + "  ", v.accel);
    s << indent << "brake: ";
    Printer<double>::stream(s, indent + "  ", v.brake);
    s << indent << "steering: ";
    Printer<double>::stream(s, indent + "  ", v.steering);
    s << indent << "velocity: ";
    Printer<double>::stream(s, indent + "  ", v.velocity);
    s << indent << "acceleration: ";
    Printer<double>::stream(s, indent + "  ", v.acceleration);
    s << indent << "gear_cmd: ";
    Printer<int32_t>::stream(s, indent + "  ", v.gear_cmd);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CBNU_MSGS_MESSAGE_VEHICLECMD_H