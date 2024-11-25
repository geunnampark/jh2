#!/usr/bin/env python
# -*- coding: utf-8 -*-
import rospy
import rospkg
import numpy as np
from nav_msgs.msg import Path,Odometry
from std_msgs.msg import Float64,Int16,Float32MultiArray
from geometry_msgs.msg import PoseStamped
from geometry_msgs.msg import Point
import tf
import matplotlib.pyplot as plt
from math import cos,sin,sqrt,pow,atan2,pi

from cbnu_msgs.msg import VehicleTlm


from planner_utils import pathReader,velocityPlanning,makeOdomMsg,findLocalPath


ego_vehicle_msg=VehicleTlm()


def egoVehicleCB(data):
    global ego_vehicle_msg
    ego_vehicle_msg=data
    tf_name='ego'
    br = tf.TransformBroadcaster()
    br.sendTransform((ego_vehicle_msg.ned_longitude, ego_vehicle_msg.ned_longitude, 1),
                     tf.transformations.quaternion_from_euler(0, 0, (ego_vehicle_msg.ned_heading+90)*pi/180),
                     rospy.Time.now(),
                     tf_name,
                     "map")


def planner():
    
    node_name='planner'
    target_vel_name='target_vel'
    global_path_name='global_path'
    local_path_name='local_path'
    odom_name='odom'
    vehicle_status_name='Ego_topic'

    rospy.init_node(node_name, anonymous=False)
    

    #publisher
    target_vel_pub = rospy.Publisher(target_vel_name,Float64, queue_size=1)
    global_path_pub = rospy.Publisher(global_path_name,Path, queue_size=1)
    local_path_pub = rospy.Publisher(local_path_name,Path, queue_size=1)
    odom_pub= rospy.Publisher(odom_name,Odometry, queue_size=1)
    
    #subscriber
    rospy.Subscriber(vehicle_status_name, VehicleTlm, egoVehicleCB)
   
    
    #class
    path_reader=pathReader('planner')
    vel_planning=velocityPlanning(50,0.15)
  
        
    global_path=path_reader.read_txt("kcity.txt")
    curved_vel_plan=vel_planning.curveBasedVelocity(global_path,150)
      

    target_vel_msg=Float64()
    

    
    #time var
    count=0
    rate = rospy.Rate(30) # 30hz

    while not rospy.is_shutdown():
       



        local_path,current_waypoint=findLocalPath(global_path,ego_vehicle_msg)

        odom_pub.publish(makeOdomMsg(ego_vehicle_msg))
        target_vel_msg.data=curved_vel_plan[current_waypoint]
        

        


        

        local_path_pub.publish(local_path)
        target_vel_pub.publish(target_vel_msg)
  
        if count/300==1 :
            global_path_pub.publish(global_path)
            count=0
        count+=1



        rate.sleep()

if __name__ == '__main__':
    try:
        planner()
    except rospy.ROSInterruptException:
        pass