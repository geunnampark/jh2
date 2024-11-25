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

class VehicleTlm {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ned_latitude = null;
      this.ned_longitude = null;
      this.ned_heading = null;
      this.speed = null;
      this.steering_angle = null;
      this.steering_angular_velocity = null;
      this.wheel_velocity_fl = null;
      this.wheel_velocity_fr = null;
      this.wheel_velocity_rl = null;
      this.wheel_velocity_rr = null;
      this.wheel_size_fl = null;
      this.wheel_size_fr = null;
      this.wheel_size_rl = null;
      this.wheel_size_rr = null;
      this.acceleration_left = null;
      this.acceleration_forward = null;
      this.roll = null;
      this.pitch = null;
      this.yaw = null;
      this.wheel_base = null;
      this.curb_weight = null;
    }
    else {
      if (initObj.hasOwnProperty('ned_latitude')) {
        this.ned_latitude = initObj.ned_latitude
      }
      else {
        this.ned_latitude = 0.0;
      }
      if (initObj.hasOwnProperty('ned_longitude')) {
        this.ned_longitude = initObj.ned_longitude
      }
      else {
        this.ned_longitude = 0.0;
      }
      if (initObj.hasOwnProperty('ned_heading')) {
        this.ned_heading = initObj.ned_heading
      }
      else {
        this.ned_heading = 0.0;
      }
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0.0;
      }
      if (initObj.hasOwnProperty('steering_angle')) {
        this.steering_angle = initObj.steering_angle
      }
      else {
        this.steering_angle = 0.0;
      }
      if (initObj.hasOwnProperty('steering_angular_velocity')) {
        this.steering_angular_velocity = initObj.steering_angular_velocity
      }
      else {
        this.steering_angular_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_velocity_fl')) {
        this.wheel_velocity_fl = initObj.wheel_velocity_fl
      }
      else {
        this.wheel_velocity_fl = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_velocity_fr')) {
        this.wheel_velocity_fr = initObj.wheel_velocity_fr
      }
      else {
        this.wheel_velocity_fr = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_velocity_rl')) {
        this.wheel_velocity_rl = initObj.wheel_velocity_rl
      }
      else {
        this.wheel_velocity_rl = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_velocity_rr')) {
        this.wheel_velocity_rr = initObj.wheel_velocity_rr
      }
      else {
        this.wheel_velocity_rr = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_size_fl')) {
        this.wheel_size_fl = initObj.wheel_size_fl
      }
      else {
        this.wheel_size_fl = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_size_fr')) {
        this.wheel_size_fr = initObj.wheel_size_fr
      }
      else {
        this.wheel_size_fr = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_size_rl')) {
        this.wheel_size_rl = initObj.wheel_size_rl
      }
      else {
        this.wheel_size_rl = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_size_rr')) {
        this.wheel_size_rr = initObj.wheel_size_rr
      }
      else {
        this.wheel_size_rr = 0.0;
      }
      if (initObj.hasOwnProperty('acceleration_left')) {
        this.acceleration_left = initObj.acceleration_left
      }
      else {
        this.acceleration_left = 0.0;
      }
      if (initObj.hasOwnProperty('acceleration_forward')) {
        this.acceleration_forward = initObj.acceleration_forward
      }
      else {
        this.acceleration_forward = 0.0;
      }
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = 0.0;
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_base')) {
        this.wheel_base = initObj.wheel_base
      }
      else {
        this.wheel_base = 0.0;
      }
      if (initObj.hasOwnProperty('curb_weight')) {
        this.curb_weight = initObj.curb_weight
      }
      else {
        this.curb_weight = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VehicleTlm
    // Serialize message field [ned_latitude]
    bufferOffset = _serializer.float64(obj.ned_latitude, buffer, bufferOffset);
    // Serialize message field [ned_longitude]
    bufferOffset = _serializer.float64(obj.ned_longitude, buffer, bufferOffset);
    // Serialize message field [ned_heading]
    bufferOffset = _serializer.float64(obj.ned_heading, buffer, bufferOffset);
    // Serialize message field [speed]
    bufferOffset = _serializer.float64(obj.speed, buffer, bufferOffset);
    // Serialize message field [steering_angle]
    bufferOffset = _serializer.float64(obj.steering_angle, buffer, bufferOffset);
    // Serialize message field [steering_angular_velocity]
    bufferOffset = _serializer.float64(obj.steering_angular_velocity, buffer, bufferOffset);
    // Serialize message field [wheel_velocity_fl]
    bufferOffset = _serializer.float64(obj.wheel_velocity_fl, buffer, bufferOffset);
    // Serialize message field [wheel_velocity_fr]
    bufferOffset = _serializer.float64(obj.wheel_velocity_fr, buffer, bufferOffset);
    // Serialize message field [wheel_velocity_rl]
    bufferOffset = _serializer.float64(obj.wheel_velocity_rl, buffer, bufferOffset);
    // Serialize message field [wheel_velocity_rr]
    bufferOffset = _serializer.float64(obj.wheel_velocity_rr, buffer, bufferOffset);
    // Serialize message field [wheel_size_fl]
    bufferOffset = _serializer.float64(obj.wheel_size_fl, buffer, bufferOffset);
    // Serialize message field [wheel_size_fr]
    bufferOffset = _serializer.float64(obj.wheel_size_fr, buffer, bufferOffset);
    // Serialize message field [wheel_size_rl]
    bufferOffset = _serializer.float64(obj.wheel_size_rl, buffer, bufferOffset);
    // Serialize message field [wheel_size_rr]
    bufferOffset = _serializer.float64(obj.wheel_size_rr, buffer, bufferOffset);
    // Serialize message field [acceleration_left]
    bufferOffset = _serializer.float64(obj.acceleration_left, buffer, bufferOffset);
    // Serialize message field [acceleration_forward]
    bufferOffset = _serializer.float64(obj.acceleration_forward, buffer, bufferOffset);
    // Serialize message field [roll]
    bufferOffset = _serializer.float64(obj.roll, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = _serializer.float64(obj.pitch, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float64(obj.yaw, buffer, bufferOffset);
    // Serialize message field [wheel_base]
    bufferOffset = _serializer.float64(obj.wheel_base, buffer, bufferOffset);
    // Serialize message field [curb_weight]
    bufferOffset = _serializer.float64(obj.curb_weight, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VehicleTlm
    let len;
    let data = new VehicleTlm(null);
    // Deserialize message field [ned_latitude]
    data.ned_latitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ned_longitude]
    data.ned_longitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ned_heading]
    data.ned_heading = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed]
    data.speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [steering_angle]
    data.steering_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [steering_angular_velocity]
    data.steering_angular_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wheel_velocity_fl]
    data.wheel_velocity_fl = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wheel_velocity_fr]
    data.wheel_velocity_fr = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wheel_velocity_rl]
    data.wheel_velocity_rl = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wheel_velocity_rr]
    data.wheel_velocity_rr = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wheel_size_fl]
    data.wheel_size_fl = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wheel_size_fr]
    data.wheel_size_fr = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wheel_size_rl]
    data.wheel_size_rl = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wheel_size_rr]
    data.wheel_size_rr = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [acceleration_left]
    data.acceleration_left = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [acceleration_forward]
    data.acceleration_forward = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [roll]
    data.roll = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wheel_base]
    data.wheel_base = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [curb_weight]
    data.curb_weight = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 168;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cbnu_msgs/VehicleTlm';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '140037dd6fb977de3cb0c0931cbb58a4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 ned_latitude
    float64 ned_longitude
    float64 ned_heading
    
    float64 speed
    
    float64 steering_angle
    float64 steering_angular_velocity
    
    float64 wheel_velocity_fl
    float64 wheel_velocity_fr
    float64 wheel_velocity_rl
    float64 wheel_velocity_rr
    
    float64 wheel_size_fl
    float64 wheel_size_fr
    float64 wheel_size_rl
    float64 wheel_size_rr
    
    float64 acceleration_left
    float64 acceleration_forward
    
    float64 roll
    float64 pitch
    float64 yaw
    
    float64 wheel_base
    float64 curb_weight
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VehicleTlm(null);
    if (msg.ned_latitude !== undefined) {
      resolved.ned_latitude = msg.ned_latitude;
    }
    else {
      resolved.ned_latitude = 0.0
    }

    if (msg.ned_longitude !== undefined) {
      resolved.ned_longitude = msg.ned_longitude;
    }
    else {
      resolved.ned_longitude = 0.0
    }

    if (msg.ned_heading !== undefined) {
      resolved.ned_heading = msg.ned_heading;
    }
    else {
      resolved.ned_heading = 0.0
    }

    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0.0
    }

    if (msg.steering_angle !== undefined) {
      resolved.steering_angle = msg.steering_angle;
    }
    else {
      resolved.steering_angle = 0.0
    }

    if (msg.steering_angular_velocity !== undefined) {
      resolved.steering_angular_velocity = msg.steering_angular_velocity;
    }
    else {
      resolved.steering_angular_velocity = 0.0
    }

    if (msg.wheel_velocity_fl !== undefined) {
      resolved.wheel_velocity_fl = msg.wheel_velocity_fl;
    }
    else {
      resolved.wheel_velocity_fl = 0.0
    }

    if (msg.wheel_velocity_fr !== undefined) {
      resolved.wheel_velocity_fr = msg.wheel_velocity_fr;
    }
    else {
      resolved.wheel_velocity_fr = 0.0
    }

    if (msg.wheel_velocity_rl !== undefined) {
      resolved.wheel_velocity_rl = msg.wheel_velocity_rl;
    }
    else {
      resolved.wheel_velocity_rl = 0.0
    }

    if (msg.wheel_velocity_rr !== undefined) {
      resolved.wheel_velocity_rr = msg.wheel_velocity_rr;
    }
    else {
      resolved.wheel_velocity_rr = 0.0
    }

    if (msg.wheel_size_fl !== undefined) {
      resolved.wheel_size_fl = msg.wheel_size_fl;
    }
    else {
      resolved.wheel_size_fl = 0.0
    }

    if (msg.wheel_size_fr !== undefined) {
      resolved.wheel_size_fr = msg.wheel_size_fr;
    }
    else {
      resolved.wheel_size_fr = 0.0
    }

    if (msg.wheel_size_rl !== undefined) {
      resolved.wheel_size_rl = msg.wheel_size_rl;
    }
    else {
      resolved.wheel_size_rl = 0.0
    }

    if (msg.wheel_size_rr !== undefined) {
      resolved.wheel_size_rr = msg.wheel_size_rr;
    }
    else {
      resolved.wheel_size_rr = 0.0
    }

    if (msg.acceleration_left !== undefined) {
      resolved.acceleration_left = msg.acceleration_left;
    }
    else {
      resolved.acceleration_left = 0.0
    }

    if (msg.acceleration_forward !== undefined) {
      resolved.acceleration_forward = msg.acceleration_forward;
    }
    else {
      resolved.acceleration_forward = 0.0
    }

    if (msg.roll !== undefined) {
      resolved.roll = msg.roll;
    }
    else {
      resolved.roll = 0.0
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.wheel_base !== undefined) {
      resolved.wheel_base = msg.wheel_base;
    }
    else {
      resolved.wheel_base = 0.0
    }

    if (msg.curb_weight !== undefined) {
      resolved.curb_weight = msg.curb_weight;
    }
    else {
      resolved.curb_weight = 0.0
    }

    return resolved;
    }
};

module.exports = VehicleTlm;
