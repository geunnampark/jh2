# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from morai_msgs/ERP42Info.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class ERP42Info(genpy.Message):
  _md5sum = "447921c8aaf0c348263b1dd340abd2b4"
  _type = "morai_msgs/ERP42Info"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """int32 longlCmdType

float32 position_x
float32 position_y
float32 position_z

float32 roll
float32 pitch
float32 yaw

float32 velocity
float32 steering

"""
  __slots__ = ['longlCmdType','position_x','position_y','position_z','roll','pitch','yaw','velocity','steering']
  _slot_types = ['int32','float32','float32','float32','float32','float32','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       longlCmdType,position_x,position_y,position_z,roll,pitch,yaw,velocity,steering

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ERP42Info, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.longlCmdType is None:
        self.longlCmdType = 0
      if self.position_x is None:
        self.position_x = 0.
      if self.position_y is None:
        self.position_y = 0.
      if self.position_z is None:
        self.position_z = 0.
      if self.roll is None:
        self.roll = 0.
      if self.pitch is None:
        self.pitch = 0.
      if self.yaw is None:
        self.yaw = 0.
      if self.velocity is None:
        self.velocity = 0.
      if self.steering is None:
        self.steering = 0.
    else:
      self.longlCmdType = 0
      self.position_x = 0.
      self.position_y = 0.
      self.position_z = 0.
      self.roll = 0.
      self.pitch = 0.
      self.yaw = 0.
      self.velocity = 0.
      self.steering = 0.

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
      buff.write(_get_struct_i8f().pack(_x.longlCmdType, _x.position_x, _x.position_y, _x.position_z, _x.roll, _x.pitch, _x.yaw, _x.velocity, _x.steering))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 36
      (_x.longlCmdType, _x.position_x, _x.position_y, _x.position_z, _x.roll, _x.pitch, _x.yaw, _x.velocity, _x.steering,) = _get_struct_i8f().unpack(str[start:end])
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
      buff.write(_get_struct_i8f().pack(_x.longlCmdType, _x.position_x, _x.position_y, _x.position_z, _x.roll, _x.pitch, _x.yaw, _x.velocity, _x.steering))
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
      end = 0
      _x = self
      start = end
      end += 36
      (_x.longlCmdType, _x.position_x, _x.position_y, _x.position_z, _x.roll, _x.pitch, _x.yaw, _x.velocity, _x.steering,) = _get_struct_i8f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_i8f = None
def _get_struct_i8f():
    global _struct_i8f
    if _struct_i8f is None:
        _struct_i8f = struct.Struct("<i8f")
    return _struct_i8f
