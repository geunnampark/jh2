// Generated by gencpp from file morai_msgs/ScenarioLoad.msg
// DO NOT EDIT!


#ifndef MORAI_MSGS_MESSAGE_SCENARIOLOAD_H
#define MORAI_MSGS_MESSAGE_SCENARIOLOAD_H


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
struct ScenarioLoad_
{
  typedef ScenarioLoad_<ContainerAllocator> Type;

  ScenarioLoad_()
    : file_name()
    , load_ego_vehicle_data(false)
    , load_surrounding_vehicle_data(false)
    , load_pedestrian_data(false)  {
    }
  ScenarioLoad_(const ContainerAllocator& _alloc)
    : file_name(_alloc)
    , load_ego_vehicle_data(false)
    , load_surrounding_vehicle_data(false)
    , load_pedestrian_data(false)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _file_name_type;
  _file_name_type file_name;

   typedef uint8_t _load_ego_vehicle_data_type;
  _load_ego_vehicle_data_type load_ego_vehicle_data;

   typedef uint8_t _load_surrounding_vehicle_data_type;
  _load_surrounding_vehicle_data_type load_surrounding_vehicle_data;

   typedef uint8_t _load_pedestrian_data_type;
  _load_pedestrian_data_type load_pedestrian_data;





  typedef boost::shared_ptr< ::morai_msgs::ScenarioLoad_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::morai_msgs::ScenarioLoad_<ContainerAllocator> const> ConstPtr;

}; // struct ScenarioLoad_

typedef ::morai_msgs::ScenarioLoad_<std::allocator<void> > ScenarioLoad;

typedef boost::shared_ptr< ::morai_msgs::ScenarioLoad > ScenarioLoadPtr;
typedef boost::shared_ptr< ::morai_msgs::ScenarioLoad const> ScenarioLoadConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::morai_msgs::ScenarioLoad_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::morai_msgs::ScenarioLoad_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::morai_msgs::ScenarioLoad_<ContainerAllocator1> & lhs, const ::morai_msgs::ScenarioLoad_<ContainerAllocator2> & rhs)
{
  return lhs.file_name == rhs.file_name &&
    lhs.load_ego_vehicle_data == rhs.load_ego_vehicle_data &&
    lhs.load_surrounding_vehicle_data == rhs.load_surrounding_vehicle_data &&
    lhs.load_pedestrian_data == rhs.load_pedestrian_data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::morai_msgs::ScenarioLoad_<ContainerAllocator1> & lhs, const ::morai_msgs::ScenarioLoad_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace morai_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::morai_msgs::ScenarioLoad_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::morai_msgs::ScenarioLoad_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::morai_msgs::ScenarioLoad_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::morai_msgs::ScenarioLoad_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::morai_msgs::ScenarioLoad_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::morai_msgs::ScenarioLoad_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::morai_msgs::ScenarioLoad_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a4a97731b70c0c124bff12c7f07eac46";
  }

  static const char* value(const ::morai_msgs::ScenarioLoad_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa4a97731b70c0c12ULL;
  static const uint64_t static_value2 = 0x4bff12c7f07eac46ULL;
};

template<class ContainerAllocator>
struct DataType< ::morai_msgs::ScenarioLoad_<ContainerAllocator> >
{
  static const char* value()
  {
    return "morai_msgs/ScenarioLoad";
  }

  static const char* value(const ::morai_msgs::ScenarioLoad_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::morai_msgs::ScenarioLoad_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string file_name\n"
"bool load_ego_vehicle_data\n"
"bool load_surrounding_vehicle_data\n"
"bool load_pedestrian_data\n"
"\n"
;
  }

  static const char* value(const ::morai_msgs::ScenarioLoad_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::morai_msgs::ScenarioLoad_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.file_name);
      stream.next(m.load_ego_vehicle_data);
      stream.next(m.load_surrounding_vehicle_data);
      stream.next(m.load_pedestrian_data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ScenarioLoad_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::morai_msgs::ScenarioLoad_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::morai_msgs::ScenarioLoad_<ContainerAllocator>& v)
  {
    s << indent << "file_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.file_name);
    s << indent << "load_ego_vehicle_data: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.load_ego_vehicle_data);
    s << indent << "load_surrounding_vehicle_data: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.load_surrounding_vehicle_data);
    s << indent << "load_pedestrian_data: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.load_pedestrian_data);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MORAI_MSGS_MESSAGE_SCENARIOLOAD_H
