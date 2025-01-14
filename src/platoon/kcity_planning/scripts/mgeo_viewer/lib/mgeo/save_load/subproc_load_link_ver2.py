#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
strCurrentPath = os.path.dirname(os.path.realpath(__file__))
sys.path.append(strCurrentPath) # 현재 경로도 추가해준다.
sys.path.append(strCurrentPath + '/../') # mgeo가 있는 경로를 추가한다.

from class_defs import *
from utils.version import Version

import numpy as np
import matplotlib.pyplot as plt
import json


def load_node_and_link(node_save_info_list, line_save_info_list, global_info):
    file_ver = Version(global_info['maj_ver'], global_info['min_ver'])
    # load 기본 타입은 dict 이다.

    # node_save_info_list에서 node_set 생성
    node_set = NodeSet()
    link_set = LineSet()
    junction_set = JunctionSet()

    # 노드 생성하기
    for save_info in node_save_info_list:
        idx = save_info['idx']
        point = save_info['point']
        
        node = Node(idx)
        node.point = np.array(point)

        # 교차로 생성하기 (노드 생성하면서 같이 수행)
        if file_ver >= Version(2,5):
            junction_list = save_info['junction']

            if junction_list is None:
                continue
            elif len(junction_list) == 0:
                node.junctions = list()
            else:
                for junction_id in junction_list:
                    if junction_id in junction_set.junctions.keys():
                        repeated_jc = junction_set.junctions[junction_id]
                        repeated_jc.add_jc_node(node)
                    else:
                        new_junction = Junction(junction_id)
                        new_junction.add_jc_node(node)

                        junction_set.append_junction(new_junction)
        
        elif file_ver >= Version(2,3):
            junction_id = save_info['junction']

            if junction_id is not None:
                if junction_id in junction_set.junctions.keys():
                    repeated_jc = junction_set.junctions[junction_id]
                    repeated_jc.add_jc_node(node)
                else:
                    new_junction = Junction(junction_id)
                    new_junction.add_jc_node(node)

                    junction_set.append_junction(new_junction)
                    

        node_set.append_node(node, create_new_key=False)

    # 링크 생성하기
    for save_info in line_save_info_list:
        idx = save_info['idx']
        from_node = node_set.nodes[save_info['from_node_idx']]
        to_node = node_set.nodes[save_info['to_node_idx']]
        points = save_info['points']
        lazy_init = save_info['lazy_init']
        link_type = save_info['link_type']
       

        # 우선 위 값만 가지고 링크를 먼저 세팅한다
        link = Link(idx=idx, lazy_point_init=lazy_init)
        link.set_from_node(from_node)
        link.set_to_node(to_node)
        link.set_points(np.array(points))
        link.link_type = link_type


        # 버전 2.2 이상부터 max speed 정보를 담고 있다
        if file_ver >= Version(2,2):
            link.set_max_speed_kph(save_info['max_speed'])

        if file_ver >= Version(2,4):
            link.road_id = save_info['road_id']
            link.ego_lane = save_info['ego_lane']
            link.lane_change_dir = save_info['lane_change_dir']
            link.hov = save_info['hov']

        link_set.append_line(link, create_new_key=False)
    

    for save_info in line_save_info_list:
        idx = save_info['idx']
        link = link_set.lines[idx]

        # 각 링크에 대해 다음을 설정
        if not link.is_it_for_lane_change():
            # 차선 변경이 아닐 경우, 차선 변경으로 진입 가능한 링크를 설정
            if save_info['left_lane_change_dst_link_idx'] is not None:
                dst_link = link_set.lines[save_info['left_lane_change_dst_link_idx']]
                link.set_left_lane_change_dst_link(dst_link)

            if save_info['right_lane_change_dst_link_idx'] is not None:
                dst_link = link_set.lines[save_info['right_lane_change_dst_link_idx']]
                link.set_right_lane_change_dst_link(dst_link)

        else:
            # 차선 변경일 경우, 

            # 우선 인덱스로 표시된 lane_ch_link_path를 link에 대한 reference로 변경
            lane_ch_link_path_idx = save_info['lane_ch_link_path']
            lane_ch_link_path = []
            for idx in lane_ch_link_path_idx:
                lane_ch_link_path.append(link_set.lines[idx])

            # 이 값을 통해서 link 내부 값 설정
            link.set_values_for_lane_change_link(lane_ch_link_path)

    
    # 모든 링크에 대한 cost 계산
    for key, link in link_set.lines.items():
        link.calculate_cost()

    return node_set, link_set, junction_set