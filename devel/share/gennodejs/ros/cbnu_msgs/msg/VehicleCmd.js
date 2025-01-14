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

class VehicleCmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.longlCmdType = null;
      this.accel = null;
      this.brake = null;
      this.steering = null;
      this.velocity = null;
      this.acceleration = null;
      this.gear_cmd = null;
    }
    else {
      if (initObj.hasOwnProperty('longlCmdType')) {
        this.longlCmdType = initObj.longlCmdType
      }
      else {
        this.longlCmdType = 0;
      }
      if (initObj.hasOwnProperty('accel')) {
        this.accel = initObj.accel
      }
      else {
        this.accel = 0.0;
      }
      if (initObj.hasOwnProperty('brake')) {
        this.brake = initObj.brake
      }
      else {
        this.brake = 0.0;
      }
      if (initObj.hasOwnProperty('steering')) {
        this.steering = initObj.steering
      }
      else {
        this.steering = 0.0;
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = 0.0;
      }
      if (initObj.hasOwnProperty('acceleration')) {
        this.acceleration = initObj.acceleration
      }
      else {
        this.acceleration = 0.0;
      }
      if (initObj.hasOwnProperty('gear_cmd')) {
        this.gear_cmd = initObj.gear_cmd
      }
      else {
        this.gear_cmd = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VehicleCmd
    // Serialize message field [longlCmdType]
    bufferOffset = _serializer.int32(obj.longlCmdType, buffer, bufferOffset);
    // Serialize message field [accel]
    bufferOffset = _serializer.float64(obj.accel, buffer, bufferOffset);
    // Serialize message field [brake]
    bufferOffset = _serializer.float64(obj.brake, buffer, bufferOffset);
    // Serialize message field [steering]
    bufferOffset = _serializer.float64(obj.steering, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = _serializer.float64(obj.velocity, buffer, bufferOffset);
    // Serialize message field [acceleration]
    bufferOffset = _serializer.float64(obj.acceleration, buffer, bufferOffset);
    // Serialize message field [gear_cmd]
    bufferOffset = _serializer.int32(obj.gear_cmd, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VehicleCmd
    let len;
    let data = new VehicleCmd(null);
    // Deserialize message field [longlCmdType]
    data.longlCmdType = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [accel]
    data.accel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [brake]
    data.brake = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [steering]
    data.steering = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [acceleration]
    data.acceleration = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [gear_cmd]
    data.gear_cmd = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cbnu_msgs/VehicleCmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bc5dabc414df130ec3a9ba0a4c5344ce';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 longlCmdType
    float64 accel
    float64 brake
    float64 steering
    float64 velocity
    float64 acceleration
    int32 gear_cmd
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VehicleCmd(null);
    if (msg.longlCmdType !== undefined) {
      resolved.longlCmdType = msg.longlCmdType;
    }
    else {
      resolved.longlCmdType = 0
    }

    if (msg.accel !== undefined) {
      resolved.accel = msg.accel;
    }
    else {
      resolved.accel = 0.0
    }

    if (msg.brake !== undefined) {
      resolved.brake = msg.brake;
    }
    else {
      resolved.brake = 0.0
    }

    if (msg.steering !== undefined) {
      resolved.steering = msg.steering;
    }
    else {
      resolved.steering = 0.0
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = 0.0
    }

    if (msg.acceleration !== undefined) {
      resolved.acceleration = msg.acceleration;
    }
    else {
      resolved.acceleration = 0.0
    }

    if (msg.gear_cmd !== undefined) {
      resolved.gear_cmd = msg.gear_cmd;
    }
    else {
      resolved.gear_cmd = 0
    }

    return resolved;
    }
};

module.exports = VehicleCmd;
