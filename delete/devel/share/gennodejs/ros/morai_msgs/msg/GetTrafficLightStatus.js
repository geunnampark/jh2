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

class GetTrafficLightStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.isAutoMode = null;
      this.trafficLightIndex = null;
      this.trafficLightType = null;
      this.trafficLightStatus = null;
    }
    else {
      if (initObj.hasOwnProperty('isAutoMode')) {
        this.isAutoMode = initObj.isAutoMode
      }
      else {
        this.isAutoMode = false;
      }
      if (initObj.hasOwnProperty('trafficLightIndex')) {
        this.trafficLightIndex = initObj.trafficLightIndex
      }
      else {
        this.trafficLightIndex = '';
      }
      if (initObj.hasOwnProperty('trafficLightType')) {
        this.trafficLightType = initObj.trafficLightType
      }
      else {
        this.trafficLightType = 0;
      }
      if (initObj.hasOwnProperty('trafficLightStatus')) {
        this.trafficLightStatus = initObj.trafficLightStatus
      }
      else {
        this.trafficLightStatus = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetTrafficLightStatus
    // Serialize message field [isAutoMode]
    bufferOffset = _serializer.bool(obj.isAutoMode, buffer, bufferOffset);
    // Serialize message field [trafficLightIndex]
    bufferOffset = _serializer.string(obj.trafficLightIndex, buffer, bufferOffset);
    // Serialize message field [trafficLightType]
    bufferOffset = _serializer.int16(obj.trafficLightType, buffer, bufferOffset);
    // Serialize message field [trafficLightStatus]
    bufferOffset = _serializer.int16(obj.trafficLightStatus, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetTrafficLightStatus
    let len;
    let data = new GetTrafficLightStatus(null);
    // Deserialize message field [isAutoMode]
    data.isAutoMode = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [trafficLightIndex]
    data.trafficLightIndex = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [trafficLightType]
    data.trafficLightType = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [trafficLightStatus]
    data.trafficLightStatus = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.trafficLightIndex.length;
    return length + 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/GetTrafficLightStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ec2c8ffd12138acdd9c85d70ff6d7d91';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool isAutoMode
    string trafficLightIndex
    int16 trafficLightType
    int16 trafficLightStatus
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetTrafficLightStatus(null);
    if (msg.isAutoMode !== undefined) {
      resolved.isAutoMode = msg.isAutoMode;
    }
    else {
      resolved.isAutoMode = false
    }

    if (msg.trafficLightIndex !== undefined) {
      resolved.trafficLightIndex = msg.trafficLightIndex;
    }
    else {
      resolved.trafficLightIndex = ''
    }

    if (msg.trafficLightType !== undefined) {
      resolved.trafficLightType = msg.trafficLightType;
    }
    else {
      resolved.trafficLightType = 0
    }

    if (msg.trafficLightStatus !== undefined) {
      resolved.trafficLightStatus = msg.trafficLightStatus;
    }
    else {
      resolved.trafficLightStatus = 0
    }

    return resolved;
    }
};

module.exports = GetTrafficLightStatus;
