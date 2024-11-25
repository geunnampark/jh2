#!/usr/bin/env python
# -*- coding: utf-8 -*-
import rospy
from morai_msgs.msg import CtrlCmd,VehicleStatus
from nav_msgs.msg import Odometry
from nav_msgs.msg import Path
from std_msgs.msg import Float64
from geometry_msgs.msg import Point
import tf
from math import cos,sin,sqrt,pow,atan2,pi
ego_vehicle_msg=VehicleStatus()
target_velocity=0
path_msg=Path()




class purePursuit :
    def __init__(self):
        self.forward_point=Point()
        self.current_postion=Point()
        self.is_look_forward_point=False
        self.vehicle_length=2.7
        self.lfd=5
        self.min_lfd=5
        self.max_lfd=30
        self.steering=0
        
    def getPath(self,msg):
        self.path=msg
    
    
    def getEgoStatus(self,msg):

        self.current_vel=msg.velocity*3.6
        self.vehicle_yaw=(msg.heading+90)*pi/180
        self.current_postion.x=msg.pose_x
        self.current_postion.y=msg.pose_y
        self.current_postion.z=msg.pose_z



    def steering_angle(self):
        vehicle_position=self.current_postion
        rotated_point=Point()
        self.is_look_forward_point= False


        for i in self.path.poses :
            path_point=i.pose.position
            dx= path_point.x - vehicle_position.x
            dy= path_point.y - vehicle_position.y
            rotated_point.x=cos(self.vehicle_yaw)*dx + sin(self.vehicle_yaw)*dy
            rotated_point.y=sin(self.vehicle_yaw)*dx - cos(self.vehicle_yaw)*dy

            if rotated_point.x>0 :
                dis=sqrt(pow(rotated_point.x,2)+pow(rotated_point.y,2))
                if dis>= self.lfd :
                    self.lfd=self.current_vel*0.2
                    if self.lfd < self.min_lfd : 
                        self.lfd=self.min_lfd
                    elif self.lfd > self.max_lfd :
                        self.lfd=self.max_lfd
                    self.forward_point=path_point
                    self.is_look_forward_point=True
 
                    
                    break
        
        theta=-atan2(rotated_point.y,rotated_point.x)

        if self.is_look_forward_point :
            self.steering=atan2((2*self.vehicle_length*sin(theta)),self.lfd)
            print(self.steering)
            return self.steering
        else : 
            print("no found forward point")
            return 0
        
        

    


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








        
    




















def egoVehicleCB(data):
    global ego_vehicle_msg
    ego_vehicle_msg=data



def pathCB(data):
    global path_msg
    path_msg=data


def targetVelCB(data):
    global target_velocity
    target_velocity=data.data # kph



def controller():
    
    node_name='controller'
    ctrl_name='ctrl_cmd'
    vehicle_status_name='vehicle_status'
    target_vel_name='target_vel'
    local_path_name='local_path'

    rospy.init_node(node_name, anonymous=False)
    ctrl_pub = rospy.Publisher(ctrl_name,CtrlCmd, queue_size=1)

 
    rospy.Subscriber(vehicle_status_name, VehicleStatus, egoVehicleCB)
    rospy.Subscriber(local_path_name, Path, pathCB)
    rospy.Subscriber(target_vel_name, Float64, targetVelCB)

    
    rate = rospy.Rate(30) # 30hz

    pure_pursuit=purePursuit()
    pid_control=pidControl()

    ctrl_msg=CtrlCmd()
    


    while not rospy.is_shutdown():

        current_velocity=ego_vehicle_msg.velocity*3.6   # kph

 
        pure_pursuit.getPath(path_msg)
        pure_pursuit.getEgoStatus(ego_vehicle_msg)
        out_angle=pure_pursuit.steering_angle()


        ctrl_msg.steering =out_angle


        output= pid_control.pid(target_velocity,current_velocity)
     
        if target_velocity-current_velocity > 0 :
            ctrl_msg.accel = output
            ctrl_msg.brake = 0
        else :
            ctrl_msg.accel = 0
            ctrl_msg.brake = -output



        ctrl_pub.publish(ctrl_msg)         
   


        rate.sleep()

if __name__ == '__main__':
    try:
        controller()
    except rospy.ROSInterruptException:
        pass




