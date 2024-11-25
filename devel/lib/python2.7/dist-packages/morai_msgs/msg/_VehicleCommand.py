# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from morai_msgs/VehicleCommand.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class VehicleCommand(genpy.Message):
  _md5sum = "a1965816c5fabf849455061a99d17c29"
  _type = "morai_msgs/VehicleCommand"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """int32 mode
float64 accel
float64 brake
float64 acceleration
float64 steering_angle
"""
  __slots__ = ['mode','accel','brake','acceleration','steering_angle']
  _slot_types = ['int32','float64','float64','float64','float64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       mode,accel,brake,acceleration,steering_angle

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(VehicleCommand, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.mode is None:
        self.mode = 0
      if self.accel is None:
        self.accel = 0.
      if self.brake is None:
        self.brake = 0.
      if self.acceleration is None:
        self.acceleration = 0.
      if self.steering_angle is None:
        self.steering_angle = 0.
    else:
      self.mode = 0
      self.accel = 0.
      self.brake = 0.
      self.acceleration = 0.
      self.steering_angle = 0.

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
      buff.write(_get_struct_i4d().pack(_x.mode, _x.accel, _x.brake, _x.acceleration, _x.steering_angle))
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
      (_x.mode, _x.accel, _x.brake, _x.acceleration, _x.steering_angle,) = _get_struct_i4d().unpack(str[start:end])
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
      buff.write(_get_struct_i4d().pack(_x.mode, _x.accel, _x.brake, _x.acceleration, _x.steering_angle))
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
      (_x.mode, _x.accel, _x.brake, _x.acceleration, _x.steering_angle,) = _get_struct_i4d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_i4d = None
def _get_struct_i4d():
    global _struct_i4d
    if _struct_i4d is None:
        _struct_i4d = struct.Struct("<i4d")
    return _struct_i4d
