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

class FactoryAddress {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.factory_addr_row = null;
      this.factory_addr_col = null;
      this.mission_index = null;
    }
    else {
      if (initObj.hasOwnProperty('factory_addr_row')) {
        this.factory_addr_row = initObj.factory_addr_row
      }
      else {
        this.factory_addr_row = 0;
      }
      if (initObj.hasOwnProperty('factory_addr_col')) {
        this.factory_addr_col = initObj.factory_addr_col
      }
      else {
        this.factory_addr_col = 0;
      }
      if (initObj.hasOwnProperty('mission_index')) {
        this.mission_index = initObj.mission_index
      }
      else {
        this.mission_index = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FactoryAddress
    // Serialize message field [factory_addr_row]
    bufferOffset = _serializer.int32(obj.factory_addr_row, buffer, bufferOffset);
    // Serialize message field [factory_addr_col]
    bufferOffset = _serializer.int32(obj.factory_addr_col, buffer, bufferOffset);
    // Serialize message field [mission_index]
    bufferOffset = _serializer.int32(obj.mission_index, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FactoryAddress
    let len;
    let data = new FactoryAddress(null);
    // Deserialize message field [factory_addr_row]
    data.factory_addr_row = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [factory_addr_col]
    data.factory_addr_col = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [mission_index]
    data.mission_index = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/FactoryAddress';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3a5097aee45ce9c14e33f6cc877af060';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 factory_addr_row
    int32 factory_addr_col
    
    int32 mission_index
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FactoryAddress(null);
    if (msg.factory_addr_row !== undefined) {
      resolved.factory_addr_row = msg.factory_addr_row;
    }
    else {
      resolved.factory_addr_row = 0
    }

    if (msg.factory_addr_col !== undefined) {
      resolved.factory_addr_col = msg.factory_addr_col;
    }
    else {
      resolved.factory_addr_col = 0
    }

    if (msg.mission_index !== undefined) {
      resolved.mission_index = msg.mission_index;
    }
    else {
      resolved.mission_index = 0
    }

    return resolved;
    }
};

module.exports = FactoryAddress;
