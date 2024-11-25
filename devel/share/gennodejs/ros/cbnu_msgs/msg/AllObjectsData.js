// Auto-generated. Do not edit!

// (in-package cbnu_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let AnObjectData = require('./AnObjectData.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class AllObjectsData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.object_data_array = null;
      this.num_car = null;
      this.num_person = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('object_data_array')) {
        this.object_data_array = initObj.object_data_array
      }
      else {
        this.object_data_array = [];
      }
      if (initObj.hasOwnProperty('num_car')) {
        this.num_car = initObj.num_car
      }
      else {
        this.num_car = 0;
      }
      if (initObj.hasOwnProperty('num_person')) {
        this.num_person = initObj.num_person
      }
      else {
        this.num_person = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AllObjectsData
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [object_data_array]
    // Serialize the length for message field [object_data_array]
    bufferOffset = _serializer.uint32(obj.object_data_array.length, buffer, bufferOffset);
    obj.object_data_array.forEach((val) => {
      bufferOffset = AnObjectData.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [num_car]
    bufferOffset = _serializer.int8(obj.num_car, buffer, bufferOffset);
    // Serialize message field [num_person]
    bufferOffset = _serializer.int8(obj.num_person, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AllObjectsData
    let len;
    let data = new AllObjectsData(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [object_data_array]
    // Deserialize array length for message field [object_data_array]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.object_data_array = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.object_data_array[i] = AnObjectData.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [num_car]
    data.num_car = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [num_person]
    data.num_person = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.object_data_array.forEach((val) => {
      length += AnObjectData.getMessageSize(val);
    });
    return length + 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cbnu_msgs/AllObjectsData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ab8058e85871d4149538347822e71fe4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    AnObjectData[] object_data_array
    int8 num_car
    int8 num_person
    
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
    
    ================================================================================
    MSG: cbnu_msgs/AnObjectData
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
    const resolved = new AllObjectsData(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.object_data_array !== undefined) {
      resolved.object_data_array = new Array(msg.object_data_array.length);
      for (let i = 0; i < resolved.object_data_array.length; ++i) {
        resolved.object_data_array[i] = AnObjectData.Resolve(msg.object_data_array[i]);
      }
    }
    else {
      resolved.object_data_array = []
    }

    if (msg.num_car !== undefined) {
      resolved.num_car = msg.num_car;
    }
    else {
      resolved.num_car = 0
    }

    if (msg.num_person !== undefined) {
      resolved.num_person = msg.num_person;
    }
    else {
      resolved.num_person = 0
    }

    return resolved;
    }
};

module.exports = AllObjectsData;
