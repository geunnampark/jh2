#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
current_path = os.path.dirname(os.path.realpath(__file__))
sys.path.append(current_path) # 현재 경로도 추가해준다.
sys.path.append(os.path.normpath(os.path.join(current_path, '../')))

import numpy as np
import matplotlib.pyplot as plt
import json

from .node import Node
from .line import Line
from .signal import Signal
from .junction import Junction
from .node_set import NodeSet
from .line_set import LineSet
from .signal_set import SignalSet
from .junction_set import JunctionSet

from utils.version import Version


class MGeoPlannerMap():
    def __init__(self, node_set=NodeSet(), link_set=LineSet(), junction_set=JunctionSet(), sign_set=SignalSet(), light_set=SignalSet()):
        '''
        반드시 MGeoPlannerMap은 node_set, link_set을 가지고 있어야 함
        Ctor에 전달하면서 init한다

        ver2.1 -> ver2.2 update: link 출력에 max_speed 추가 
        ver2.2 -> ver2.3 update: junction 클래스 추가
        ver2.3 -> ver2.4 update: code42 지도 데이터 추가
        ver2.4 -> ver2.5 update: junction을 list 형태로 변경
        '''
        # geometry
        self.node_set = node_set
        self.link_set = link_set

        self.junction_set = junction_set
    
        self.sign_set = sign_set
        self.light_set = light_set

        # 기타 정보
        self.maj_ver = 2
        self.min_ver = 5
        self.global_coordinate_system = 'UTM52N'
        self.local_origin_in_global = np.array([0, 0, 0])


    def set_origin(self, origin):
        if isinstance(origin, np.ndarray):
            self.local_origin_in_global = origin
        else:
            self.local_origin_in_global = np.array(origin)


    def get_origin(self):
        return self.local_origin_in_global


    def from_json(self, file_name):
        (global_info, self.node_set, self.link_set, 
            self.junction_set) = MGeoPlannerMap.__load_node_and_link(file_path)
        
        # global_info로부터 클래스 내 필드 설정
        self.maj_ver = global_info['maj_ver']
        self.min_ver = global_info['min_ver']
        self.global_coordinate_system = global_info['global_coordinate_system']
        self.local_origin_in_global = np.array(global_info['local_origin_in_global'])


    def to_json(self, output_path):
        # 클래스 내 필드에서 global_info 설정
        global_info = {
            'maj_ver': self.maj_ver,
            'min_ver': self.min_ver,
            'global_coordinate_system': self.global_coordinate_system, # 
            'local_origin_in_global': self.local_origin_in_global.tolist(), # origin
            'lane_change_link_included': True, 
            'license':'MORAI Inc.'
        }
        MGeoPlannerMap.save_node_and_link(
            output_path, global_info, self.node_set, self.link_set)
        
        # TODO(sglee): sign_set, light_set 저장하는 부분 분리, 둘 중 하나만 있는 경우가 있을 수 있다
        if self.sign_set is not None:
            MGeoPlannerMap.save_traffic_sign(output_path, self.sign_set)
        
        if self.light_set is not None:
            MGeoPlannerMap.save_traffic_light(output_path, self.light_set)

      

    @staticmethod
    def save_node_and_link(output_path, global_info, node_set, link_set):
        '''
        버전 2.1 까지 이 버전으로 저장되었음
        '''
        filename = os.path.join(output_path, 'global_info.json')
        with open(filename, 'w') as f:
            json.dump(global_info, f, indent=2)

        # 저장하기 전에 NodeSet의 dict를 삭제한다
        node_set.delete_dangling_nodes()


        # 각 노드는 id와 point를 저장한다.
        node_save_info_list = []
        for var in node_set.nodes:
            if isinstance(node_set.nodes, list):
                node = var
            else: 
                # node_set.nodes는 dictionary이다
                # 이 때 var은 key이다.
                node = node_set.nodes[var]

            # 교차로 정보 없으면 Emtpy List로 
            if node.junctions is None:
                node_junc_id = []
            elif isinstance(node.junctions, list):
                id_list = []
                for junc in node.junctions:
                    id_list.append(junc.idx)
                node_junc_id = id_list
            else:
                raise BaseException('Unexpected node.junctions (expected: list, actual type: {})'.format(type(node.junctions)))

            save_info = {
                'idx': node.idx,
                'junction': node_junc_id,
                'point': node.point.tolist()
            }
            node_save_info_list.append(save_info)

        # 이를 저장한다.
        filename = os.path.join(output_path, 'node_set.json')
        with open(filename, 'w') as f:
            json.dump(node_save_info_list, f, indent=2)

        # 각 라인은 id, points, to_node, from_node를 저장한다.
        line_save_info_list = []
        for var in link_set.lines:
            if isinstance(link_set.lines, list):
                line = var
            else:
                # link_set.lines는 dictionary 이다.
                # 이 때 var은 key이다.
                line = link_set.lines[var]
            

            # 차선 변경으로 진입 가능한 차선 정보    
            if not line.is_it_for_lane_change():
                # 일반 링크이면
                if line.get_left_lane_change_dst_link() is None:
                    left_lane_change_dst_link_idx = None
                else:
                    left_lane_change_dst_link_idx = line.get_left_lane_change_dst_link().idx
                
                if line.get_right_lane_change_dst_link() is None:
                    right_lane_change_dst_link_idx = None
                else:
                    right_lane_change_dst_link_idx = line.get_right_lane_change_dst_link().idx
            else:
                # 차선 변경 링크이면
                left_lane_change_dst_link_idx = None
                right_lane_change_dst_link_idx = None


            # 차선 변경 링크인 경우, 차선 변경 Path 
            lane_ch_link_path = []
            pair_list = line.get_lane_change_pair_list()
            for i in range(len(pair_list)):
                pair = pair_list[i]

                lane_ch_link_path.append(pair['from'].idx)

                # 마지막이면, 
                if (i == len(pair_list) - 1):
                    lane_ch_link_path.append(pair['to'].idx)

            save_info = {
                'idx':line.idx,
                'from_node_idx':line.from_node.idx,
                'to_node_idx':line.to_node.idx,
                'points':line.points.tolist(),
                'max_speed':line.max_speed_kph,
                'lazy_init':line.lazy_point_init,
                'left_lane_change_dst_link_idx': left_lane_change_dst_link_idx,
                'right_lane_change_dst_link_idx': right_lane_change_dst_link_idx, 
                'lane_ch_link_path': lane_ch_link_path,
                'link_type': line.link_type,
                'road_id': line.road_id,
                'ego_lane': line.ego_lane,
                'lane_change_dir': line.lane_change_dir,
                'hov': line.hov
            }
            line_save_info_list.append(save_info)

        # 이를 저장한다.
        filename = os.path.join(output_path, 'link_set.json')
        with open(filename, 'w') as f:
            json.dump(line_save_info_list, f, indent=2)        


    @staticmethod
    def save_traffic_light(output_path, light_set): 
        light_list = []
        for var, tl in light_set.signals.items():
            dict_data = Signal.to_dict(tl)
            light_list.append(dict_data)
      
        file_path = os.path.join(output_path, 'light_set.json')
        with open(file_path, 'w') as f:
            json.dump(light_list, f, indent=2)


    @staticmethod
    def save_traffic_sign(output_path, sign_set):
        sign_list = []
        for var, ts in sign_set.signals.items():           
            dict_data = Signal.to_dict(ts)
            sign_list.append(dict_data)

        # json 파일로 저장
        file_path = os.path.join(output_path, 'sign_set.json')
        with open(file_path, 'w') as f:
            json.dump(sign_list, f, indent=2)


    @staticmethod
    def load_node_and_link(folder_path):
        '''
        파일을 읽어 global_info, node_set, link_set을 생성하여 리턴한다
        MGeoPlannerMap ver2.1 까지 지원
        '''
        # node_set, link_set은 버전 정보와 관계없이 공통이다.
        filename = os.path.join(folder_path, 'node_set.json')
        with open(filename, 'r') as f:
            node_save_info_list = json.load(f)

        filename = os.path.join(folder_path, 'link_set.json')
        with open(filename, 'r') as f:
            line_save_info_list = json.load(f)


        # 버전 정보를 찾는다
        # 버전 파일이 없으면, ver1이다.
        filename = os.path.join(folder_path, 'global_info.json')
        if not os.path.isfile(filename):
            print('[WARNING] There is no global_info.json file in the specified location. link format ver1 is assumed.')

            from save_load import subproc_load_link_ver1
            node_set, link_set = subproc_load_link_ver1.load_node_and_link(node_save_info_list, line_save_info_list)

            # ver1에서는 global_info가 없으므로, 직접 생성해준다
            global_info = {
                'maj_ver': 1,
                'min_ver': 0,
                'global_coordinate_system': 'UTM52N',
                'local_origin_in_global': [0, 0, 0]
            }

            return global_info, node_set, link_set

        # 읽을 버전 정보 파일이 있는 경우    
        with open(filename, 'r') as f:
            global_info = json.load(f)

        # 버전 정보에 맞게 node_set, link_set을 읽어온다.
        if global_info['maj_ver'] == 2:

            from save_load import subproc_load_link_ver2
            node_set, link_set, junction_set = subproc_load_link_ver2.load_node_and_link(
                node_save_info_list, line_save_info_list, global_info)

        return global_info, node_set, link_set, junction_set


    @staticmethod
    def load_traffic_sign(folder_path, link_set):
        """sign_set.json 파일을 읽고 표지판 셋 (ts_set)을 생성한다"""
        ts_set = SignalSet()
        filename = os.path.join(folder_path, 'sign_set.json')
        if os.path.isfile(filename):
            with open(filename, 'r') as f:
                saved_info = json.load(f)
        else:
            print('[WARNING] There is no sign_set.json. An empty SignalSet instance will be returned.')
            return ts_set

        for each_info in saved_info:
            ts = Signal.from_dict(each_info, link_set)
            ts_set.append_signal(ts)

        return ts_set


    @staticmethod
    def load_traffic_light(folder_path, link_set):
        """light_set.json 파일을 읽고 표지판 셋 (tl_set)을 생성한다"""
        tl_set = SignalSet()
        filename = os.path.join(folder_path, 'light_set.json')
        if os.path.isfile(filename):
            with open(filename, 'r') as f:
                saved_info = json.load(f)
        else:
            print('[WARNING] There is no light_set.json. An empty SignalSet instance will be returned.')
            return tl_set

        for each_info in saved_info:
            tl = Signal.from_dict(each_info, link_set)
            tl_set.append_signal(tl)

        return tl_set
        

    @staticmethod
    def create_instance_from_json(folder_path):
        '''
        파일을 읽어서 MGeoPlannerMap 인스턴스를 생성한다
        '''
        global_info, node_set, link_set, junction_set = MGeoPlannerMap.load_node_and_link(folder_path)
        
        sign_set = MGeoPlannerMap.load_traffic_sign(folder_path, link_set)
        light_set = MGeoPlannerMap.load_traffic_light(folder_path, link_set)

        mgeo_planner_map = MGeoPlannerMap(node_set, link_set, junction_set, sign_set, light_set)
        mgeo_planner_map.maj_ver = global_info['maj_ver']
        mgeo_planner_map.min_ver = global_info['min_ver']
        mgeo_planner_map.global_coordinate_system = global_info['global_coordinate_system']
        mgeo_planner_map.local_origin_in_global = np.array(global_info['local_origin_in_global'])

        return mgeo_planner_map