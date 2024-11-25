import rospy
import rospkg
from nav_msgs.msg import Path,Odometry
from geometry_msgs.msg import PoseStamped,Point
from std_msgs.msg import Float64,Int16,Float32MultiArray
import numpy as np
from math import cos,sin,sqrt,pow,atan2,pi
import tf

from cbnu_msgs.msg import VehicleTlm

ego_vehicle_msg=VehicleTlm()

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


class pathReader :
    def __init__(self,pkg_name):
        rospack=rospkg.RosPack()
        self.file_path=rospack.get_path(pkg_name)



    def read_txt(self,file_name):
        full_file_name=self.file_path+"/path/"+file_name
        openFile = open(full_file_name, 'r')
        out_path=Path()
        
        out_path.header.frame_id='/map'
        line=openFile.readlines()
        #print(line)
        for i in line :
            tmp=i.split()
            read_pose=PoseStamped()
            read_pose.pose.position.x=float(tmp[0])
            read_pose.pose.position.y=float(tmp[1])
            read_pose.pose.position.z=float(tmp[2])
            read_pose.pose.orientation.x=0
            read_pose.pose.orientation.y=0
            read_pose.pose.orientation.z=0
            read_pose.pose.orientation.w=1
            out_path.poses.append(read_pose)
        
        
        openFile.close()
        return out_path
      


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
            v_max=sqrt(r*9.8*self.road_friction)*3.6  #0.7
            if v_max>self.car_max_speed :
                v_max=self.car_max_speed
            out_vel_plan.append(v_max)


        for i in range(len(global_path.poses)-point_num,len(global_path.poses)):
            out_vel_plan.append(self.car_max_speed)
        
        return out_vel_plan


class cruiseControl:
    def __init__(self,object_vel_gain,object_dis_gain):
        self.object=[False,0]
        self.stop_lane=[False,0]
        self.rotation_stop_lane=[False,0]
        self.object_vel_gain=object_vel_gain
        self.object_dis_gain=object_dis_gain



    def checkObject(self,ref_path,global_vaild_object,local_vaild_object):
        self.object=[False,0]
        self.stop_lane=[False,0]
        self.rotation_stop_lane=[False,0]

        if len(global_vaild_object) >0  :
            min_rel_distance=float('inf')

            for i in range(len(global_vaild_object)):
                
                for path in ref_path.poses :

                    if global_vaild_object[i][0]==0 :

                        dis=sqrt(pow(path.pose.position.x-global_vaild_object[i][1],2)+pow(path.pose.position.y-global_vaild_object[i][2],2))
                        rel_distance= sqrt(pow(local_vaild_object[i][1],2)+pow(local_vaild_object[i][2],2))

                        print(rel_distance*0.2,rel_distance,dis)
                        if dis < 0.2*rel_distance:
                            if rel_distance < min_rel_distance:
                                min_rel_distance=rel_distance

                                self.rotation_stop_lane=[False,0]
                                self.stop_lane=[False,0]
                                self.object=[True,i]

                            break
                    
                    if global_vaild_object[i][0]==1 :

                        dis=sqrt(pow(path.pose.position.x-global_vaild_object[i][1],2)+pow(path.pose.position.y-global_vaild_object[i][2],2))
                        if dis<1.5 :
                            rel_distance= sqrt(pow(local_vaild_object[i][1],2)+pow(local_vaild_object[i][2],2))
                            if rel_distance < min_rel_distance:
                                min_rel_distance=rel_distance
                                
                                self.rotation_stop_lane=[False,0]
                                self.stop_lane=[False,0]
                                self.object=[True,i]

                            break
                    
                    if global_vaild_object[i][0]==2  :

                        dis=sqrt(pow(path.pose.position.x-global_vaild_object[i][1],2)+pow(path.pose.position.y-global_vaild_object[i][2],2))
                        if dis<1 :
                            rel_distance= sqrt(pow(local_vaild_object[i][1],2)+pow(local_vaild_object[i][2],2))
                            if rel_distance < min_rel_distance:
                                min_rel_distance=rel_distance
                                self.rotation_stop_lane=[False,0]
                                self.object=[False,0]
                                self.stop_lane=[True,i]

                    if global_vaild_object[i][0]==3  :

                        dis=sqrt(pow(path.pose.position.x-global_vaild_object[i][1],2)+pow(path.pose.position.y-global_vaild_object[i][2],2))
                        if dis<1 :
                            rel_distance= sqrt(pow(local_vaild_object[i][1],2)+pow(local_vaild_object[i][2],2))
                            if rel_distance < min_rel_distance:
                                min_rel_distance=rel_distance
                                
                                self.rotation_stop_lane=[True,i]
                                self.object=[False,0]
                                self.stop_lane=[False,0]    


    def acc(self,local_vaild_object,ego_vel_msg,target_vel):
        #def acc(self,local_vaild_object,ego_vel_msg,target_vel,traffic_light_msg):
        out_vel=target_vel
        acc_error=Float64()
        if self.object[0] == True :
            print("ACC ON")   
            front_vehicle=[local_vaild_object[self.object[1]][1],local_vaild_object[self.object[1]][2],local_vaild_object[self.object[1]][3]]
            time_gap=1   
            default_space=1
            dis_safe=ego_vel_msg.velocity* time_gap+default_space
            dis_rel=sqrt(pow(front_vehicle[0],2)+pow(front_vehicle[1],2))-4.4  
            print(dis_rel,dis_rel)
            vel_rel=(front_vehicle[2]-ego_vel_msg.velocity)*3.6   
            v_gain=self.object_vel_gain
            x_errgain=self.object_dis_gain
            acceleration=vel_rel*v_gain - x_errgain*(dis_safe-dis_rel)    

            acc_based_vel=ego_vel_msg.velocity*3.6+acceleration

            if acc_based_vel > target_vel : 
                acc_based_vel=target_vel
            
            if dis_safe-dis_rel >0 :
                out_vel=acc_based_vel
            else :
                if acc_based_vel<target_vel :
                    out_vel=acc_based_vel
            
            acc_error.data=dis_safe-dis_rel
            

        if self.stop_lane[0]== True :  
            print("STOP LANE")
            stop_lane_pose=[local_vaild_object[self.stop_lane[1]][1],local_vaild_object[self.stop_lane[1]][2],0]
            time_gap=2
            default_space=4
            dis_safe=ego_vel_msg.velocity* time_gap+default_space
            dis_rel=sqrt(pow(stop_lane_pose[0],2)+pow(stop_lane_pose[1],2))-2   
            vel_rel=(-ego_vel_msg.velocity)*3.6   
            v_gain=0.2
            x_errgain=1

            acceleration=vel_rel*v_gain - x_errgain*(dis_safe-dis_rel)      
            acc_based_vel=ego_vel_msg.velocity*3.6+acceleration
            if acc_based_vel > target_vel : 
                acc_based_vel=target_vel

            if dis_safe-dis_rel >0 :
                out_vel=acc_based_vel
            else :
                if acc_based_vel<target_vel :
                    out_vel=acc_based_vel
            
         
           # print('traffic light')
           # print(traffic_light_msg.light)
           # if traffic_light_msg.light ==3 :
           #     out_vel=target_vel


        if self.rotation_stop_lane[0]==True :
            print("Rotation stop lane")
            stop_lane_pose=[local_vaild_object[self.rotation_stop_lane[1]][1],local_vaild_object[self.rotation_stop_lane[1]][2],0]
            time_gap=2
            default_space=4
            dis_safe=ego_vel_msg.velocity* time_gap+default_space
            dis_rel=sqrt(pow(stop_lane_pose[0],2)+pow(stop_lane_pose[1],2))-2  
            vel_rel=(-ego_vel_msg.velocity)*3.6   
            v_gain=0.2
            x_errgain=1

            acceleration=vel_rel*v_gain - x_errgain*(dis_safe-dis_rel)      
            acc_based_vel=ego_vel_msg.velocity*3.6+acceleration
            if acc_based_vel > target_vel : 
                acc_based_vel=target_vel

            if dis_safe-dis_rel >0 :
                out_vel=acc_based_vel
            else :
                if acc_based_vel<target_vel :
                    out_vel=acc_based_vel
            

            across_collision_check=False
            for vaild_object in local_vaild_object :
                if vaild_object[0] ==1 :
                    print(vaild_object[1],vaild_object[2])
                    if vaild_object[1] >0 and vaild_object[1] <25 and vaild_object[2]>0 :
                        across_collision_check=True

            
            if across_collision_check ==False:
                out_vel=target_vel
                print("GO")
            else :
                print("STOP")


        #return out_vel,acc_error
        return out_vel
def lateralError(local_path,ego_vehicle_msg):
    error_msg=Float64()
    #fix
    dx=local_path.poses[0].pose.position.x- ego_vehicle_msg.pose_x
    dy=local_path.poses[0].pose.position.y-ego_vehicle_msg.pose_y
    error_msg.data=sqrt(dx*dx + dy*dy)
    
    return error_msg


def makeOdomMsg(ego_vehicle_msg):
    #location_sub= rospy.Subscriber("/vehicle_status",VehicleTlm, navast_callback)
    odom_pub= rospy.Publisher("/odom", Odometry, queue_size=1)
    zone =52
    D0 = 180 / np.pi
    A1 = 6378137.0 
    F1 = 298.257223563
    K0 = 0.9996
    X0 = 500000
    Y0= 0.0

    P0 = 0 / D0
    L0 = (6 * abs(zone) - 183) / D0
    B1 = A1 * (1 - 1 / F1)
    E1 = np.sqrt((A1**2 - B1**2) / (A1**2))
    N = K0 * A1
    C = np.zeros(5)
    C = proj_coef_0(E1)

    YS = Y0 - N * (
        C[0] * P0
        + C[1] * np.sin(2 * P0)
        + C[2] * np.sin(4 * P0)
        + C[3] * np.sin(6 * P0)
        + C[4] * np.sin(8 * P0))

    C2 = proj_coef_2(E1)

    p1 = ego_vehicle_msg.ned_latitude / D0
    l1 = ego_vehicle_msg.ned_longitude / D0

    es = E1 * np.sin(p1)
    L = np.log( np.tan(np.pi/4.0 + p1/2.0) * 
                    np.power( ((1 - es) / (1 + es)), (E1 / 2)))

    z = np.complex(
            np.arctan(np.sinh(L) / np.cos(l1 - L0)),
            np.log(np.tan(np.pi / 4.0 + np.arcsin(np.sin(l1 - L0) / np.cosh(L)) / 2.0))
        )   

    Z = N * C2[0] * z \
            + N * (C2[1] * np.sin(2.0 * z)
            + C2[2] * np.sin(4.0 * z)
            + C2[3] * np.sin(6.0 * z)
            + C2[4] * np.sin(8.0 * z))

    east = Z.imag +  X0
    north = Z.real + YS

    lat= ego_vehicle_msg.ned_latitude
    lon= ego_vehicle_msg.ned_longitude

    e_o = 302459.942
    n_o = 4122635.537

    e_global, n_global = east, north

    x,y = e_global - e_o, n_global - n_o



    odom=Odometry()
    odom.header.frame_id='map'
    odom.child_frame_id='gps'

    quaternion = tf.transformations.quaternion_from_euler(0, 0, (ego_vehicle_msg.ned_heading+90)*pi/180)

    odom.pose.pose.position.x=x
    odom.pose.pose.position.y=y
    odom.pose.pose.position.z=ego_vehicle_msg.ned_heading
    odom.pose.pose.orientation.x=quaternion[0]
    odom.pose.pose.orientation.y=quaternion[1]
    odom.pose.pose.orientation.z=quaternion[2]
    odom.pose.pose.orientation.w=quaternion[3]

    return odom



def cameraLaneDetectionPath(ego_vehicle_msg,poly_path_msg):
    out_path=Path()
    out_path.header.frame_id='map'

    a=np.poly1d(poly_path_msg.data)

    x=[]
    y=[]

    translation=[ego_vehicle_msg.pose_x,ego_vehicle_msg.pose_y]
    theta=ego_vehicle_msg.ned_heading
    t=np.array([[cos(theta), -sin(theta),translation[0]],[sin(theta),cos(theta),translation[1]],[0,0,1]])

    for i in range(1,50):
        x.append(i*0.3)

    for i in x:
        y.append(a(i))



    for i in range(0,len(y)) :
        local_result=np.array([[x[i]],[y[i]],[1]])
        global_result=t.dot(local_result)

        tmp_pose=PoseStamped()
        tmp_pose.pose.position.x=global_result[0][0]
        tmp_pose.pose.position.y=global_result[1][0]
        tmp_pose.pose.position.z=0
        tmp_pose.pose.orientation.x=0
        tmp_pose.pose.orientation.y=0
        tmp_pose.pose.orientation.z=0
        tmp_pose.pose.orientation.w=1
        out_path.poses.append(tmp_pose)


    return out_path

def findLocalPath(ref_path,ego_vehicle_msg):
    odom_pub= rospy.Publisher('odom',Odometry, queue_size=1)
    odom_pub.publish(makeOdomMsg(ego_vehicle_msg))
    loc=makeOdomMsg(ego_vehicle_msg)
    out_path=Path()
    #fix
    current_x=loc.pose.pose.position.x
    current_y=loc.pose.pose.position.y
    current_waypoint=0
    min_dis=float('inf')

    for i in range(len(ref_path.poses)) :
        dx=current_x - ref_path.poses[i].pose.position.x
        dy=current_y - ref_path.poses[i].pose.position.y
        dis=sqrt(dx*dx + dy*dy)
        if dis < min_dis :
            min_dis=dis
            current_waypoint=i


    if current_waypoint+50 > len(ref_path.poses) :
        last_local_waypoint= len(ref_path.poses)
    else :
        last_local_waypoint=current_waypoint+50



    out_path.header.frame_id='map'
    for i in range(current_waypoint,last_local_waypoint) :
        tmp_pose=PoseStamped()
        tmp_pose.pose.position.x=ref_path.poses[i].pose.position.x
        tmp_pose.pose.position.y=ref_path.poses[i].pose.position.y
        tmp_pose.pose.position.z=ref_path.poses[i].pose.position.z
        tmp_pose.pose.orientation.x=0
        tmp_pose.pose.orientation.y=0
        tmp_pose.pose.orientation.z=0
        tmp_pose.pose.orientation.w=1
        out_path.poses.append(tmp_pose)

    return out_path,current_waypoint

         
def getLaneChangePath(start_point,end_point,start_next_point):
    out_path=Path()  
    out_path.header.frame_id='/map'
    translation=[start_point[0], start_point[1]]
    theta=atan2(start_next_point[1]-start_point[1],start_next_point[0]-start_point[0])


    t=np.array([[cos(theta), -sin(theta),translation[0]],[sin(theta),cos(theta),translation[1]],[0,0,1]])
    det_t=np.array([[t[0][0],t[1][0],-(t[0][0]*translation[0]+t[1][0]*translation[1])   ],[t[0][1],t[1][1],-(t[0][1]*translation[0]+t[1][1]*translation[1])   ],[0,0,1]])


    world_end_point=np.array([[end_point[0]],[end_point[1]],[1]])
    local_end_point=det_t.dot(world_end_point)



    x=[]
    y=[]
    x_interval=0.5
    xs=0
    xf=local_end_point[0][0]



    ps=0.0
    pf=local_end_point[1][0]

    

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
        out_path.poses.append(read_pose)

    return out_path
