// Auto-generated. Do not edit!

// (in-package wot_pkg.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let nav_msgs = _finder('nav_msgs');
let visualization_msgs = _finder('visualization_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class is_hitRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.hitbox = null;
      this.hit_location = null;
    }
    else {
      if (initObj.hasOwnProperty('hitbox')) {
        this.hitbox = initObj.hitbox
      }
      else {
        this.hitbox = new visualization_msgs.msg.Marker();
      }
      if (initObj.hasOwnProperty('hit_location')) {
        this.hit_location = initObj.hit_location
      }
      else {
        this.hit_location = new nav_msgs.msg.Odometry();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type is_hitRequest
    // Serialize message field [hitbox]
    bufferOffset = visualization_msgs.msg.Marker.serialize(obj.hitbox, buffer, bufferOffset);
    // Serialize message field [hit_location]
    bufferOffset = nav_msgs.msg.Odometry.serialize(obj.hit_location, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type is_hitRequest
    let len;
    let data = new is_hitRequest(null);
    // Deserialize message field [hitbox]
    data.hitbox = visualization_msgs.msg.Marker.deserialize(buffer, bufferOffset);
    // Deserialize message field [hit_location]
    data.hit_location = nav_msgs.msg.Odometry.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += visualization_msgs.msg.Marker.getMessageSize(object.hitbox);
    length += nav_msgs.msg.Odometry.getMessageSize(object.hit_location);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'wot_pkg/is_hitRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '94c7e6ad96bf8dcff171d5713a8b0458';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Request
    visualization_msgs/Marker hitbox
    nav_msgs/Odometry hit_location
    
    
    ================================================================================
    MSG: visualization_msgs/Marker
    # See http://www.ros.org/wiki/rviz/DisplayTypes/Marker and http://www.ros.org/wiki/rviz/Tutorials/Markers%3A%20Basic%20Shapes for more information on using this message with rviz
    
    uint8 ARROW=0
    uint8 CUBE=1
    uint8 SPHERE=2
    uint8 CYLINDER=3
    uint8 LINE_STRIP=4
    uint8 LINE_LIST=5
    uint8 CUBE_LIST=6
    uint8 SPHERE_LIST=7
    uint8 POINTS=8
    uint8 TEXT_VIEW_FACING=9
    uint8 MESH_RESOURCE=10
    uint8 TRIANGLE_LIST=11
    
    uint8 ADD=0
    uint8 MODIFY=0
    uint8 DELETE=2
    uint8 DELETEALL=3
    
    Header header                        # header for time/frame information
    string ns                            # Namespace to place this object in... used in conjunction with id to create a unique name for the object
    int32 id 		                         # object ID useful in conjunction with the namespace for manipulating and deleting the object later
    int32 type 		                       # Type of object
    int32 action 	                       # 0 add/modify an object, 1 (deprecated), 2 deletes an object, 3 deletes all objects
    geometry_msgs/Pose pose                 # Pose of the object
    geometry_msgs/Vector3 scale             # Scale of the object 1,1,1 means default (usually 1 meter square)
    std_msgs/ColorRGBA color             # Color [0.0-1.0]
    duration lifetime                    # How long the object should last before being automatically deleted.  0 means forever
    bool frame_locked                    # If this marker should be frame-locked, i.e. retransformed into its frame every timestep
    
    #Only used if the type specified has some use for them (eg. POINTS, LINE_STRIP, ...)
    geometry_msgs/Point[] points
    #Only used if the type specified has some use for them (eg. POINTS, LINE_STRIP, ...)
    #number of colors must either be 0 or equal to the number of points
    #NOTE: alpha is not yet used
    std_msgs/ColorRGBA[] colors
    
    # NOTE: only used for text markers
    string text
    
    # NOTE: only used for MESH_RESOURCE markers
    string mesh_resource
    bool mesh_use_embedded_materials
    
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
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: std_msgs/ColorRGBA
    float32 r
    float32 g
    float32 b
    float32 a
    
    ================================================================================
    MSG: nav_msgs/Odometry
    # This represents an estimate of a position and velocity in free space.  
    # The pose in this message should be specified in the coordinate frame given by header.frame_id.
    # The twist in this message should be specified in the coordinate frame given by the child_frame_id
    Header header
    string child_frame_id
    geometry_msgs/PoseWithCovariance pose
    geometry_msgs/TwistWithCovariance twist
    
    ================================================================================
    MSG: geometry_msgs/PoseWithCovariance
    # This represents a pose in free space with uncertainty.
    
    Pose pose
    
    # Row-major representation of the 6x6 covariance matrix
    # The orientation parameters use a fixed-axis representation.
    # In order, the parameters are:
    # (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
    float64[36] covariance
    
    ================================================================================
    MSG: geometry_msgs/TwistWithCovariance
    # This expresses velocity in free space with uncertainty.
    
    Twist twist
    
    # Row-major representation of the 6x6 covariance matrix
    # The orientation parameters use a fixed-axis representation.
    # In order, the parameters are:
    # (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
    float64[36] covariance
    
    ================================================================================
    MSG: geometry_msgs/Twist
    # This expresses velocity in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new is_hitRequest(null);
    if (msg.hitbox !== undefined) {
      resolved.hitbox = visualization_msgs.msg.Marker.Resolve(msg.hitbox)
    }
    else {
      resolved.hitbox = new visualization_msgs.msg.Marker()
    }

    if (msg.hit_location !== undefined) {
      resolved.hit_location = nav_msgs.msg.Odometry.Resolve(msg.hit_location)
    }
    else {
      resolved.hit_location = new nav_msgs.msg.Odometry()
    }

    return resolved;
    }
};

class is_hitResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.is_hit = null;
    }
    else {
      if (initObj.hasOwnProperty('is_hit')) {
        this.is_hit = initObj.is_hit
      }
      else {
        this.is_hit = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type is_hitResponse
    // Serialize message field [is_hit]
    bufferOffset = _serializer.bool(obj.is_hit, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type is_hitResponse
    let len;
    let data = new is_hitResponse(null);
    // Deserialize message field [is_hit]
    data.is_hit = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'wot_pkg/is_hitResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3a911ee423cc0145b8d402809243cbcf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # Response
    bool is_hit
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new is_hitResponse(null);
    if (msg.is_hit !== undefined) {
      resolved.is_hit = msg.is_hit;
    }
    else {
      resolved.is_hit = false
    }

    return resolved;
    }
};

module.exports = {
  Request: is_hitRequest,
  Response: is_hitResponse,
  md5sum() { return '8c3518b3cea1613b70e7336af9bd5db1'; },
  datatype() { return 'wot_pkg/is_hit'; }
};
