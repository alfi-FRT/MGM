#!/usr/bin/env python3

import roslib
import rospy
from ackermann_msgs.msg import AckermannDriveStamped
from std_msgs.msg import Float64, Bool
import sys, select, termios, tty
import _thread as thread
from numpy import clip

control_keys = {
    'up'    : '\x41',
    'down'  : '\x42',
    'right' : '\x43',
    'left'  : '\x44',
    'space' : '\x20',
    'tab'   : '\x09',
    'r'     : '\x72'}

key_bindings = {
    '\x41' : ( 0.5 , 0.0),
    '\x42' : (-0.5 , 0.0),
    '\x43' : ( 0.0 ,-0.1),
    '\x44' : ( 0.0 , 0.1),
    '\x20' : ( 0.0 , 0.0),
    '\x09' : ( 0.0 , 0.0),
    '\x72' : ( 0.0 , 0.0)}


class AckermannDriveKeyop:
    def __init__(self):
        self.max_speed = float(rospy.get_param('~max_speed',0.5))
        self.max_steering_angle = float(rospy.get_param('~max_steering_angle',0.5))
        self.cmd_topic = rospy.get_param('~topic','/agent1/ackermann_cmd')
        self.frame = rospy.get_param('~frame','agent1/base_link')

        self.speed_range = [-float(self.max_speed), float(self.max_speed)]
        self.steering_angle_range = [-float(self.max_steering_angle),
                                     float(self.max_steering_angle)]
        for key in key_bindings:
            key_bindings[key] = \
                    (key_bindings[key][0] * float(self.max_speed) / 5,
                     key_bindings[key][1] * float(self.max_steering_angle) / 5)

        self.speed = 0
        self.steering_angle = 0
        self.motors_pub = rospy.Publisher(
            self.cmd_topic, AckermannDriveStamped, queue_size=1)
        # Shooting publisher
        self.shooting_pub = rospy.Publisher(
            '~topic','/agent1/shooting', Bool, queue_size=1) 
        rospy.Timer(rospy.Duration(1.0/5.0), self.pub_callback, oneshot=False)
        rospy.on_shutdown(self.finalize)
        self.print_state()
        self.key_loop()
        self.shooting = False

    def pub_callback(self, event):
        ackermann_cmd_msg = AckermannDriveStamped()
        ackermann_cmd_msg.header.stamp = rospy.Time.now()
        ackermann_cmd_msg.header.frame_id = self.frame
        ackermann_cmd_msg.drive.speed = self.speed
        ackermann_cmd_msg.drive.steering_angle = self.steering_angle
        self.motors_pub.publish(ackermann_cmd_msg)
        shooting_msg = Bool()
        shooting_msg.header.frame_id = self.frame
        shooting_msg.data = self.shooting
        # Publish shooting message
        self.shooting_pub.publish(shooting_msg)

    def print_state(self):
        sys.stderr.write('\x1b[2J\x1b[H')
        rospy.loginfo('\x1b[1M\r*********************************************')
        rospy.loginfo('\x1b[1M\rUse arrows to change speed and steering angle')
        rospy.loginfo('\x1b[1M\rUse space to brake and tab to align wheels')
        rospy.loginfo('\x1b[1M\rUse r to shoot')
        rospy.loginfo('\x1b[1M\rPress <ctrl-c> or <q> to exit')
        rospy.loginfo('\x1b[1M\r*********************************************')
        rospy.loginfo('\x1b[1M\r'
                      '\033[34;1mSpeed: \033[32;1m%0.2f m/s, '
                      '\033[34;1mSteer Angle: \033[32;1m%0.2f rad\033[0m',
                      self.speed, self.steering_angle)

    def get_key(self):
        tty.setraw(sys.stdin.fileno())
        select.select([sys.stdin], [], [], 0)
        key = sys.stdin.read(1)
        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, self.settings)
        return key


    def key_loop(self):
        self.settings = termios.tcgetattr(sys.stdin)
        while not rospy.is_shutdown():
            key = self.get_key()
            if key in key_bindings.keys():
                if key == control_keys['space']:
                    self.speed = 0.0
                elif key == control_keys['tab']:
                    self.steering_angle = 0.0
                # 
                elif key == control_keys['r']:
                    self.shooting = True
                else:
                    self.speed = self.speed + key_bindings[key][0]
                    self.steering_angle = \
                            self.steering_angle + key_bindings[key][1]
                    self.speed = clip(
                        self.speed, self.speed_range[0], self.speed_range[1])
                    self.steering_angle = clip(
                        self.steering_angle,
                        self.steering_angle_range[0],
                        self.steering_angle_range[1])
                self.print_state()
            elif key == '\x03' or key == '\x71':  # ctr-c or q
                rospy.signal_shutdown("Force shutdown.") 
            else:
                continue
        

    def finalize(self):
        rospy.loginfo('Halting motors, aligning wheels and exiting...')
        self.settings = termios.tcgetattr(sys.stdin)
        ackermann_cmd_msg = AckermannDriveStamped()
        ackermann_cmd_msg.drive.speed = 0
        ackermann_cmd_msg.drive.steering_angle = 0
        shooting_msg = Bool()
        shooting_msg.data = False
        # Publish shooting message
        self.shooting_pub.publish(shooting_msg)
        self.motors_pub.publish(ackermann_cmd_msg)
        #  sys.exit()

if __name__ == '__main__':
    rospy.init_node('ackermann_drive_keyop_node')
    keyop = AckermannDriveKeyop()
