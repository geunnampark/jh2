# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from cbnu_msgs/AllObjectsData.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import cbnu_msgs.msg
import std_msgs.msg

class AllObjectsData(genpy.Message):
  _md5sum = "ab8058e85871d4149538347822e71fe4"
  _type = "cbnu_msgs/AllObjectsData"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """Header header
AnObjectData[] object_data_array
int8 num_car
int8 num_person

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: cbnu_msgs/AnObjectData
string object_type
float32 rel_pos_x
float32 rel_pos_y
float32 global_pos_lat
float32 global_pos_lon
"""
  __slots__ = ['header','object_data_array','num_car','num_person']
  _slot_types = ['std_msgs/Header','cbnu_msgs/AnObjectData[]','int8','int8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,object_data_array,num_car,num_person

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(AllObjectsData, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.object_data_array is None:
        self.object_data_array = []
      if self.num_car is None:
        self.num_car = 0
      if self.num_person is None:
        self.num_person = 0
    else:
      self.header = std_msgs.msg.Header()
      self.object_data_array = []
      self.num_car = 0
      self.num_person = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.object_data_array)
      buff.write(_struct_I.pack(length))
      for val1 in self.object_data_array:
        _x = val1.object_type
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1
        buff.write(_get_struct_4f().pack(_x.rel_pos_x, _x.rel_pos_y, _x.global_pos_lat, _x.global_pos_lon))
      _x = self
      buff.write(_get_struct_2b().pack(_x.num_car, _x.num_person))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.object_data_array is None:
        self.object_data_array = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.object_data_array = []
      for i in range(0, length):
        val1 = cbnu_msgs.msg.AnObjectData()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.object_type = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.object_type = str[start:end]
        _x = val1
        start = end
        end += 16
        (_x.rel_pos_x, _x.rel_pos_y, _x.global_pos_lat, _x.global_pos_lon,) = _get_struct_4f().unpack(str[start:end])
        self.object_data_array.append(val1)
      _x = self
      start = end
      end += 2
      (_x.num_car, _x.num_person,) = _get_struct_2b().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.object_data_array)
      buff.write(_struct_I.pack(length))
      for val1 in self.object_data_array:
        _x = val1.object_type
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1
        buff.write(_get_struct_4f().pack(_x.rel_pos_x, _x.rel_pos_y, _x.global_pos_lat, _x.global_pos_lon))
      _x = self
      buff.write(_get_struct_2b().pack(_x.num_car, _x.num_person))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.object_data_array is None:
        self.object_data_array = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.object_data_array = []
      for i in range(0, length):
        val1 = cbnu_msgs.msg.AnObjectData()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.object_type = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.object_type = str[start:end]
        _x = val1
        start = end
        end += 16
        (_x.rel_pos_x, _x.rel_pos_y, _x.global_pos_lat, _x.global_pos_lon,) = _get_struct_4f().unpack(str[start:end])
        self.object_data_array.append(val1)
      _x = self
      start = end
      end += 2
      (_x.num_car, _x.num_person,) = _get_struct_2b().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2b = None
def _get_struct_2b():
    global _struct_2b
    if _struct_2b is None:
        _struct_2b = struct.Struct("<2b")
    return _struct_2b
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_4f = None
def _get_struct_4f():
    global _struct_4f
    if _struct_4f is None:
        _struct_4f = struct.Struct("<4f")
    return _struct_4f
