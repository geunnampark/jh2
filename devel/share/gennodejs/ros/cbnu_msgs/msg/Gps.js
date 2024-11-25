// Auto-generated. Do not edit!

// (in-package cbnu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Gps {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pos_lat = null;
      this.pos_long = null;
      this.heading = null;
      this.time = null;
    }
    else {
      if (initObj.hasOwnProperty('pos_lat')) {
        this.pos_lat = initObj.pos_lat
      }
      else {
        this.pos_lat = 0.0;
      }
      if (initObj.hasOwnProperty('pos_long')) {
        this.pos_long = initObj.pos_long
      }
      else {
        this.pos_long = 0.0;
      }
      if (initObj.hasOwnProperty('heading')) {
        this.heading = initObj.heading
      }
      else {
        this.heading = 0.0;
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = {secs: 0, nsecs: 0};
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Gps
    // Serialize message field [pos_lat]
    bufferOffset = _serializer.float32(obj.pos_lat, buffer, bufferOffset);
    // Serialize message field [pos_long]
    bufferOffset = _serializer.float32(obj.pos_long, buffer, bufferOffset);
    // Serialize message field [heading]
    bufferOffset = _serializer.float32(obj.heading, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.time(obj.time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Gps
    let len;
    let data = new Gps(null);
    // Deserialize message field [pos_lat]
    data.pos_lat = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pos_long]
    data.pos_long = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [heading]
    data.heading = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.time(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cbnu_msgs/Gps';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f291b40ae5c9f111db04d93e1694b68b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 pos_lat
    float32 pos_long
    float32 heading
    time time
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Gps(null);
    if (msg.pos_lat !== undefined) {
      resolved.pos_lat = msg.pos_lat;
    }
    else {
      resolved.pos_lat = 0.0
    }

    if (msg.pos_long !== undefined) {
      resolved.pos_long = msg.pos_long;
    }
    else {
      resolved.pos_long = 0.0
    }

    if (msg.heading !== undefined) {
      resolved.heading = msg.heading;
    }
    else {
      resolved.heading = 0.0
    }

    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = {secs: 0, nsecs: 0}
    }

    return resolved;
    }
};

module.exports = Gps;
