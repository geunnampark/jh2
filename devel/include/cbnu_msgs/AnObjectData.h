// Generated by gencpp from file cbnu_msgs/AnObjectData.msg
// DO NOT EDIT!


#ifndef CBNU_MSGS_MESSAGE_ANOBJECTDATA_H
#define CBNU_MSGS_MESSAGE_ANOBJECTDATA_H


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
struct AnObjectData_
{
  typedef AnObjectData_<ContainerAllocator> Type;

  AnObjectData_()
    : object_type()
    , rel_pos_x(0.0)
    , rel_pos_y(0.0)
    , global_pos_lat(0.0)
    , global_pos_lon(0.0)  {
    }
  AnObjectData_(const ContainerAllocator& _alloc)
    : object_type(_alloc)
    , rel_pos_x(0.0)
    , rel_pos_y(0.0)
    , global_pos_lat(0.0)
    , global_pos_lon(0.0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _object_type_type;
  _object_type_type object_type;

   typedef float _rel_pos_x_type;
  _rel_pos_x_type rel_pos_x;

   typedef float _rel_pos_y_type;
  _rel_pos_y_type rel_pos_y;

   typedef float _global_pos_lat_type;
  _global_pos_lat_type global_pos_lat;

   typedef float _global_pos_lon_type;
  _global_pos_lon_type global_pos_lon;





  typedef boost::shared_ptr< ::cbnu_msgs::AnObjectData_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cbnu_msgs::AnObjectData_<ContainerAllocator> const> ConstPtr;

}; // struct AnObjectData_

typedef ::cbnu_msgs::AnObjectData_<std::allocator<void> > AnObjectData;

typedef boost::shared_ptr< ::cbnu_msgs::AnObjectData > AnObjectDataPtr;
typedef boost::shared_ptr< ::cbnu_msgs::AnObjectData const> AnObjectDataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cbnu_msgs::AnObjectData_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cbnu_msgs::AnObjectData_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cbnu_msgs::AnObjectData_<ContainerAllocator1> & lhs, const ::cbnu_msgs::AnObjectData_<ContainerAllocator2> & rhs)
{
  return lhs.object_type == rhs.object_type &&
    lhs.rel_pos_x == rhs.rel_pos_x &&
    lhs.rel_pos_y == rhs.rel_pos_y &&
    lhs.global_pos_lat == rhs.global_pos_lat &&
    lhs.global_pos_lon == rhs.global_pos_lon;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cbnu_msgs::AnObjectData_<ContainerAllocator1> & lhs, const ::cbnu_msgs::AnObjectData_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cbnu_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::cbnu_msgs::AnObjectData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cbnu_msgs::AnObjectData_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cbnu_msgs::AnObjectData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cbnu_msgs::AnObjectData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cbnu_msgs::AnObjectData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cbnu_msgs::AnObjectData_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cbnu_msgs::AnObjectData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f64d9f4ae123fec27fe26952d0c80dfc";
  }

  static const char* value(const ::cbnu_msgs::AnObjectData_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf64d9f4ae123fec2ULL;
  static const uint64_t static_value2 = 0x7fe26952d0c80dfcULL;
};

template<class ContainerAllocator>
struct DataType< ::cbnu_msgs::AnObjectData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cbnu_msgs/AnObjectData";
  }

  static const char* value(const ::cbnu_msgs::AnObjectData_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cbnu_msgs::AnObjectData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string object_type\n"
"float32 rel_pos_x\n"
"float32 rel_pos_y\n"
"float32 global_pos_lat\n"
"float32 global_pos_lon\n"
;
  }

  static const char* value(const ::cbnu_msgs::AnObjectData_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cbnu_msgs::AnObjectData_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.object_type);
      stream.next(m.rel_pos_x);
      stream.next(m.rel_pos_y);
      stream.next(m.global_pos_lat);
      stream.next(m.global_pos_lon);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AnObjectData_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cbnu_msgs::AnObjectData_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cbnu_msgs::AnObjectData_<ContainerAllocator>& v)
  {
    s << indent << "object_type: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.object_type);
    s << indent << "rel_pos_x: ";
    Printer<float>::stream(s, indent + "  ", v.rel_pos_x);
    s << indent << "rel_pos_y: ";
    Printer<float>::stream(s, indent + "  ", v.rel_pos_y);
    s << indent << "global_pos_lat: ";
    Printer<float>::stream(s, indent + "  ", v.global_pos_lat);
    s << indent << "global_pos_lon: ";
    Printer<float>::stream(s, indent + "  ", v.global_pos_lon);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CBNU_MSGS_MESSAGE_ANOBJECTDATA_H