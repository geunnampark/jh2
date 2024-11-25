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

class AnObjectData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.object_type = null;
      this.rel_pos_x = null;
      this.rel_pos_y = null;
      this.global_pos_lat = null;
      this.global_pos_lon = null;
    }
    else {
      if (initObj.hasOwnProperty('object_type')) {
        this.object_type = initObj.object_type
      }
      else {
        this.object_type = '';
      }
      if (initObj.hasOwnProperty('rel_pos_x')) {
        this.rel_pos_x = initObj.rel_pos_x
      }
      else {
        this.rel_pos_x = 0.0;
      }
      if (initObj.hasOwnProperty('rel_pos_y')) {
        this.rel_pos_y = initObj.rel_pos_y
      }
      else {
        this.rel_pos_y = 0.0;
      }
      if (initObj.hasOwnProperty('global_pos_lat')) {
        this.global_pos_lat = initObj.global_pos_lat
      }
      else {
        this.global_pos_lat = 0.0;
      }
      if (initObj.hasOwnProperty('global_pos_lon')) {
        this.global_pos_lon = initObj.global_pos_lon
      }
      else {
        this.global_pos_lon = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AnObjectData
    // Serialize message field [object_type]
    bufferOffset = _serializer.string(obj.object_type, buffer, bufferOffset);
    // Serialize message field [rel_pos_x]
    bufferOffset = _serializer.float32(obj.rel_pos_x, buffer, bufferOffset);
    // Serialize message field [rel_pos_y]
    bufferOffset = _serializer.float32(obj.rel_pos_y, buffer, bufferOffset);
    // Serialize message field [global_pos_lat]
    bufferOffset = _serializer.float32(obj.global_pos_lat, buffer, bufferOffset);
    // Serialize message field [global_pos_lon]
    bufferOffset = _serializer.float32(obj.global_pos_lon, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AnObjectData
    let len;
    let data = new AnObjectData(null);
    // Deserialize message field [object_type]
    data.object_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [rel_pos_x]
    data.rel_pos_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rel_pos_y]
    data.rel_pos_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [global_pos_lat]
    data.global_pos_lat = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [global_pos_lon]
    data.global_pos_lon = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.object_type.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cbnu_msgs/AnObjectData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f64d9f4ae123fec27fe26952d0c80dfc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string object_type
    float32 rel_pos_x
    float32 rel_pos_y
    float32 global_pos_lat
    float32 global_pos_lon
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AnObjectData(null);
    if (msg.object_type !== undefined) {
      resolved.object_type = msg.object_type;
    }
    else {
      resolved.object_type = ''
    }

    if (msg.rel_pos_x !== undefined) {
      resolved.rel_pos_x = msg.rel_pos_x;
    }
    else {
      resolved.rel_pos_x = 0.0
    }

    if (msg.rel_pos_y !== undefined) {
      resolved.rel_pos_y = msg.rel_pos_y;
    }
    else {
      resolved.rel_pos_y = 0.0
    }

    if (msg.global_pos_lat !== undefined) {
      resolved.global_pos_lat = msg.global_pos_lat;
    }
    else {
      resolved.global_pos_lat = 0.0
    }

    if (msg.global_pos_lon !== undefined) {
      resolved.global_pos_lon = msg.global_pos_lon;
    }
    else {
      resolved.global_pos_lon = 0.0
    }

    return resolved;
    }
};

module.exports = AnObjectData;
