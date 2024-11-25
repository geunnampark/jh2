#!/usr/bin/env python
# -*- coding: utf-8 -*-

from .line import Line
import sys
import numpy as np 


class Link(Line):
    '''
    내부의 points 필드를 처음부터 초기화하지 않고 나중에 만들 수 있는 클래스이다.
    
    lazy_point_init 필드가 True이면, point 변수 초기화를 나중에 할 수 있다.
    이는 차선 변경이 가능함을 표현하기 위한 클래스로, 아래 예시를 통해 정의를 이해할 수 있다.

    아래와 같이 편도 2차선인 도로를 가정하면 도로의 양끝에는 노드가 2개씩 있어,
    총 4개의 노드가 정의된다.
    
    예제)
    ======> 실제 도로 방향 =====>
    Node1A                Node2A
    Node1B                Node2B

    이 때 어느 쪽으로든 차선이 변경 가능하다고 하면, 총 4종류의 링크가 생성 가능한데,
    
    Node1A -> Node2A
    Node1B -> Node2B
    위 2가지 링크는 차선 변경을 하지 않는 링크로, 
      실제 차가 따라가야할 경로가 fix되어 있는 셈이다.
      이 경우 lazy_point_init = False로 정의하고, points 필드에 경로점이 정의되어 있다.
    
    Node1A -> Node2B
    Node1B -> Node2A
    위 2가지 링크는 차선 변경을 하는 링크로,
      실제 차가 따라가야할 경로는 고정되어 있지 않다 (차선 변경을 어느 시점에든 할 수 있으므로)
      이 경우 lazy_point_init = True로 정의하고, points 필드는 연결해야하는 양 끝점만 가지고 있다.

    '''
    def __init__(self, points=None, idx=None, lazy_point_init=False, link_type=None):        
        self.lazy_point_init = lazy_point_init
        super(Link, self).__init__(points, idx)
        # if sys.version_info[0] > 2:
        #     super(Link, self).__init__(points, idx)
        # else:
        #     Line.__init__(points, idx)

        # 차선 변경이 아닐 경우 이 값이 유효. 차선 변경 링크를 생성하기 위한 값들
        self.lane_ch_link_left = None # 좌측 차선 진입으로 들어갈 수 있는 링크
        self.lane_ch_link_right = None # 우측 차선 진입으로 들어갈 수 있는 링크

        # 같은 도로 소속인 차선의 관계성 확보용 변수
        self.lane_group = None

        # 차선 변경일 경우
        self.lane_change_pair_list = list()

        # 최대 속도 및 최저 속도
        self.max_speed_kph = 0
        self.min_speed_kph = 0

        self.link_type = link_type


        # 해당 링크에 연결된 object들
        self.traffic_signs = list()
        self.traffic_lights = list()


        # temporary properties for code42 links
        self.road_id = None
        self.ego_lane = None
        self.lane_change_dir = None
        self.hov = None

    def set_points(self, points):
        super(Link, self).set_points(points)
        # if sys.version_info[0] > 2:
        #     super(Link, self).set_points(points)
        # else:
        #     Line.set_points(points)
        # NOTE: cost 계산 시 고려되어야 하는 부분이 너무 많아서, 이를 set_points에 묶어둘 수 없다.
        # self.calculate_cost()
    
    def is_it_for_lane_change(self):
        return self.lazy_point_init

    def get_traffic_signs(self):
        return self.traffic_signs

    def get_traffic_lights(self):
        return self.traffic_lights
    

    ''' 차선 변경으로 진입 가능한 링크 설정 ''' 
    def set_left_lane_change_dst_link(self, link):
        if not isinstance(link, Link):
            raise BaseException('[ERROR] unexpected link type: {}'.format(type(link)))    
        self.lane_ch_link_left = link

    def set_right_lane_change_dst_link(self, link):
        if not isinstance(link, Link):
            raise BaseException('[ERROR] unexpected link type: {}'.format(type(link)))        
        self.lane_ch_link_right = link

    def get_left_lane_change_dst_link(self):
        if self.is_it_for_lane_change():
            raise BaseException('[ERROR] lane_change_dst_link is only defined when self.is_it_for_lane_change() == False')
        return self.lane_ch_link_left

    def get_right_lane_change_dst_link(self):
        if self.is_it_for_lane_change():
            raise BaseException('[ERROR] lane_change_dst_link is only defined when self.is_it_for_lane_change() == False')
        return self.lane_ch_link_right
    

    ''' 차선 변경 관련'''
    def get_lane_change_pair_list(self):
        return self.lane_change_pair_list
    
    def set_lane_change_pair_list(self, info):
        self.lane_change_pair_list = info

    def get_number_of_lane_change(self):
        if not self.is_it_for_lane_change():
            return 0
        else:
            return len(self.lane_change_pair_list)

    # TODO(sglee): 이 메소드 쓰는 다른 부분 삭제
    # def get_lane_change_from_link(self):
    #     return self.lane_change_from_link

    # def set_lane_change_from_link(self, link):
    #     self.lane_change_from_link = link

    # def get_lane_change_to_link(self):
    #     return self.lane_change_to_link

    # def set_lane_change_to_link(self, link):
    #     self.lane_change_to_link = link

    def set_values_for_lane_change_link(self, lane_change_path):
        '''
        본 링크가 차선 변경을 표현하고자하는 링크일 때, 
        lane_change_path = [A, B, C, D] 와 같은 식으로 넣어주면 된다. 
        - from_node는 A의 from_node,
          to_node  는 D의 to_node,
        - lane_change_pair_list는 [from A -> to B], [from B -> to C], [from C -> to D]
        '''
        if not self.lazy_point_init:
            raise BaseException('lazy_point_init is True => USE Line.set_points_using_node instead of this!! (cannot use set_points_using_node_lazy_init)')
        
        if len(lane_change_path) < 2:
            raise BaseException('len(lane_change_path) must be >= 2 !! length of the current input = {}'.format(len(lane_change_path)))

        # from node, to node 설정 
        from_node = lane_change_path[0].get_from_node()
        to_node = lane_change_path[-1].get_to_node()
        # NOTE: 이미 해당 링크가 먼저 파일등으로부터 로드되었다면, from_node, to_node 등은 미리 설정되어있을 것이다.
        self.set_from_node(from_node)
        self.set_to_node(to_node)

        # points 설정
        p1 = from_node.point
        p2 = to_node.point
        points = p1
        points = np.vstack((points, p2))
        self.set_points(points)

        # 
        lane_change_pair_list = [] 
        for i in range(len(lane_change_path) - 1):
           lane_change_pair_list.append({'from': lane_change_path[i], 'to': lane_change_path[i+1]})
        self.set_lane_change_pair_list(lane_change_pair_list)

    # TODO(sglee): 이 메소드 쓰는 다른 부분 삭제
    # def set_points_using_node_lazy_init(self, from_node, to_node):
    #     '''
    #     lazy init으로, from node와 to node를 등록한다. 
    #     이 때 내부의 points 필드는 각 node의 두 포인트 만으로 정의된다
    #     '''
    #     if not self.lazy_point_init:
    #       raise BaseException('lazy_point_init is True => USE Line.set_points_using_node instead of this!! (cannot use set_points_using_node_lazy_init)')
    #     self.set_from_node(from_node)
    #     self.set_to_node(to_node)

    #     p1 = from_node.point
    #     p2 = to_node.point

    #     points = p1
    #     points = np.vstack((points, p2))
    #     self.set_points(points)

    def set_max_speed_kph(self, max_speed_kph):
        self.max_speed_kph = max_speed_kph

    def set_min_speed_kph(self, min_speed_kph):
        self.min_speed_kph = min_speed_kph

    def get_max_speed_kph(self):
        return self.max_speed_kph

    def get_min_speed_kph(self):
        return self.min_speed_kph

    def get_total_distance(self):
        total_distance = 0
        for i in range(len(self.points) - 1) :
            vect = self.points[i+1] - self.points[i]
            dist_between_each_point_pair = np.linalg.norm(vect, ord=2)
            total_distance += dist_between_each_point_pair
        return total_distance

    def calculate_cost(self):
        '''
        points 필드를 바탕으로, cost를 계산한다.
        set_points가 초기화코드에서 호출되면서 point가 설정이 안 된 채로 호출될 수 있는데,
        이 때는 그냥 리턴한다. (TODO: 향후 코드 개선 필요.
        이건 사실 근본적으로 Line쪽의 문제임. ctor에서는 set_points를 호출하지 않든지 해야 함)
        '''
        if self.points is None:
            # print('[WARN] calculate_cost is called without points attribute initialized')
            return 
        

        # 거리 계산
        # TODO: 해당 차로의 속도를 생각해서, 시간을 기준으로 고려할 것
        if self.is_it_for_lane_change():
            # 변경해서 들어갈 마지막 차선의 distance로 계산한다
            # NOTE: 중요한 가정이 있음. 차선 변경 진입 전후의 링크 길이가 거의 같아야 한다
            # 차선 변경 진입 후 링크가 너무 길다거나 하면 차선 변경 링크 생성 이전에 편집이 필요

            lane_ch_pair_list = self.get_lane_change_pair_list()
            last_to_link = lane_ch_pair_list[-1]['to']
            distance = last_to_link.get_total_distance()
        else:
            distance = self.get_total_distance()


        # 차선 변경에 따른 cost 계산
        # TODO: 해당 차로의 속도를 생각해서, 차선 변경 가능 시간을 기준으로 고려할 것
        def calc_lane_change_cost(x):  
            # 기준이 되는 값
            x_org = [10, 50, 100, 500, 1000, 2000]
            y_org = [500, 300, 200,  50, 20, 10]
            return np.interp(x, x_org, y_org, left=float('inf'), right=y_org[-1])

        lane_ch_pair_list = self.get_lane_change_pair_list()
        if self.is_it_for_lane_change():
            # 차선 변경이 3번이면, 전체 링크 길이를 L이라 할 때
            # L/3 인 차선 변경 cost를 계산한 다음, 3을 곱하여 전체 차선 변경 penalty를 계산
            lc_num = self.get_number_of_lane_change()
            unit_distance = distance / lc_num
            lane_change_penalty = lc_num * calc_lane_change_cost(unit_distance)
        else:
            lane_change_penalty = 0            

        self.cost = distance + lane_change_penalty
          
    def draw_plot(self, axes):

        # 그려야하는 width와 color가 지정되어 있으면 해당 값으로만 그린다
        if self.vis_mode_line_width is not None and \
            self.vis_mode_line_color is not None:
            self.plotted_obj = axes.plot(self.points[:,0], self.points[:,1],
                linewidth=self.vis_mode_line_width,
                color=self.vis_mode_line_color,
                markersize=2,
                marker='o')
            return
            
        if self.get_vis_mode_all_different_color():
            # 모두 다르게 그리라고하면, 색을 명시하지 않으면 된다
            self.plotted_obj = axes.plot(self.points[:,0], self.points[:,1],
                markersize=2,
                marker='o')
                
        else:
            # 이 경우에는 선의 종류에 따라 정해진 색과 모양으로 그린다
            if not self.lazy_point_init:
                self.plotted_obj = axes.plot(self.points[:,0], self.points[:,1],
                    linewidth=1,
                    markersize=2,
                    marker='o',
                    color='k')
            else:
                self.plotted_obj = axes.plot(self.points[:,0], self.points[:,1],
                    linewidth=1,
                    markersize=2,
                    marker='o',
                    color='b')


    # TODO(sglee): plot할 때 화살표 그려넣으려고 했는데 일단 사용 안 함
    #              화살표의 방향이 내가 원하는 방향 대로 안 나오고 여러 문제가 있어 일단 보류
    # def draw_plot(self, axes):
    #     # NOTE: Line 클래스는 included_plane 변수에 따라 다르게 표현함
    #     # 본 클래스에서는 plane과는 관계 없으므로, 
    #     # 그냥 lazy_init인지만 표현해준다

    #     if not self.lazy_point_init:
    #         self.plotted_obj = axes.plot(self.points[:,0], self.points[:,1],
    #             markersize='2',
    #             marker='o',
    #             color='k')

    #         # mid point에 표시
            
    #     else:
            
    #         self.plotted_obj = axes.plot(self.points[:,0], self.points[:,1],
    #             markersize='2',
    #             marker='o',
    #             color='b')

    #         # p1, p2의 중간 지점을 계산하여 표시
    #         mid = (self.points[0] + self.points[-1]) / 2

    #         # direction은 p1 -> p2 vector로. 계산이 가능
    #         pos_vector = self.points[-1] - self.points[0] 
    #         vector_len = np.linalg.norm(pos_vector, ord=2)
    #         unit_vector = pos_vector / vector_len
    #         small_vector = 1 * unit_vector

    #         # 이 vector 의 방향으로, 길이를 0.01로 잡는다
    #         small_increment_from_mid = mid + small_vector
    #         dx = small_vector[0]
    #         dy = small_vector[1]

    #         print('mid  : ', mid)
    #         print('mid+d: ', small_increment_from_mid)

    #         axes.arrow(mid[0], mid[1], dx, dy, 
    #             head_width=0.25,
    #             head_length=0.5,
    #             facecolor='r',
    #             edgecolor='r')

    @staticmethod
    def copy_attributes(src, dst):
        dst.lane_group = src.lane_group
        dst.lane_change_pair_list = src.lane_change_pair_list
        
        
        dst.max_speed_kph = src.max_speed_kph
        dst.min_speed_kph = src.min_speed_kph
        dst.link_type = src.link_type
        
        
        dst.road_id = src.road_id
        dst.ego_lane = src.ego_lane
        dst.lane_change_dir = src.lane_change_dir
        dst.hov = src.hov
        


