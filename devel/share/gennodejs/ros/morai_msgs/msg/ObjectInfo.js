// Auto-generated. Do not edit!

// (in-package morai_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ObjectInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.num_of_objects = null;
      this.object_type = null;
      this.pose_x = null;
      this.pose_y = null;
      this.pose_z = null;
      this.heading = null;
      this.size_x = null;
      this.size_y = null;
      this.size_z = null;
      this.velocity = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('num_of_objects')) {
        this.num_of_objects = initObj.num_of_objects
      }
      else {
        this.num_of_objects = 0;
      }
      if (initObj.hasOwnProperty('object_type')) {
        this.object_type = initObj.object_type
      }
      else {
        this.object_type = [];
      }
      if (initObj.hasOwnProperty('pose_x')) {
        this.pose_x = initObj.pose_x
      }
      else {
        this.pose_x = [];
      }
      if (initObj.hasOwnProperty('pose_y')) {
        this.pose_y = initObj.pose_y
      }
      else {
        this.pose_y = [];
      }
      if (initObj.hasOwnProperty('pose_z')) {
        this.pose_z = initObj.pose_z
      }
      else {
        this.pose_z = [];
      }
      if (initObj.hasOwnProperty('heading')) {
        this.heading = initObj.heading
      }
      else {
        this.heading = [];
      }
      if (initObj.hasOwnProperty('size_x')) {
        this.size_x = initObj.size_x
      }
      else {
        this.size_x = [];
      }
      if (initObj.hasOwnProperty('size_y')) {
        this.size_y = initObj.size_y
      }
      else {
        this.size_y = [];
      }
      if (initObj.hasOwnProperty('size_z')) {
        this.size_z = initObj.size_z
      }
      else {
        this.size_z = [];
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObjectInfo
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [num_of_objects]
    bufferOffset = _serializer.int32(obj.num_of_objects, buffer, bufferOffset);
    // Serialize message field [object_type]
    bufferOffset = _arraySerializer.int16(obj.object_type, buffer, bufferOffset, null);
    // Serialize message field [pose_x]
    bufferOffset = _arraySerializer.float64(obj.pose_x, buffer, bufferOffset, null);
    // Serialize message field [pose_y]
    bufferOffset = _arraySerializer.float64(obj.pose_y, buffer, bufferOffset, null);
    // Serialize message field [pose_z]
    bufferOffset = _arraySerializer.float64(obj.pose_z, buffer, bufferOffset, null);
    // Serialize message field [heading]
    bufferOffset = _arraySerializer.float64(obj.heading, buffer, bufferOffset, null);
    // Serialize message field [size_x]
    bufferOffset = _arraySerializer.float64(obj.size_x, buffer, bufferOffset, null);
    // Serialize message field [size_y]
    bufferOffset = _arraySerializer.float64(obj.size_y, buffer, bufferOffset, null);
    // Serialize message field [size_z]
    bufferOffset = _arraySerializer.float64(obj.size_z, buffer, bufferOffset, null);
    // Serialize message field [velocity]
    bufferOffset = _arraySerializer.float64(obj.velocity, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObjectInfo
    let len;
    let data = new ObjectInfo(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [num_of_objects]
    data.num_of_objects = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [object_type]
    data.object_type = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [pose_x]
    data.pose_x = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [pose_y]
    data.pose_y = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [pose_z]
    data.pose_z = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [heading]
    data.heading = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [size_x]
    data.size_x = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [size_y]
    data.size_y = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [size_z]
    data.size_z = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [velocity]
    data.velocity = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 2 * object.object_type.length;
    length += 8 * object.pose_x.length;
    length += 8 * object.pose_y.length;
    length += 8 * object.pose_z.length;
    length += 8 * object.heading.length;
    length += 8 * object.size_x.length;
    length += 8 * object.size_y.length;
    length += 8 * object.size_z.length;
    length += 8 * object.velocity.length;
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/ObjectInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '544b34f9a8049dbcfd23f36a6d3ad887';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    int32 num_of_objects
    int16[] object_type
    
    float64[] pose_x
    float64[] pose_y
    float64[] pose_z
    
    float64[] heading
    
    float64[] size_x
    float64[] size_y
    float64[] size_z
    
    float64[] velocity
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObjectInfo(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.num_of_objects !== undefined) {
      resolved.num_of_objects = msg.num_of_objects;
    }
    else {
      resolved.num_of_objects = 0
    }

    if (msg.object_type !== undefined) {
      resolved.object_type = msg.object_type;
    }
    else {
      resolved.object_type = []
    }

    if (msg.pose_x !== undefined) {
      resolved.pose_x = msg.pose_x;
    }
    else {
      resolved.pose_x = []
    }

    if (msg.pose_y !== undefined) {
      resolved.pose_y = msg.pose_y;
    }
    else {
      resolved.pose_y = []
    }

    if (msg.pose_z !== undefined) {
      resolved.pose_z = msg.pose_z;
    }
    else {
      resolved.pose_z = []
    }

    if (msg.heading !== undefined) {
      resolved.heading = msg.heading;
    }
    else {
      resolved.heading = []
    }

    if (msg.size_x !== undefined) {
      resolved.size_x = msg.size_x;
    }
    else {
      resolved.size_x = []
    }

    if (msg.size_y !== undefined) {
      resolved.size_y = msg.size_y;
    }
    else {
      resolved.size_y = []
    }

    if (msg.size_z !== undefined) {
      resolved.size_z = msg.size_z;
    }
    else {
      resolved.size_z = []
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = []
    }

    return resolved;
    }
};

module.exports = ObjectInfo;
