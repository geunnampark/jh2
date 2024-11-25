#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
import rospkg
from std_msgs.msg import Float64
from math import cos,sin,pi,sqrt,pow,atan2
from geometry_msgs.msg import Point32,PoseStamped
from nav_msgs.msg import Odometry,Path
import numpy as np
from tf.transformations import euler_from_quaternion,quaternion_from_euler
from morai_msgs.msg import ObjectInfo
from morai_msgs.msg import VehicleStatus

class cruiseControl:
    def __init__(self,object_vel_gain,object_dis_gain):
        self.object=[False,0]
        self.object_vel_gain=object_vel_gain
        self.object_dis_gain=object_dis_gain


    def checkObject(self,ref_path,global_vaild_object,local_vaild_object):
        self.object=[False,0]
    
        if len(global_vaild_object) >0  :
            min_rel_distance=float('inf')

            for i in range(len(global_vaild_object)):
                
                for path in ref_path.poses :

                    if global_vaild_object[i][0]==1 :

                        dis=sqrt(pow(path.pose.position.x-global_vaild_object[i][1],2)+pow(path.pose.position.y-global_vaild_object[i][2],2))
                        
                        if dis<2 :
                            rel_distance= sqrt(pow(local_vaild_object[i][1],2)+pow(local_vaild_object[i][2],2))
                            if rel_distance < min_rel_distance:
                                min_rel_distance=rel_distance
                                self.object=[True,i]

                            break
                    




    def acc(self,local_vaild_object,ego_vel,target_vel):
        out_vel=target_vel
        # print(self.object)
        if self.object[0] == True :
            print("ACC ON")   
            front_vehicle=[local_vaild_object[self.object[1]][1],local_vaild_object[self.object[1]][2],local_vaild_object[self.object[1]][3]]
            time_gap=1   
            default_space=2
            dis_safe=ego_vel* time_gap+default_space
            dis_rel=sqrt(pow(front_vehicle[0],2)+pow(front_vehicle[1],2))-4.4  
            print(dis_rel)
            vel_rel=(front_vehicle[2]-ego_vel)  
            v_gain=self.object_vel_gain
            x_errgain=self.object_dis_gain
            acceleration=vel_rel*v_gain - x_errgain*(dis_safe-dis_rel)    

            acc_based_vel=ego_vel+acceleration

            if acc_based_vel > target_vel : 
                acc_based_vel=target_vel
            
            if dis_safe-dis_rel >0 :
                out_vel=acc_based_vel
            else :
                if acc_based_vel<target_vel :
                    out_vel=acc_based_vel
            
        return out_vel
            
            


class vaildObject :

    def __init__(self):
        pass
    def get_object(self,obj_msg):
        self.all_object=ObjectInfo()
        self.all_object=obj_msg

    def calc_vaild_obj(self,ego_pose):
        global_object_info=[]
        loal_object_info=[]
        if self.all_object.num_of_objects > 0:

            tmp_theta=ego_pose[2]
            tmp_translation=[ego_pose[0],ego_pose[1]]
            tmp_t=np.array([[cos(tmp_theta), -sin(tmp_theta),tmp_translation[0]],
                            [sin(tmp_theta),cos(tmp_theta),tmp_translation[1]],
                            [0,0,1]])
            tmp_det_t=np.array([[tmp_t[0][0],tmp_t[1][0],-(tmp_t[0][0]*tmp_translation[0]+tmp_t[1][0]*tmp_translation[1])   ],
                                [tmp_t[0][1],tmp_t[1][1],-(tmp_t[0][1]*tmp_translation[0]+tmp_t[1][1]*tmp_translation[1])   ],
                                [0,0,1]])

            for num in range(self.all_object.num_of_objects):
                global_result=np.array([[self.all_object.pose_x[num]],[self.all_object.pose_y[num]],[1]])
                local_result=tmp_det_t.dot(global_result)
                if local_result[0][0]>0 :
                    global_object_info.append([self.all_object.object_type[num],self.all_object.pose_x[num],self.all_object.pose_y[num],self.all_object.velocity[num]])
                    loal_object_info.append([self.all_object.object_type[num],local_result[0][0],local_result[1][0],self.all_object.velocity[num]])
            
                   
        return global_object_info,loal_object_info

class velocityPlanning :
    def __init__(self,car_max_speed,road_friction):
        self.car_max_speed=car_max_speed
        self.road_friction=road_friction
 
    def curveBasedVelocity(self,global_path,point_num):
        out_vel_plan=[]
        for i in range(0,point_num):
            out_vel_plan.append(self.car_max_speed)

        for i in range(point_num,len(global_path.poses)-point_num):
            x_list=[]
            y_list=[]
            for box in  range(-point_num,point_num):
                x=global_path.poses[i+box].pose.position.x
                y=global_path.poses[i+box].pose.position.y
                x_list.append([-2*x,-2*y,1])
                y_list.append(-(x*x)-(y*y))
            
            x_matrix=np.array(x_list)
            y_matrix=np.array(y_list)
            x_trans=x_matrix.T
            

            a_matrix=np.linalg.inv(x_trans.dot(x_matrix)).dot(x_trans).dot(y_matrix)
            a=a_matrix[0]
            b=a_matrix[1]
            c=a_matrix[2]
            r=sqrt(a*a+b*b-c)
            v_max=sqrt(r*9.8*self.road_friction)  #0.7
            if v_max>self.car_max_speed :
                v_max=self.car_max_speed
            out_vel_plan.append(v_max)

        for i in range(len(global_path.poses)-point_num,len(global_path.poses)):
            out_vel_plan.append(self.car_max_speed)
        
        return out_vel_plan



def latticePlanner(ref_path,global_vaild_object,vehicle_status):
    out_path=[]
 
    look_distance=int(vehicle_status[3]*3.6*0.2*2)
    if look_distance < 10 :
        look_distance=10     #min 5m   
    if len(ref_path.poses)>look_distance :
        global_ref_start_point=(ref_path.poses[0].pose.position.x,ref_path.poses[0].pose.position.y)
        global_ref_start_next_point=(ref_path.poses[1].pose.position.x,ref_path.poses[1].pose.position.y)
        global_ref_end_point=(ref_path.poses[look_distance].pose.position.x,ref_path.poses[look_distance].pose.position.y)
        
        theta=atan2(global_ref_start_next_point[1]-global_ref_start_point[1],global_ref_start_next_point[0]-global_ref_start_point[0])
        translation=[global_ref_start_point[0],global_ref_start_point[1]]

        t=np.array([[cos(theta), -sin(theta),translation[0]],[sin(theta),cos(theta),translation[1]],[0,0,1]])
        det_t=np.array([[t[0][0],t[1][0],-(t[0][0]*translation[0]+t[1][0]*translation[1])   ],[t[0][1],t[1][1],-(t[0][1]*translation[0]+t[1][1]*translation[1])   ],[0,0,1]])



        world_end_point=np.array([[global_ref_end_point[0]],[global_ref_end_point[1]],[1]])
        local_end_point=det_t.dot(world_end_point)
        world_ego_vehicle_position=np.array([[vehicle_status[0]],[vehicle_status[1]],[1]])
        local_ego_vehicle_position=det_t.dot(world_ego_vehicle_position)
        lane_off_set=[1,0,-1,-1.5,-2.5,-3.5]
        local_lattice_points=[]
        for i in range(len(lane_off_set)):
            local_lattice_points.append([local_end_point[0][0],local_end_point[1][0]+lane_off_set[i],1])
            


        for end_point in local_lattice_points :
            lattice_path=Path()
            lattice_path.header.frame_id='map'
            x=[]
            y=[]
            x_interval=0.5
            xs=0
            xf=end_point[0]
            ps=local_ego_vehicle_position[1][0]

            pf=end_point[1]
            x_num=xf/x_interval

            for i in range(xs,int(x_num)) : 
                x.append(i*x_interval)
            
            a=[0.0,0.0,0.0,0.0]
            a[0]=ps
            a[1]=0
            a[2]=3.0*(pf-ps)/(xf*xf)
            a[3]=-2.0*(pf-ps)/(xf*xf*xf)

            for i in x:
                result=a[3]*i*i*i+a[2]*i*i+a[1]*i+a[0]
                y.append(result)


            for i in range(0,len(y)) :
                local_result=np.array([[x[i]],[y[i]],[1]])
                global_result=t.dot(local_result)

                read_pose=PoseStamped()
                read_pose.pose.position.x=global_result[0][0]
                read_pose.pose.position.y=global_result[1][0]
                read_pose.pose.position.z=0
                read_pose.pose.orientation.x=0
                read_pose.pose.orientation.y=0
                read_pose.pose.orientation.z=0
                read_pose.pose.orientation.w=1
                lattice_path.poses.append(read_pose)

            out_path.append(lattice_path)
        
        add_point_size=int(vehicle_status[3]*2*2)

        if add_point_size>len(ref_path.poses)-1:
            add_point_size=len(ref_path.poses)-1
        elif add_point_size<20 :
            add_point_size=20

        for i in range(look_distance,add_point_size):
            tmp_theta=atan2(ref_path.poses[i+1].pose.position.y-ref_path.poses[i].pose.position.y,ref_path.poses[i+1].pose.position.x-ref_path.poses[i].pose.position.x)
            
            tmp_translation=[ref_path.poses[i].pose.position.x,ref_path.poses[i].pose.position.y]
            tmp_t=np.array([[cos(tmp_theta), -sin(tmp_theta),tmp_translation[0]],[sin(tmp_theta),cos(tmp_theta),tmp_translation[1]],[0,0,1]])
            tmp_det_t=np.array([[tmp_t[0][0],tmp_t[1][0],-(tmp_t[0][0]*tmp_translation[0]+tmp_t[1][0]*tmp_translation[1])   ],[tmp_t[0][1],tmp_t[1][1],-(tmp_t[0][1]*tmp_translation[0]+tmp_t[1][1]*tmp_translation[1])   ],[0,0,1]])

            for lane_num in range(len(lane_off_set)) :
                local_result=np.array([[0],[lane_off_set[lane_num]],[1]])
                global_result=tmp_t.dot(local_result)

                read_pose=PoseStamped()
                read_pose.pose.position.x=global_result[0][0]
                read_pose.pose.position.y=global_result[1][0]
                read_pose.pose.position.z=0
                read_pose.pose.orientation.x=0
                read_pose.pose.orientation.y=0
                read_pose.pose.orientation.z=0
                read_pose.pose.orientation.w=1
                out_path[lane_num].poses.append(read_pose)


    return out_path






class path_pub_tf :


    def __init__(self):
        rospy.init_node('path_pub', anonymous=True)
        rospy.Subscriber("odom", Odometry, self.odom_callback)
        rospy.Subscriber("/obj_info", ObjectInfo, self.obj_callback)
        rospy.Subscriber("vehicle_status", VehicleStatus, self.status_callback)
        
        self.global_path_pub = rospy.Publisher('/global_path',Path, queue_size=1)
        self.local_path_pub = rospy.Publisher('/local_path',Path, queue_size=1)
        self.vel_pub = rospy.Publisher('/target_vel',Float64, queue_size=1)
        self.lattice_path_1_pub = rospy.Publisher('lattice_path_1',Path, queue_size=1)
        self.lattice_path_2_pub = rospy.Publisher('lattice_path_2',Path, queue_size=1)
        self.lattice_path_3_pub = rospy.Publisher('lattice_path_3',Path, queue_size=1)
        self.lattice_path_4_pub = rospy.Publisher('lattice_path_4',Path, queue_size=1)
        self.lattice_path_5_pub = rospy.Publisher('lattice_path_5',Path, queue_size=1)
        self.lattice_path_6_pub = rospy.Publisher('lattice_path_6',Path, queue_size=1)

        self.global_path_msg=Path()
        self.global_path_msg.header.frame_id='/map'
        self.is_status=False
        self.is_odom=False
        self.is_obj=False
        self.local_path_size=100



        rospack=rospkg.RosPack()
        pkg_path=rospack.get_path('kcity_planning')
        full_path=pkg_path+'/path'+'/kcity.txt'
        self.f=open(full_path,'r')
        lines=self.f.readlines()
        for line in lines :
            tmp=line.split()
            read_pose=PoseStamped()
            read_pose.pose.position.x=float(tmp[0])
            read_pose.pose.position.y=float(tmp[1])
            read_pose.pose.orientation.w=1
            self.global_path_msg.poses.append(read_pose)
        
        self.f.close()


        vel_planner=velocityPlanning(70/3.6,0.15)
        vel_profile=vel_planner.curveBasedVelocity(self.global_path_msg,100)
        vaild_obj=vaildObject()
        cruise_control=cruiseControl(1,0.5)

        rate = rospy.Rate(20) # 20hz
        while not rospy.is_shutdown():
   
            if self.is_odom == True  and self.is_obj==True:
                local_path_msg=Path()
                local_path_msg.header.frame_id='/map'
                
                x=self.x
                y=self.y
                min_dis=float('inf')
                current_waypoint=-1
                for i,waypoint in enumerate(self.global_path_msg.poses) :

                    distance=sqrt(pow(x-waypoint.pose.position.x,2)+pow(y-waypoint.pose.position.y,2))
                    if distance < min_dis :
                        min_dis=distance
                        current_waypoint=i

                
                if current_waypoint != -1 :
                    if current_waypoint + self.local_path_size < len(self.global_path_msg.poses):
                        for num in range(current_waypoint,current_waypoint + self.local_path_size ) :
                            tmp_pose=PoseStamped()
                            tmp_pose.pose.position.x=self.global_path_msg.poses[num].pose.position.x
                            tmp_pose.pose.position.y=self.global_path_msg.poses[num].pose.position.y
                            tmp_pose.pose.orientation.w=1
                            local_path_msg.poses.append(tmp_pose)
                    
                    else :
                        for num in range(current_waypoint,len(self.global_path_msg.poses) ) :
                            tmp_pose=PoseStamped()
                            tmp_pose.pose.position.x=self.global_path_msg.poses[num].pose.position.x
                            tmp_pose.pose.position.y=self.global_path_msg.poses[num].pose.position.y
                            tmp_pose.pose.orientation.w=1
                            local_path_msg.poses.append(tmp_pose)


                vel_msg=Float64()
                path_based_vel=vel_profile[current_waypoint]
                # print(vel_profile[current_waypoint])

                vaild_obj.get_object(self.object_info_msg)
                global_vaild_object,local_vaild_object=vaild_obj.calc_vaild_obj([self.x,self.y,self.heading])
                cruise_control.checkObject(local_path_msg,global_vaild_object,local_vaild_object)
                target_vel=cruise_control.acc(local_vaild_object,self.current_velocity,path_based_vel)
                print(local_vaild_object)
                vel_msg.data=target_vel
            
                vehicle_status=[x,y,self.heading,self.current_velocity]
                lattice_path=latticePlanner(local_path_msg,global_vaild_object,vehicle_status)
                if len(lattice_path)==6:
                    self.lattice_path_1_pub.publish(lattice_path[0])
                    self.lattice_path_2_pub.publish(lattice_path[1])
                    self.lattice_path_3_pub.publish(lattice_path[2])
                    self.lattice_path_4_pub.publish(lattice_path[3])
                    self.lattice_path_5_pub.publish(lattice_path[4])
                    self.lattice_path_6_pub.publish(lattice_path[5])






                self.global_path_pub.publish(self.global_path_msg)
                self.local_path_pub.publish(local_path_msg)
                self.vel_pub.publish(vel_msg)

            rate.sleep()

    def odom_callback(self,msg):
        self.is_odom=True
        odom_quaternion=(msg.pose.pose.orientation.x,msg.pose.pose.orientation.y,msg.pose.pose.orientation.z,msg.pose.pose.orientation.w)
        _,_,self.heading=euler_from_quaternion(odom_quaternion)
        self.x=msg.pose.pose.position.x
        self.y=msg.pose.pose.position.y
        

    def obj_callback(self,msg):
        self.is_obj=True
        self.object_info_msg=msg

    def status_callback(self,msg):
        self.is_status=True
        self.current_velocity=msg.velocity

if __name__ == '__main__':
    try:
        test_track=path_pub_tf()
    except rospy.ROSInterruptException:
        pass







