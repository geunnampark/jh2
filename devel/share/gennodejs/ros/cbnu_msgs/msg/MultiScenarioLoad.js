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

class MultiScenarioLoad {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.file_name = null;
      this.load_ego_vehicle_data = null;
      this.load_surrounding_vehicle_data = null;
      this.load_pedestrian_data = null;
      this.load_object_data = null;
    }
    else {
      if (initObj.hasOwnProperty('file_name')) {
        this.file_name = initObj.file_name
      }
      else {
        this.file_name = [];
      }
      if (initObj.hasOwnProperty('load_ego_vehicle_data')) {
        this.load_ego_vehicle_data = initObj.load_ego_vehicle_data
      }
      else {
        this.load_ego_vehicle_data = [];
      }
      if (initObj.hasOwnProperty('load_surrounding_vehicle_data')) {
        this.load_surrounding_vehicle_data = initObj.load_surrounding_vehicle_data
      }
      else {
        this.load_surrounding_vehicle_data = [];
      }
      if (initObj.hasOwnProperty('load_pedestrian_data')) {
        this.load_pedestrian_data = initObj.load_pedestrian_data
      }
      else {
        this.load_pedestrian_data = [];
      }
      if (initObj.hasOwnProperty('load_object_data')) {
        this.load_object_data = initObj.load_object_data
      }
      else {
        this.load_object_data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MultiScenarioLoad
    // Serialize message field [file_name]
    bufferOffset = _arraySerializer.string(obj.file_name, buffer, bufferOffset, null);
    // Serialize message field [load_ego_vehicle_data]
    bufferOffset = _arraySerializer.bool(obj.load_ego_vehicle_data, buffer, bufferOffset, null);
    // Serialize message field [load_surrounding_vehicle_data]
    bufferOffset = _arraySerializer.bool(obj.load_surrounding_vehicle_data, buffer, bufferOffset, null);
    // Serialize message field [load_pedestrian_data]
    bufferOffset = _arraySerializer.bool(obj.load_pedestrian_data, buffer, bufferOffset, null);
    // Serialize message field [load_object_data]
    bufferOffset = _arraySerializer.bool(obj.load_object_data, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MultiScenarioLoad
    let len;
    let data = new MultiScenarioLoad(null);
    // Deserialize message field [file_name]
    data.file_name = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [load_ego_vehicle_data]
    data.load_ego_vehicle_data = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [load_surrounding_vehicle_data]
    data.load_surrounding_vehicle_data = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [load_pedestrian_data]
    data.load_pedestrian_data = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [load_object_data]
    data.load_object_data = _arrayDeserializer.bool(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.file_name.forEach((val) => {
      length += 4 + val.length;
    });
    length += object.load_ego_vehicle_data.length;
    length += object.load_surrounding_vehicle_data.length;
    length += object.load_pedestrian_data.length;
    length += object.load_object_data.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cbnu_msgs/MultiScenarioLoad';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '72663bbaba4c22d9e77ddf06c9dac39c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] file_name
    bool[] load_ego_vehicle_data
    bool[] load_surrounding_vehicle_data
    bool[] load_pedestrian_data
    bool[] load_object_data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MultiScenarioLoad(null);
    if (msg.file_name !== undefined) {
      resolved.file_name = msg.file_name;
    }
    else {
      resolved.file_name = []
    }

    if (msg.load_ego_vehicle_data !== undefined) {
      resolved.load_ego_vehicle_data = msg.load_ego_vehicle_data;
    }
    else {
      resolved.load_ego_vehicle_data = []
    }

    if (msg.load_surrounding_vehicle_data !== undefined) {
      resolved.load_surrounding_vehicle_data = msg.load_surrounding_vehicle_data;
    }
    else {
      resolved.load_surrounding_vehicle_data = []
    }

    if (msg.load_pedestrian_data !== undefined) {
      resolved.load_pedestrian_data = msg.load_pedestrian_data;
    }
    else {
      resolved.load_pedestrian_data = []
    }

    if (msg.load_object_data !== undefined) {
      resolved.load_object_data = msg.load_object_data;
    }
    else {
      resolved.load_object_data = []
    }

    return resolved;
    }
};

module.exports = MultiScenarioLoad;
