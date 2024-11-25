// Generated by gencpp from file cbnu_msgs/AllObjectsData.msg
// DO NOT EDIT!


#ifndef CBNU_MSGS_MESSAGE_ALLOBJECTSDATA_H
#define CBNU_MSGS_MESSAGE_ALLOBJECTSDATA_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <cbnu_msgs/AnObjectData.h>

namespace cbnu_msgs
{
template <class ContainerAllocator>
struct AllObjectsData_
{
  typedef AllObjectsData_<ContainerAllocator> Type;

  AllObjectsData_()
    : header()
    , object_data_array()
    , num_car(0)
    , num_person(0)  {
    }
  AllObjectsData_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , object_data_array(_alloc)
    , num_car(0)
    , num_person(0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::cbnu_msgs::AnObjectData_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::cbnu_msgs::AnObjectData_<ContainerAllocator> >::other >  _object_data_array_type;
  _object_data_array_type object_data_array;

   typedef int8_t _num_car_type;
  _num_car_type num_car;

   typedef int8_t _num_person_type;
  _num_person_type num_person;





  typedef boost::shared_ptr< ::cbnu_msgs::AllObjectsData_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cbnu_msgs::AllObjectsData_<ContainerAllocator> const> ConstPtr;

}; // struct AllObjectsData_

typedef ::cbnu_msgs::AllObjectsData_<std::allocator<void> > AllObjectsData;

typedef boost::shared_ptr< ::cbnu_msgs::AllObjectsData > AllObjectsDataPtr;
typedef boost::shared_ptr< ::cbnu_msgs::AllObjectsData const> AllObjectsDataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cbnu_msgs::AllObjectsData_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cbnu_msgs::AllObjectsData_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cbnu_msgs::AllObjectsData_<ContainerAllocator1> & lhs, const ::cbnu_msgs::AllObjectsData_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.object_data_array == rhs.object_data_array &&
    lhs.num_car == rhs.num_car &&
    lhs.num_person == rhs.num_person;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cbnu_msgs::AllObjectsData_<ContainerAllocator1> & lhs, const ::cbnu_msgs::AllObjectsData_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cbnu_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::cbnu_msgs::AllObjectsData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cbnu_msgs::AllObjectsData_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cbnu_msgs::AllObjectsData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cbnu_msgs::AllObjectsData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cbnu_msgs::AllObjectsData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cbnu_msgs::AllObjectsData_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cbnu_msgs::AllObjectsData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ab8058e85871d4149538347822e71fe4";
  }

  static const char* value(const ::cbnu_msgs::AllObjectsData_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xab8058e85871d414ULL;
  static const uint64_t static_value2 = 0x9538347822e71fe4ULL;
};

template<class ContainerAllocator>
struct DataType< ::cbnu_msgs::AllObjectsData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cbnu_msgs/AllObjectsData";
  }

  static const char* value(const ::cbnu_msgs::AllObjectsData_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cbnu_msgs::AllObjectsData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"AnObjectData[] object_data_array\n"
"int8 num_car\n"
"int8 num_person\n"
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
"MSG: cbnu_msgs/AnObjectData\n"
"string object_type\n"
"float32 rel_pos_x\n"
"float32 rel_pos_y\n"
"float32 global_pos_lat\n"
"float32 global_pos_lon\n"
;
  }

  static const char* value(const ::cbnu_msgs::AllObjectsData_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cbnu_msgs::AllObjectsData_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.object_data_array);
      stream.next(m.num_car);
      stream.next(m.num_person);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AllObjectsData_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cbnu_msgs::AllObjectsData_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cbnu_msgs::AllObjectsData_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "object_data_array[]" << std::endl;
    for (size_t i = 0; i < v.object_data_array.size(); ++i)
    {
      s << indent << "  object_data_array[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::cbnu_msgs::AnObjectData_<ContainerAllocator> >::stream(s, indent + "    ", v.object_data_array[i]);
    }
    s << indent << "num_car: ";
    Printer<int8_t>::stream(s, indent + "  ", v.num_car);
    s << indent << "num_person: ";
    Printer<int8_t>::stream(s, indent + "  ", v.num_person);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CBNU_MSGS_MESSAGE_ALLOBJECTSDATA_H