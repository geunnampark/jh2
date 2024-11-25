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
from morai_msgs.msg import VehicleStatus, ObjectInfo

from planner_utils import pathReader,velocityPlanning,makeOdomMsg,findLocalPath,vaildObject,cruiseControl


ego_vehicle_msg=VehicleStatus()
#ego_num=rospy.get_param('/current_ego')

object_info_msg=ObjectInfo()

def obj_callback(msg):
    global object_info_msg
    is_obj=True
    object_info_msg=msg

        

def egoVehicleCB(data):
    global ego_vehicle_msg
    ego_vehicle_msg=data
    tf_name='ego2'
    br = tf.TransformBroadcaster()
    br.sendTransform((ego_vehicle_msg.pose_x, ego_vehicle_msg.pose_y, ego_vehicle_msg.pose_z),
                     tf.transformations.quaternion_from_euler(0, 0, (ego_vehicle_msg.heading+90)*pi/180),
                     rospy.Time.now(),
                     tf_name,
                     "map2")


def planner():
    
    node_name='planner2'
    target_vel_name='target_vel2'
    global_path_name='global_path2'
    local_path_name='local_path2'
    odom_name='odom2'
    vehicle_status_name='vehicle_status2'
    object_topic ='Object_topic2'
    
    rospy.init_node(node_name, anonymous=False)
    

    #publisher
    target_vel_pub = rospy.Publisher(target_vel_name,Float64, queue_size=1)
    global_path_pub = rospy.Publisher(global_path_name,Path, queue_size=1)
    local_path_pub = rospy.Publisher(local_path_name,Path, queue_size=1)
    odom_pub= rospy.Publisher(odom_name,Odometry, queue_size=1)
    
    #subscriber
    rospy.Subscriber(vehicle_status_name, VehicleStatus, egoVehicleCB)
    rospy.Subscriber(object_topic, ObjectInfo, obj_callback)
    
    #class
    path_reader=pathReader('planner')
    vel_planning=velocityPlanning(65,0.12)
    ##
    vaild_obj=vaildObject()
    #cruise_control=cruiseControl(1,0.5)
    cruise_control=cruiseControl(1,0.5)
    global_path=path_reader.read_txt("kcity.txt")
    #
    vel_profile=vel_planning.curveBasedVelocity(global_path,160)
    curved_vel_plan=vel_planning.curveBasedVelocity(global_path,150)
      

    target_vel_msg=Float64()
    target_vel=Float64()
    local_path_size=100
    
    #time var
    count=0
    rate = rospy.Rate(30) # 30hz

    while not rospy.is_shutdown():
        
       
        global object_info_msg



        local_path,current_waypoint=findLocalPath(global_path,ego_vehicle_msg)

        odom_pub.publish(makeOdomMsg(ego_vehicle_msg))
        target_vel_msg.data=curved_vel_plan[current_waypoint]
        
        ##
        path_based_vel=vel_profile[current_waypoint]
        vaild_obj.get_object(object_info_msg)
        global_vaild_object,local_vaild_object=vaild_obj.calc_vaild_obj([ego_vehicle_msg.pose_x,ego_vehicle_msg.pose_y,ego_vehicle_msg.heading])
        cruise_control.checkObject(local_path,global_vaild_object,local_vaild_object)
        target_vel.data=cruise_control.acc(local_vaild_object,ego_vehicle_msg,path_based_vel)
        


        

        local_path_pub.publish(local_path)
        #target_vel_pub.publish(target_vel_msg)
        target_vel_pub.publish(target_vel)
  
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