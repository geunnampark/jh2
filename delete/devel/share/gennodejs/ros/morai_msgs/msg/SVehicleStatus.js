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

class SVehicleStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.vehicle_num = null;
      this.pose_x = null;
      this.pose_y = null;
      this.pose_z = null;
      this.heading = null;
      this.velocity = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('vehicle_num')) {
        this.vehicle_num = initObj.vehicle_num
      }
      else {
        this.vehicle_num = 0;
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
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SVehicleStatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [vehicle_num]
    bufferOffset = _serializer.int16(obj.vehicle_num, buffer, bufferOffset);
    // Serialize message field [pose_x]
    bufferOffset = _arraySerializer.float64(obj.pose_x, buffer, bufferOffset, null);
    // Serialize message field [pose_y]
    bufferOffset = _arraySerializer.float64(obj.pose_y, buffer, bufferOffset, null);
    // Serialize message field [pose_z]
    bufferOffset = _arraySerializer.float64(obj.pose_z, buffer, bufferOffset, null);
    // Serialize message field [heading]
    bufferOffset = _arraySerializer.float64(obj.heading, buffer, bufferOffset, null);
    // Serialize message field [velocity]
    bufferOffset = _arraySerializer.float64(obj.velocity, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SVehicleStatus
    let len;
    let data = new SVehicleStatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [vehicle_num]
    data.vehicle_num = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [pose_x]
    data.pose_x = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [pose_y]
    data.pose_y = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [pose_z]
    data.pose_z = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [heading]
    data.heading = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [velocity]
    data.velocity = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 8 * object.pose_x.length;
    length += 8 * object.pose_y.length;
    length += 8 * object.pose_z.length;
    length += 8 * object.heading.length;
    length += 8 * object.velocity.length;
    return length + 22;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/SVehicleStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c5761b53523289f5262479d10b4bbf7c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    int16 vehicle_num
    float64[] pose_x
    float64[] pose_y
    float64[] pose_z
    float64[] heading
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
    const resolved = new SVehicleStatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.vehicle_num !== undefined) {
      resolved.vehicle_num = msg.vehicle_num;
    }
    else {
      resolved.vehicle_num = 0
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

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = []
    }

    return resolved;
    }
};

module.exports = SVehicleStatus;
