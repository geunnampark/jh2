#!/usr/bin/env python
# -*- coding: utf-8 -*-

import matplotlib.pyplot as plt
import sys
import numpy as np 
from .base_point import BasePoint

class Node(BasePoint):
    """두 선을 연결하는 기능을 갖는 점"""
    def __init__(self, _id=None):
        super(Node, self).__init__(_id)
        # if sys.version_info[0] > 2:
        #     super(Node, self).__init__(_id)
        # else:
        #     BasePoint.__init__(_id)

        self.to_links = list()
        self.from_links = list()
        self.junctions = list()

        self.included_in_plane = None

    
    def add_to_links(self, line):
        if line not in self.to_links:
            self.to_links.append(line)
        # else:
        #     print('[WARNING] Trying to add an existing to_link again.')

    def add_from_links(self, line):
        if line not in self.from_links:
            self.from_links.append(line)
        # else:
        #     print('[WARNING] Trying to add an  existing from_links again.')
        

    def add_junction(self, junction):
        if junction in self.junctions:
            print('[WARN] Junction passed (id={}) already exists in the current node (id={})'.format(junction.idx, self.idx))
        else:
            self.junctions.append(junction)

        if self in junction.get_jc_nodes():
            print('[WARN] Current node (id={}) already exists in the junction (id={})'.format(self.idx, junction.idx))
        else:
            junction.jc_nodes.append(self)

    def remove_to_links(self, line_to_delete):
        self.to_links.remove(line_to_delete)
        # self.add_to_links(line_to_add)

    def remove_from_links(self, line_to_delete):
        self.from_links.remove(line_to_delete)
        # self.add_from_links(line_to_add)

    def remove_junctions(self, junction):
        self.junctions.remove(junction)

    def get_to_links(self):
        return self.to_links
    
    def get_from_links(self):
        return self.from_links

    def get_to_links_idx_list(self):
        idx_list = []
        for link in self.get_to_links():
            idx_list.append(link.idx)
        return idx_list

    def get_from_links_idx_list(self):
        idx_list = []
        for link in self.get_from_links():
            idx_list.append(link.idx)
        return idx_list

    def get_from_nodes(self):
        from_nodes = []
        for link in self.get_from_links():
            # NOTE: 아래 예시와 같이 Node 01 과 Node 10을 이어주는 링크가 여러개 존재할 수 있다
            # 따라서, from_nodes 내부에 이미 Node 01이 들어있는지 체크하지 않으면, Node 01이 2번 들어가게된다.
            #         ↗ Link 1 ↘ 
            # Node 01 -> Link 2 -> Node 10
            # Node 02 -> Link 3 ↗ 
            if link.from_node not in from_nodes:
                from_nodes.append(link.from_node)
        return from_nodes

    def get_to_nodes(self):
        to_nodes = []
        for link in self.get_to_links():
            # NOTE: 아래 예시와 같이 Node 01 과 Node 10을 이어주는 링크가 여러개 존재할 수 있다
            # 따라서, to_nodes 내부에 이미 Node 10이 들어있는지 체크하지 않으면, Node 10이 2번 들어가게된다.
            #         ↗ Link 1 ↘ 
            # Node 01 -> Link 2 -> Node 10
            #         ↘ Link 3 -> Node 11
            if link.to_node not in to_nodes:
                to_nodes.append(link.to_node)
        return to_nodes

    def find_shortest_link_leading_to_node(self, to_node):
        """현재 노드에서 to_node로 연결되어 있는 링크를 찾고, 그 중에서 가장 빠른 링크를 찾아준다"""
        # NOTE: 
        to_links = []
        for link in self.get_to_links():
            if link.to_node is to_node:
                to_links.append(link)

        if len(to_links) == 0:
            raise BaseException('[ERROR] Error @ Dijkstra.find_shortest_path : Internal data error. There is no link from node (id={}) to node (id={})'.format(from_node.idx, to_node.idx))

        shortest_link = None
        min_cost = float('inf')
        for link in to_links:
            if link.cost < min_cost:
                min_cost = link.cost
                shortest_link = link

        return shortest_link, min_cost

    def get_junctions(self):
        return self.junctions

    def is_dangling_node(self):
        """어떠한 링크에도 연결되지 않은 노드인지 검색한다"""
        if len(self.to_links) != 0:
            return False
        if len(self.from_links) != 0:
            return False

        return True

    def print_all_related_nodes_and_links(self):
        print('---------- For Node = {} ----------'.format(self.idx))
        
        print('From Nodes')
        for node in self.get_from_nodes():
            print('  Node {1} -> Node {0}'.format(self.idx, node.idx))
        print('----------')

        print('To Nodes')
        for node in self.get_to_nodes():
            print('  Node {0} -> Node {1}'.format(self.idx, node.idx))
        print('----------')
        
        print('From Links')
        for link in self.get_from_links():
            print('  Link {1} -> Node {0}'.format(self.idx, link.idx))
        print('----------')

        print('To Links')        
        for link in self.get_to_links():
            print('  Node {0} -> Link {1}'.format(self.idx, link.idx))
        print('--------------------')


    def draw_plot(self, axes):
        """MPLCanvas 사용시, 본 클래스의 인스턴스를 plot하기 위한 함수"""

        """별도 style이 지정되어 있을 경우, 지정된 스타일로 그린다"""
        if self.vis_mode_size is not None and \
            self.vis_mode_color is not None:
            self.plotted_objs_point = axes.plot(self.point[0], self.point[1],
                markersize=self.vis_mode_size,
                marker='D',
                color=self.vis_mode_color)

            # matplotlib.text.Text 인스턴스를 반환
            if not self.vis_mode_no_text:
                self.plotted_objs_text = axes.text(self.point[0], self.point[1]+0.1,
                    self.idx,
                    fontsize=10)
            return

        """별도 style이 지정되어 있지 않을 경우, 아래의 디폴트 스타일로 그린다"""
        # 이는 list of matplotlib.lines.Line2D 인스턴스를 반환
        if not self.included_in_plane:
            # 기본 Plot 스타일
            self.plotted_objs_point = axes.plot(self.point[0], self.point[1],
                markersize=7,
                marker='D',
                color='g')
        else:
            self.plotted_objs_point = axes.plot(self.point[0], self.point[1],
                markersize=7,
                marker='D',
                color='r')

        # matplotlib.text.Text 인스턴스를 반환 
        self.plotted_objs_text = axes.text(self.point[0], self.point[1]+0.1,
            self.idx,
            fontsize=10)