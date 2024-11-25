// Auto-generated. Do not edit!

// (in-package morai_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class VelPlot {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.target_vel = null;
      this.current_vel = null;
    }
    else {
      if (initObj.hasOwnProperty('target_vel')) {
        this.target_vel = initObj.target_vel
      }
      else {
        this.target_vel = 0.0;
      }
      if (initObj.hasOwnProperty('current_vel')) {
        this.current_vel = initObj.current_vel
      }
      else {
        this.current_vel = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VelPlot
    // Serialize message field [target_vel]
    bufferOffset = _serializer.float64(obj.target_vel, buffer, bufferOffset);
    // Serialize message field [current_vel]
    bufferOffset = _serializer.float64(obj.current_vel, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VelPlot
    let len;
    let data = new VelPlot(null);
    // Deserialize message field [target_vel]
    data.target_vel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [current_vel]
    data.current_vel = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/VelPlot';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f5a3e50e6c7d121a90051a8b33f0ba8d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 target_vel
    float64 current_vel
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VelPlot(null);
    if (msg.target_vel !== undefined) {
      resolved.target_vel = msg.target_vel;
    }
    else {
      resolved.target_vel = 0.0
    }

    if (msg.current_vel !== undefined) {
      resolved.current_vel = msg.current_vel;
    }
    else {
      resolved.current_vel = 0.0
    }

    return resolved;
    }
};

module.exports = VelPlot;
