; Auto-generated. Do not edit!


(cl:in-package wot_pkg-srv)


;//! \htmlinclude is_hit-request.msg.html

(cl:defclass <is_hit-request> (roslisp-msg-protocol:ros-message)
  ((hitbox
    :reader hitbox
    :initarg :hitbox
    :type visualization_msgs-msg:Marker
    :initform (cl:make-instance 'visualization_msgs-msg:Marker))
   (hit_location
    :reader hit_location
    :initarg :hit_location
    :type nav_msgs-msg:Odometry
    :initform (cl:make-instance 'nav_msgs-msg:Odometry)))
)

(cl:defclass is_hit-request (<is_hit-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <is_hit-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'is_hit-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wot_pkg-srv:<is_hit-request> is deprecated: use wot_pkg-srv:is_hit-request instead.")))

(cl:ensure-generic-function 'hitbox-val :lambda-list '(m))
(cl:defmethod hitbox-val ((m <is_hit-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wot_pkg-srv:hitbox-val is deprecated.  Use wot_pkg-srv:hitbox instead.")
  (hitbox m))

(cl:ensure-generic-function 'hit_location-val :lambda-list '(m))
(cl:defmethod hit_location-val ((m <is_hit-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wot_pkg-srv:hit_location-val is deprecated.  Use wot_pkg-srv:hit_location instead.")
  (hit_location m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <is_hit-request>) ostream)
  "Serializes a message object of type '<is_hit-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'hitbox) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'hit_location) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <is_hit-request>) istream)
  "Deserializes a message object of type '<is_hit-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'hitbox) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'hit_location) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<is_hit-request>)))
  "Returns string type for a service object of type '<is_hit-request>"
  "wot_pkg/is_hitRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'is_hit-request)))
  "Returns string type for a service object of type 'is_hit-request"
  "wot_pkg/is_hitRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<is_hit-request>)))
  "Returns md5sum for a message object of type '<is_hit-request>"
  "8c3518b3cea1613b70e7336af9bd5db1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'is_hit-request)))
  "Returns md5sum for a message object of type 'is_hit-request"
  "8c3518b3cea1613b70e7336af9bd5db1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<is_hit-request>)))
  "Returns full string definition for message of type '<is_hit-request>"
  (cl:format cl:nil "# Request~%visualization_msgs/Marker hitbox~%nav_msgs/Odometry hit_location~%~%~%================================================================================~%MSG: visualization_msgs/Marker~%# See http://www.ros.org/wiki/rviz/DisplayTypes/Marker and http://www.ros.org/wiki/rviz/Tutorials/Markers%3A%20Basic%20Shapes for more information on using this message with rviz~%~%uint8 ARROW=0~%uint8 CUBE=1~%uint8 SPHERE=2~%uint8 CYLINDER=3~%uint8 LINE_STRIP=4~%uint8 LINE_LIST=5~%uint8 CUBE_LIST=6~%uint8 SPHERE_LIST=7~%uint8 POINTS=8~%uint8 TEXT_VIEW_FACING=9~%uint8 MESH_RESOURCE=10~%uint8 TRIANGLE_LIST=11~%~%uint8 ADD=0~%uint8 MODIFY=0~%uint8 DELETE=2~%uint8 DELETEALL=3~%~%Header header                        # header for time/frame information~%string ns                            # Namespace to place this object in... used in conjunction with id to create a unique name for the object~%int32 id 		                         # object ID useful in conjunction with the namespace for manipulating and deleting the object later~%int32 type 		                       # Type of object~%int32 action 	                       # 0 add/modify an object, 1 (deprecated), 2 deletes an object, 3 deletes all objects~%geometry_msgs/Pose pose                 # Pose of the object~%geometry_msgs/Vector3 scale             # Scale of the object 1,1,1 means default (usually 1 meter square)~%std_msgs/ColorRGBA color             # Color [0.0-1.0]~%duration lifetime                    # How long the object should last before being automatically deleted.  0 means forever~%bool frame_locked                    # If this marker should be frame-locked, i.e. retransformed into its frame every timestep~%~%#Only used if the type specified has some use for them (eg. POINTS, LINE_STRIP, ...)~%geometry_msgs/Point[] points~%#Only used if the type specified has some use for them (eg. POINTS, LINE_STRIP, ...)~%#number of colors must either be 0 or equal to the number of points~%#NOTE: alpha is not yet used~%std_msgs/ColorRGBA[] colors~%~%# NOTE: only used for text markers~%string text~%~%# NOTE: only used for MESH_RESOURCE markers~%string mesh_resource~%bool mesh_use_embedded_materials~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: std_msgs/ColorRGBA~%float32 r~%float32 g~%float32 b~%float32 a~%~%================================================================================~%MSG: nav_msgs/Odometry~%# This represents an estimate of a position and velocity in free space.  ~%# The pose in this message should be specified in the coordinate frame given by header.frame_id.~%# The twist in this message should be specified in the coordinate frame given by the child_frame_id~%Header header~%string child_frame_id~%geometry_msgs/PoseWithCovariance pose~%geometry_msgs/TwistWithCovariance twist~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'is_hit-request)))
  "Returns full string definition for message of type 'is_hit-request"
  (cl:format cl:nil "# Request~%visualization_msgs/Marker hitbox~%nav_msgs/Odometry hit_location~%~%~%================================================================================~%MSG: visualization_msgs/Marker~%# See http://www.ros.org/wiki/rviz/DisplayTypes/Marker and http://www.ros.org/wiki/rviz/Tutorials/Markers%3A%20Basic%20Shapes for more information on using this message with rviz~%~%uint8 ARROW=0~%uint8 CUBE=1~%uint8 SPHERE=2~%uint8 CYLINDER=3~%uint8 LINE_STRIP=4~%uint8 LINE_LIST=5~%uint8 CUBE_LIST=6~%uint8 SPHERE_LIST=7~%uint8 POINTS=8~%uint8 TEXT_VIEW_FACING=9~%uint8 MESH_RESOURCE=10~%uint8 TRIANGLE_LIST=11~%~%uint8 ADD=0~%uint8 MODIFY=0~%uint8 DELETE=2~%uint8 DELETEALL=3~%~%Header header                        # header for time/frame information~%string ns                            # Namespace to place this object in... used in conjunction with id to create a unique name for the object~%int32 id 		                         # object ID useful in conjunction with the namespace for manipulating and deleting the object later~%int32 type 		                       # Type of object~%int32 action 	                       # 0 add/modify an object, 1 (deprecated), 2 deletes an object, 3 deletes all objects~%geometry_msgs/Pose pose                 # Pose of the object~%geometry_msgs/Vector3 scale             # Scale of the object 1,1,1 means default (usually 1 meter square)~%std_msgs/ColorRGBA color             # Color [0.0-1.0]~%duration lifetime                    # How long the object should last before being automatically deleted.  0 means forever~%bool frame_locked                    # If this marker should be frame-locked, i.e. retransformed into its frame every timestep~%~%#Only used if the type specified has some use for them (eg. POINTS, LINE_STRIP, ...)~%geometry_msgs/Point[] points~%#Only used if the type specified has some use for them (eg. POINTS, LINE_STRIP, ...)~%#number of colors must either be 0 or equal to the number of points~%#NOTE: alpha is not yet used~%std_msgs/ColorRGBA[] colors~%~%# NOTE: only used for text markers~%string text~%~%# NOTE: only used for MESH_RESOURCE markers~%string mesh_resource~%bool mesh_use_embedded_materials~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: std_msgs/ColorRGBA~%float32 r~%float32 g~%float32 b~%float32 a~%~%================================================================================~%MSG: nav_msgs/Odometry~%# This represents an estimate of a position and velocity in free space.  ~%# The pose in this message should be specified in the coordinate frame given by header.frame_id.~%# The twist in this message should be specified in the coordinate frame given by the child_frame_id~%Header header~%string child_frame_id~%geometry_msgs/PoseWithCovariance pose~%geometry_msgs/TwistWithCovariance twist~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <is_hit-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'hitbox))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'hit_location))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <is_hit-request>))
  "Converts a ROS message object to a list"
  (cl:list 'is_hit-request
    (cl:cons ':hitbox (hitbox msg))
    (cl:cons ':hit_location (hit_location msg))
))
;//! \htmlinclude is_hit-response.msg.html

(cl:defclass <is_hit-response> (roslisp-msg-protocol:ros-message)
  ((is_hit
    :reader is_hit
    :initarg :is_hit
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass is_hit-response (<is_hit-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <is_hit-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'is_hit-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wot_pkg-srv:<is_hit-response> is deprecated: use wot_pkg-srv:is_hit-response instead.")))

(cl:ensure-generic-function 'is_hit-val :lambda-list '(m))
(cl:defmethod is_hit-val ((m <is_hit-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wot_pkg-srv:is_hit-val is deprecated.  Use wot_pkg-srv:is_hit instead.")
  (is_hit m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <is_hit-response>) ostream)
  "Serializes a message object of type '<is_hit-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_hit) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <is_hit-response>) istream)
  "Deserializes a message object of type '<is_hit-response>"
    (cl:setf (cl:slot-value msg 'is_hit) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<is_hit-response>)))
  "Returns string type for a service object of type '<is_hit-response>"
  "wot_pkg/is_hitResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'is_hit-response)))
  "Returns string type for a service object of type 'is_hit-response"
  "wot_pkg/is_hitResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<is_hit-response>)))
  "Returns md5sum for a message object of type '<is_hit-response>"
  "8c3518b3cea1613b70e7336af9bd5db1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'is_hit-response)))
  "Returns md5sum for a message object of type 'is_hit-response"
  "8c3518b3cea1613b70e7336af9bd5db1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<is_hit-response>)))
  "Returns full string definition for message of type '<is_hit-response>"
  (cl:format cl:nil "~%# Response~%bool is_hit~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'is_hit-response)))
  "Returns full string definition for message of type 'is_hit-response"
  (cl:format cl:nil "~%# Response~%bool is_hit~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <is_hit-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <is_hit-response>))
  "Converts a ROS message object to a list"
  (cl:list 'is_hit-response
    (cl:cons ':is_hit (is_hit msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'is_hit)))
  'is_hit-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'is_hit)))
  'is_hit-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'is_hit)))
  "Returns string type for a service object of type '<is_hit>"
  "wot_pkg/is_hit")