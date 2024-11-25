// Generated by gencpp from file cbnu_msgs/VehicleTlm.msg
// DO NOT EDIT!


#ifndef CBNU_MSGS_MESSAGE_VEHICLETLM_H
#define CBNU_MSGS_MESSAGE_VEHICLETLM_H


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
struct VehicleTlm_
{
  typedef VehicleTlm_<ContainerAllocator> Type;

  VehicleTlm_()
    : ned_latitude(0.0)
    , ned_longitude(0.0)
    , ned_heading(0.0)
    , speed(0.0)
    , steering_angle(0.0)
    , steering_angular_velocity(0.0)
    , wheel_velocity_fl(0.0)
    , wheel_velocity_fr(0.0)
    , wheel_velocity_rl(0.0)
    , wheel_velocity_rr(0.0)
    , wheel_size_fl(0.0)
    , wheel_size_fr(0.0)
    , wheel_size_rl(0.0)
    , wheel_size_rr(0.0)
    , acceleration_left(0.0)
    , acceleration_forward(0.0)
    , roll(0.0)
    , pitch(0.0)
    , yaw(0.0)
    , wheel_base(0.0)
    , curb_weight(0.0)  {
    }
  VehicleTlm_(const ContainerAllocator& _alloc)
    : ned_latitude(0.0)
    , ned_longitude(0.0)
    , ned_heading(0.0)
    , speed(0.0)
    , steering_angle(0.0)
    , steering_angular_velocity(0.0)
    , wheel_velocity_fl(0.0)
    , wheel_velocity_fr(0.0)
    , wheel_velocity_rl(0.0)
    , wheel_velocity_rr(0.0)
    , wheel_size_fl(0.0)
    , wheel_size_fr(0.0)
    , wheel_size_rl(0.0)
    , wheel_size_rr(0.0)
    , acceleration_left(0.0)
    , acceleration_forward(0.0)
    , roll(0.0)
    , pitch(0.0)
    , yaw(0.0)
    , wheel_base(0.0)
    , curb_weight(0.0)  {
  (void)_alloc;
    }



   typedef double _ned_latitude_type;
  _ned_latitude_type ned_latitude;

   typedef double _ned_longitude_type;
  _ned_longitude_type ned_longitude;

   typedef double _ned_heading_type;
  _ned_heading_type ned_heading;

   typedef double _speed_type;
  _speed_type speed;

   typedef double _steering_angle_type;
  _steering_angle_type steering_angle;

   typedef double _steering_angular_velocity_type;
  _steering_angular_velocity_type steering_angular_velocity;

   typedef double _wheel_velocity_fl_type;
  _wheel_velocity_fl_type wheel_velocity_fl;

   typedef double _wheel_velocity_fr_type;
  _wheel_velocity_fr_type wheel_velocity_fr;

   typedef double _wheel_velocity_rl_type;
  _wheel_velocity_rl_type wheel_velocity_rl;

   typedef double _wheel_velocity_rr_type;
  _wheel_velocity_rr_type wheel_velocity_rr;

   typedef double _wheel_size_fl_type;
  _wheel_size_fl_type wheel_size_fl;

   typedef double _wheel_size_fr_type;
  _wheel_size_fr_type wheel_size_fr;

   typedef double _wheel_size_rl_type;
  _wheel_size_rl_type wheel_size_rl;

   typedef double _wheel_size_rr_type;
  _wheel_size_rr_type wheel_size_rr;

   typedef double _acceleration_left_type;
  _acceleration_left_type acceleration_left;

   typedef double _acceleration_forward_type;
  _acceleration_forward_type acceleration_forward;

   typedef double _roll_type;
  _roll_type roll;

   typedef double _pitch_type;
  _pitch_type pitch;

   typedef double _yaw_type;
  _yaw_type yaw;

   typedef double _wheel_base_type;
  _wheel_base_type wheel_base;

   typedef double _curb_weight_type;
  _curb_weight_type curb_weight;





  typedef boost::shared_ptr< ::cbnu_msgs::VehicleTlm_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cbnu_msgs::VehicleTlm_<ContainerAllocator> const> ConstPtr;

}; // struct VehicleTlm_

typedef ::cbnu_msgs::VehicleTlm_<std::allocator<void> > VehicleTlm;

typedef boost::shared_ptr< ::cbnu_msgs::VehicleTlm > VehicleTlmPtr;
typedef boost::shared_ptr< ::cbnu_msgs::VehicleTlm const> VehicleTlmConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cbnu_msgs::VehicleTlm_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cbnu_msgs::VehicleTlm_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cbnu_msgs::VehicleTlm_<ContainerAllocator1> & lhs, const ::cbnu_msgs::VehicleTlm_<ContainerAllocator2> & rhs)
{
  return lhs.ned_latitude == rhs.ned_latitude &&
    lhs.ned_longitude == rhs.ned_longitude &&
    lhs.ned_heading == rhs.ned_heading &&
    lhs.speed == rhs.speed &&
    lhs.steering_angle == rhs.steering_angle &&
    lhs.steering_angular_velocity == rhs.steering_angular_velocity &&
    lhs.wheel_velocity_fl == rhs.wheel_velocity_fl &&
    lhs.wheel_velocity_fr == rhs.wheel_velocity_fr &&
    lhs.wheel_velocity_rl == rhs.wheel_velocity_rl &&
    lhs.wheel_velocity_rr == rhs.wheel_velocity_rr &&
    lhs.wheel_size_fl == rhs.wheel_size_fl &&
    lhs.wheel_size_fr == rhs.wheel_size_fr &&
    lhs.wheel_size_rl == rhs.wheel_size_rl &&
    lhs.wheel_size_rr == rhs.wheel_size_rr &&
    lhs.acceleration_left == rhs.acceleration_left &&
    lhs.acceleration_forward == rhs.acceleration_forward &&
    lhs.roll == rhs.roll &&
    lhs.pitch == rhs.pitch &&
    lhs.yaw == rhs.yaw &&
    lhs.wheel_base == rhs.wheel_base &&
    lhs.curb_weight == rhs.curb_weight;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cbnu_msgs::VehicleTlm_<ContainerAllocator1> & lhs, const ::cbnu_msgs::VehicleTlm_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cbnu_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::cbnu_msgs::VehicleTlm_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cbnu_msgs::VehicleTlm_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cbnu_msgs::VehicleTlm_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cbnu_msgs::VehicleTlm_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cbnu_msgs::VehicleTlm_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cbnu_msgs::VehicleTlm_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cbnu_msgs::VehicleTlm_<ContainerAllocator> >
{
  static const char* value()
  {
    return "140037dd6fb977de3cb0c0931cbb58a4";
  }

  static const char* value(const ::cbnu_msgs::VehicleTlm_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x140037dd6fb977deULL;
  static const uint64_t static_value2 = 0x3cb0c0931cbb58a4ULL;
};

template<class ContainerAllocator>
struct DataType< ::cbnu_msgs::VehicleTlm_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cbnu_msgs/VehicleTlm";
  }

  static const char* value(const ::cbnu_msgs::VehicleTlm_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cbnu_msgs::VehicleTlm_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 ned_latitude\n"
"float64 ned_longitude\n"
"float64 ned_heading\n"
"\n"
"float64 speed\n"
"\n"
"float64 steering_angle\n"
"float64 steering_angular_velocity\n"
"\n"
"float64 wheel_velocity_fl\n"
"float64 wheel_velocity_fr\n"
"float64 wheel_velocity_rl\n"
"float64 wheel_velocity_rr\n"
"\n"
"float64 wheel_size_fl\n"
"float64 wheel_size_fr\n"
"float64 wheel_size_rl\n"
"float64 wheel_size_rr\n"
"\n"
"float64 acceleration_left\n"
"float64 acceleration_forward\n"
"\n"
"float64 roll\n"
"float64 pitch\n"
"float64 yaw\n"
"\n"
"float64 wheel_base\n"
"float64 curb_weight\n"
;
  }

  static const char* value(const ::cbnu_msgs::VehicleTlm_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cbnu_msgs::VehicleTlm_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.ned_latitude);
      stream.next(m.ned_longitude);
      stream.next(m.ned_heading);
      stream.next(m.speed);
      stream.next(m.steering_angle);
      stream.next(m.steering_angular_velocity);
      stream.next(m.wheel_velocity_fl);
      stream.next(m.wheel_velocity_fr);
      stream.next(m.wheel_velocity_rl);
      stream.next(m.wheel_velocity_rr);
      stream.next(m.wheel_size_fl);
      stream.next(m.wheel_size_fr);
      stream.next(m.wheel_size_rl);
      stream.next(m.wheel_size_rr);
      stream.next(m.acceleration_left);
      stream.next(m.acceleration_forward);
      stream.next(m.roll);
      stream.next(m.pitch);
      stream.next(m.yaw);
      stream.next(m.wheel_base);
      stream.next(m.curb_weight);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct VehicleTlm_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cbnu_msgs::VehicleTlm_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cbnu_msgs::VehicleTlm_<ContainerAllocator>& v)
  {
    s << indent << "ned_latitude: ";
    Printer<double>::stream(s, indent + "  ", v.ned_latitude);
    s << indent << "ned_longitude: ";
    Printer<double>::stream(s, indent + "  ", v.ned_longitude);
    s << indent << "ned_heading: ";
    Printer<double>::stream(s, indent + "  ", v.ned_heading);
    s << indent << "speed: ";
    Printer<double>::stream(s, indent + "  ", v.speed);
    s << indent << "steering_angle: ";
    Printer<double>::stream(s, indent + "  ", v.steering_angle);
    s << indent << "steering_angular_velocity: ";
    Printer<double>::stream(s, indent + "  ", v.steering_angular_velocity);
    s << indent << "wheel_velocity_fl: ";
    Printer<double>::stream(s, indent + "  ", v.wheel_velocity_fl);
    s << indent << "wheel_velocity_fr: ";
    Printer<double>::stream(s, indent + "  ", v.wheel_velocity_fr);
    s << indent << "wheel_velocity_rl: ";
    Printer<double>::stream(s, indent + "  ", v.wheel_velocity_rl);
    s << indent << "wheel_velocity_rr: ";
    Printer<double>::stream(s, indent + "  ", v.wheel_velocity_rr);
    s << indent << "wheel_size_fl: ";
    Printer<double>::stream(s, indent + "  ", v.wheel_size_fl);
    s << indent << "wheel_size_fr: ";
    Printer<double>::stream(s, indent + "  ", v.wheel_size_fr);
    s << indent << "wheel_size_rl: ";
    Printer<double>::stream(s, indent + "  ", v.wheel_size_rl);
    s << indent << "wheel_size_rr: ";
    Printer<double>::stream(s, indent + "  ", v.wheel_size_rr);
    s << indent << "acceleration_left: ";
    Printer<double>::stream(s, indent + "  ", v.acceleration_left);
    s << indent << "acceleration_forward: ";
    Printer<double>::stream(s, indent + "  ", v.acceleration_forward);
    s << indent << "roll: ";
    Printer<double>::stream(s, indent + "  ", v.roll);
    s << indent << "pitch: ";
    Printer<double>::stream(s, indent + "  ", v.pitch);
    s << indent << "yaw: ";
    Printer<double>::stream(s, indent + "  ", v.yaw);
    s << indent << "wheel_base: ";
    Printer<double>::stream(s, indent + "  ", v.wheel_base);
    s << indent << "curb_weight: ";
    Printer<double>::stream(s, indent + "  ", v.curb_weight);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CBNU_MSGS_MESSAGE_VEHICLETLM_H
