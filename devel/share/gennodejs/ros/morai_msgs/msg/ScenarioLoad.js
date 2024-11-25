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

class ScenarioLoad {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.file_name = null;
      this.load_ego_vehicle_data = null;
      this.load_surrounding_vehicle_data = null;
      this.load_pedestrian_data = null;
    }
    else {
      if (initObj.hasOwnProperty('file_name')) {
        this.file_name = initObj.file_name
      }
      else {
        this.file_name = '';
      }
      if (initObj.hasOwnProperty('load_ego_vehicle_data')) {
        this.load_ego_vehicle_data = initObj.load_ego_vehicle_data
      }
      else {
        this.load_ego_vehicle_data = false;
      }
      if (initObj.hasOwnProperty('load_surrounding_vehicle_data')) {
        this.load_surrounding_vehicle_data = initObj.load_surrounding_vehicle_data
      }
      else {
        this.load_surrounding_vehicle_data = false;
      }
      if (initObj.hasOwnProperty('load_pedestrian_data')) {
        this.load_pedestrian_data = initObj.load_pedestrian_data
      }
      else {
        this.load_pedestrian_data = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ScenarioLoad
    // Serialize message field [file_name]
    bufferOffset = _serializer.string(obj.file_name, buffer, bufferOffset);
    // Serialize message field [load_ego_vehicle_data]
    bufferOffset = _serializer.bool(obj.load_ego_vehicle_data, buffer, bufferOffset);
    // Serialize message field [load_surrounding_vehicle_data]
    bufferOffset = _serializer.bool(obj.load_surrounding_vehicle_data, buffer, bufferOffset);
    // Serialize message field [load_pedestrian_data]
    bufferOffset = _serializer.bool(obj.load_pedestrian_data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ScenarioLoad
    let len;
    let data = new ScenarioLoad(null);
    // Deserialize message field [file_name]
    data.file_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [load_ego_vehicle_data]
    data.load_ego_vehicle_data = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [load_surrounding_vehicle_data]
    data.load_surrounding_vehicle_data = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [load_pedestrian_data]
    data.load_pedestrian_data = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.file_name.length;
    return length + 7;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/ScenarioLoad';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a4a97731b70c0c124bff12c7f07eac46';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string file_name
    bool load_ego_vehicle_data
    bool load_surrounding_vehicle_data
    bool load_pedestrian_data
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ScenarioLoad(null);
    if (msg.file_name !== undefined) {
      resolved.file_name = msg.file_name;
    }
    else {
      resolved.file_name = ''
    }

    if (msg.load_ego_vehicle_data !== undefined) {
      resolved.load_ego_vehicle_data = msg.load_ego_vehicle_data;
    }
    else {
      resolved.load_ego_vehicle_data = false
    }

    if (msg.load_surrounding_vehicle_data !== undefined) {
      resolved.load_surrounding_vehicle_data = msg.load_surrounding_vehicle_data;
    }
    else {
      resolved.load_surrounding_vehicle_data = false
    }

    if (msg.load_pedestrian_data !== undefined) {
      resolved.load_pedestrian_data = msg.load_pedestrian_data;
    }
    else {
      resolved.load_pedestrian_data = false
    }

    return resolved;
    }
};

module.exports = ScenarioLoad;
