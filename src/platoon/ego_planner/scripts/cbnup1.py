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
#from morai_msgs.msg import VehicleStatus  
from cbnu_msgs.msg import VehicleTlm #fix
from cbnu_msgs.msg import Gps

from planner_utils import pathReader,velocityPlanning,makeOdomMsg,findLocalPath


#ego_vehicle_msg=VehicleStatus()
ego_vehicle_msg=VehicleTlm() #fix

#new data .ego_vehicle_msg.x , y making
def proj_coef_0(e):
    c0_transverse_mercator = np.array([
        [ -175 / 16384.0, 0.0,  -5 / 2560.0, 0.0, -3 / 64.0 , 0.0, -1 / 4.0, 0.0, 1.0],
        [ -105 / 40960.0, 0.0, -45 / 1024.0, 0.0, -3 / 32.0 , 0.0, -3 / 8.0, 0.0, 0.0],
        [  525 / 16384.0, 0.0,  45 / 1024.0, 0.0, 15 / 256.0, 0.0,      0.0, 0.0, 0.0],
        [ -175 / 12288.0, 0.0, -35 / 3072.0, 0.0,        0.0, 0.0,      0.0, 0.0, 0.0],
        [ 315 / 131072.0, 0.0,          0.0, 0.0,        0.0, 0.0,      0.0, 0.0, 0.0]
    ])

    c_out = np.zeros(5)

    for i in range(0,5):
        c_out[i] = np.poly1d(c0_transverse_mercator[i,:])(e)

    return c_out

    
def proj_coef_2(e):
    c0_merdian_arc = np.array([
        [ -175 / 16384.0    , 0.0, -5 / 256.0  , 0.0,  -3 / 64.0, 0.0, -1 / 4.0, 0.0, 1.0 ],
        [ -901 / 184320.0   , 0.0, -9 / 1024.0 , 0.0,  -1 / 96.0, 0.0,  1 / 8.0, 0.0, 0.0 ],
        [ -311 / 737280.0   , 0.0, 17 / 5120.0 , 0.0, 13 / 768.0, 0.0,      0.0, 0.0, 0.0 ],
        [ 899 / 430080.0    , 0.0, 61 / 15360.0, 0.0,        0.0, 0.0,      0.0, 0.0, 0.0 ],
        [ 49561 / 41287680.0, 0.0,          0.0, 0.0,        0.0, 0.0,      0.0, 0.0, 0.0 ]
    ])

    c_out = np.zeros(5)

    for i in range(0,5):
        c_out[i] = np.poly1d(c0_merdian_arc[i,:])(e)

    return c_out

class LocationSensor:
    def __init__(self, zone=52):
        self.gps_sub = rospy.Subscriber("/gps", Gps, self.navsat_callback)
        self.odom_pub = rospy.Publisher("/odom", Odometry, queue_size=1)
        
        self.zone = zone
        self.vel=0
        self.vehicle_p = PoseStamped()
        self.prev_x=0
        self.prev_y=0
        self.prev_heading=0
        # rad to deg 
        self.D0 = 180 / np.pi

        # WGS84
        self.A1 = 6378137.0
        self.F1 = 298.257223563

        # Scale Factor
        self.K0 = 0.9996

        # False East & North 
        self.X0 = 500000
        if (self.zone > 0):
            self.Y0 = 0.0
        else:
            self.Y0 = 1e7

        # UTM origin latitude & longitude
        self.P0 = 0 / self.D0
        self.L0 = (6 * abs(self.zone) - 183) / self.D0
        
        # ellipsoid eccentricity
        self.B1 = self.A1 * (1 - 1 / self.F1)
        self.E1 = np.sqrt((self.A1**2 - self.B1**2) / (self.A1**2))
        self.N = self.K0 * self.A1

        # mercator transverse proj params
        self.C = np.zeros(5)
        self.C = proj_coef_0(self.E1)

        self.YS = self.Y0 - self.N * (
            self.C[0] * self.P0
            + self.C[1] * np.sin(2 * self.P0)
            + self.C[2] * np.sin(4 * self.P0)
            + self.C[3] * np.sin(6 * self.P0)
            + self.C[4] * np.sin(8 * self.P0))

        self.C2 = proj_coef_2(self.E1)

        self.rate = rospy.Rate(30)

        self.x, self.y, self.heading, self.velocity, self.gps_status = None, None, None, None, None

        self.x_old, self.y_old = 0, 0

        
    def convertLL2UTM(self, lat, lon):
        
        p1 = lat / self.D0  # Phi = Latitude(rad)
        l1 = lon / self.D0  # Lambda = Longitude(rad)

        es = self.E1 * np.sin(p1)
        L = np.log( np.tan(np.pi/4.0 + p1/2.0) * 
                    np.power( ((1 - es) / (1 + es)), (self.E1 / 2)))

        z = np.complex(
            np.arctan(np.sinh(L) / np.cos(l1 - self.L0)),
            np.log(np.tan(np.pi / 4.0 + np.arcsin(np.sin(l1 - self.L0) / np.cosh(L)) / 2.0))
        )        

        Z = self.N * self.C2[0] * z \
            + self.N * (self.C2[1] * np.sin(2.0 * z)
            + self.C2[2] * np.sin(4.0 * z)
            + self.C2[3] * np.sin(6.0 * z)
            + self.C2[4] * np.sin(8.0 * z))

        east = Z.imag + self.X0
        north = Z.real + self.YS

        return east, north

    def navsat_callback(self, gps_msg):
        
        lat = gps_msg.pos_lat
        lon = gps_msg.longitude

        e_o = gps_msg.eastOffset
        n_o = gps_msg.northOffset
        
        e_global, n_global = self.convertLL2UTM(lat, lon)
        
        x,y = e_global - e_o, n_global - n_o

        dx=x-self.prev_x
        dy=y-self.prev_y
        dis= sqrt(dx*dx + dy* dy)

        if dis > 0.02:
            heading=atan2(dy,dx)    
            self.prev_x=x
            self.prev_y=y

        else :
            heading=self.prev_heading

        
        q=tf.transformations.quaternion_from_euler(0, 0, heading)

 


        odom_msg=Odometry()
        odom_msg.child_frame_id='base_link'
        odom_msg.header.frame_id='map'
        odom_msg.header.stamp=rospy.Time.now()
        odom_msg.pose.pose.position.x=x
        odom_msg.pose.pose.position.y=y
        odom_msg.pose.pose.position.z=0
        odom_msg.pose.pose.orientation.x=q[0]
        odom_msg.pose.pose.orientation.y=q[1]
        odom_msg.pose.pose.orientation.z=q[2]
        odom_msg.pose.pose.orientation.w=q[3]
        odom_msg.twist.twist.linear.x=self.vel
        self.odom_pub.publish(odom_msg)
        

        br = tf.TransformBroadcaster()
        br.sendTransform((x, y, 0),
                     q,
                     rospy.Time.now(),
                     "base_link",
                     "map")

        self.prev_heading=heading



##dlwjs wjdqhemf
def egoVehicleCB(data):




    global ego_vehicle_msg
    ego_vehicle_msg=data
    tf_name='ego'
    br = tf.TransformBroadcaster()
    br.sendTransform((ego_vehicle_msg.ned_latitude, ego_vehicle_msg.ned_longitude, 0),  # ego_vehicle_msg.pose_z => 0   #fix
                     tf.transformations.quaternion_from_euler(0, 0, (ego_vehicle_msg.ned_heading+90)*pi/180),         # ego_vehicle_msg.heading -> ned_heading   #fix 
                     rospy.Time.now(),
                     tf_name,
                     "map")


def planner():
    
    node_name='planner'
    target_vel_name='target_vel'
    global_path_name='global_path'
    local_path_name='local_path'
    odom_name='odom'
    vehicle_status_name='vehicle_status'

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
    vel_planning=velocityPlanning(60,0.15)
  
        
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