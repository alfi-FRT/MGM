
(cl:in-package :asdf)

(defsystem "wot_pkg-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :nav_msgs-msg
               :visualization_msgs-msg
)
  :components ((:file "_package")
    (:file "is_hit" :depends-on ("_package_is_hit"))
    (:file "_package_is_hit" :depends-on ("_package"))
  ))