#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
import rospkg
from math import cos,sin,pi,sqrt,pow,atan2
from geometry_msgs.msg import Point32,PoseStamped,Point
from std_msgs.msg import Float64
from nav_msgs.msg import Odometry,Path
from morai_msgs.msg import CtrlCmd,VehicleStatus
from tf.transformations import euler_from_quaternion,quaternion_from_euler

class pidControl :
    def __init__(self):
        self.p_gain=1.0  
        self.i_gain=0.0
        self.d_gain=0.4  
        self.prev_error=0
        self.i_control=0
        self.controlTime=0.0333

    def pid(self,target_vel,current_vel):
        error= target_vel-current_vel
        
        p_control=self.p_gain*error
        self.i_control+=self.i_gain*error*self.controlTime
        d_control=self.d_gain*(error-self.prev_error)/self.controlTime

        output=p_control+self.i_control+d_control
        self.prev_error=error
        return output


class pure_pursuit :
    def __init__(self):
        rospy.init_node('pure_pursuit', anonymous=True)
        rospy.Subscriber("local_path", Path, self.path_callback)
        rospy.Subscriber("odom", Odometry, self.odom_callback)
        rospy.Subscriber("vehicle_status", VehicleStatus, self.status_callback)
        rospy.Subscriber("/target_vel", Float64, self.vel_callback)
        self.ctrl_pub = rospy.Publisher('/ctrl_cmd',CtrlCmd, queue_size=1)

        self.ctrl_msg=CtrlCmd()
        self.is_path=False
        self.is_odom=False
        self.is_status=False
        self.is_target_vel=False
        self.forward_point=Point()
        self.current_postion=Point()
        self.is_look_forward_point=False
        self.vehicle_length=2.0
        self.lfd=6
        self.min_lfd=6
        self.steering=0
        pid_control=pidControl()

 
        rate = rospy.Rate(30) # 30hz
        while not rospy.is_shutdown():

            if self.is_path ==True and self.is_odom==True and self.is_status==True and  self.is_target_vel==True:
                
                vehicle_position=self.current_postion
                rotated_point=Point()
                self.is_look_forward_point= False

    
                for num,i in enumerate(self.path.poses) :
                    path_point=i.pose.position
                    dx= path_point.x - vehicle_position.x
                    dy= path_point.y - vehicle_position.y
                    rotated_point.x=cos(self.vehicle_yaw)*dx +sin(self.vehicle_yaw)*dy
                    rotated_point.y=sin(self.vehicle_yaw)*dx - cos(self.vehicle_yaw)*dy
        

                        
                    if rotated_point.x>0 :
                        dis=sqrt(pow(rotated_point.x,2)+pow(rotated_point.y,2))
                        if dis>= self.lfd :
                            self.lfd = self.current_velocity*3.6*0.2 # kph * 0.2 
                            if self.lfd < self.min_lfd:
                                self.lfd=self.min_lfd
                            self.forward_point=path_point
                            self.is_look_forward_point=True
                            break
                                
                    
                theta=-atan2(rotated_point.y,rotated_point.x)
                if self.is_look_forward_point :
                    self.steering=atan2((2*self.vehicle_length*sin(theta)),self.lfd) 
                    print(self.steering*180/pi) #degree

                    
                    output= pid_control.pid(self.target_velocity,self.current_velocity)
                    if output> 0 :
                        self.ctrl_msg.accel=output
                        self.ctrl_msg.brake=0.0
                    else :
                        self.ctrl_msg.accel=0.0
                        self.ctrl_msg.brake=-output

                    self.ctrl_msg.steering=self.steering

                else : 
                    print("no found forward point")
                    self.ctrl_msg.accel=0.0
                    self.ctrl_msg.brake=0.0
                    self.ctrl_msg.steering=0.0

                self.ctrl_pub.publish(self.ctrl_msg)

        

            rate.sleep()

    def path_callback(self,msg):
        self.is_path=True
        self.path=msg  #nav_msgs/Path 

    def odom_callback(self,msg):
        self.is_odom=True
        odom_quaternion=(msg.pose.pose.orientation.x,msg.pose.pose.orientation.y,msg.pose.pose.orientation.z,msg.pose.pose.orientation.w)
        _,_,self.vehicle_yaw=euler_from_quaternion(odom_quaternion)
        self.current_postion.x=msg.pose.pose.position.x
        self.current_postion.y=msg.pose.pose.position.y

    def status_callback(self,msg):
        self.is_status=True
        self.current_velocity=msg.velocity

    def vel_callback(self,msg):
        self.is_target_vel=True
        self.target_velocity=msg.data
if __name__ == '__main__':
    try:
        test_track=pure_pursuit()
    except rospy.ROSInterruptException:
        pass