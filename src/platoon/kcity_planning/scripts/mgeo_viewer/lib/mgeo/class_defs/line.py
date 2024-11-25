#!/usr/bin/env python
# -*- coding: utf-8 -*-

import matplotlib.pyplot as plt
import sys
import numpy as np 
from .base_line import BaseLine

class Line(BaseLine):
    """FromNode, ToNode를 통해 연결하는 기능을 갖는 선"""
    def __init__(self, _points=None, idx=None):
        super(Line, self).__init__(_points, idx)
        # if sys.version_info[0] > 2:
        #     super(Line, self).__init__(_points, idx)
        # else:
        #     BaseLine.__init__(_points, idx)

        self.from_node = None
        self.to_node = None

        # matplotlib에 의해 그려진 list of Line2D 객체에 대한 레퍼런스
        # plt.plot을 호출하면서 반환되는 값이며,
        # 이 레퍼런스를 통해 matplotlib에서 삭제 또는 스타일 변경 등이 가능
        self.plotted_obj = None

        # self.included_in_plane = None
        self.included_plane = list()

        # Visualization 모드
        self.set_vis_mode_all_different_color(False)
        self.reset_vis_mode_manual_appearance()


    def get_point_dict(self, point_idx):
        '''
        특정 점을 반환한다. 이 때 점은 자신이 속한 line에 대한 다양한 정보를 포함한다
        '''
        # 편의상 point_idx를 -1로 넣었으면, 이를 마지막 인덱스로 변경해준다
        if point_idx == -1:
            point_idx = self.get_last_idx()

        if point_idx < 0:
            raise BaseException('[ERROR] Line.get_point_dict: input argument point_idx must be >= 0. (-1 is exceptionally ok).')

        if point_idx == 0:
            type_str = 'start'
        elif point_idx == self.get_last_idx():
            type_str = 'end'
        else:
            type_str = 'mid'
        
        dict_obj = dict({
            'idx_line': self.idx,
            'idx_point': point_idx,
            'type': type_str,
            'coord': self.points[point_idx],
            'line_ref': self})
        return dict_obj 
    
    def get_last_idx(self):
        return self.points.shape[0] - 1
    
    def set_from_node(self, _from_node):
        self.from_node = _from_node
        self.from_node.add_to_links(self)

    def set_to_node(self, _to_node):
        self.to_node = _to_node
        self.to_node.add_from_links(self)

    """
    [매우 중요]
    다음과 같은 set_from_link, set_to_link는 정의하면 안 된다!!
    왜냐하면, 다음과 같은 구조가 존재할 수 있기 때문이다.

    어떤 Source Node가 있어서, 해당 노드로부터 Line1, Line2가 동시에 출발하는 경우
    어떤 Sink   Node가 있어서, Line3, Line4가 동시에 해당 노드로 들어가는 경우

    즉, 어떤 Line이 직접 연결되어있는 건 Node라고만 생각해야 하고,
    함수를 직접 호출하는 건 이 Line의 from_node, to_node 만이라고 생각하는 것이 간단하다.

    물론 Line1 의 End -> Line2의 Start로 연결되는 구조에 한해서는,
    Line2.set_from_link(Line1)을 호출할 수 있겠고

    앞서 언급한 Source Node를 공유하는 Line1, Line2에 대해서는
    Line2.set_source_sharing_link(Line1)과 같이 호출하는 것도 가능은 하겠으나,

    우선은 내부 구조를 혼란스럽게하는 것이 아닌가 생각되어,
    직접 링크를 걸어주는 것은 node에만 한정하는 것을 유지한다.


    def set_from_link(self, _from_link):
        '''
        from_link를 설정해준다. 이 때, from_link는 내부에 to_node가 이미 지정되어 있어야 한다.
        내부적으로는 해당 링크의 to_node를 받아, 이를 본 인스턴의 from_node로 설정하는 것이다.
        '''
        # from_link의 to_node가, 현재 노드의 from_node로 설정되는 것
        from_node = _from_link.get_to_node()
        self.set_from_node(from_node)

    def set_to_link(self, to_link):
        '''
        to link를 설정해준다. 이 때 to_link는 내부에 from_node가 이미 지정되어 있어야 한다.
        내부적으로는 해당 링크의 from_node를 받아, 이를 본 인스턴의 to_node로 설정하는 것이다. 
        '''
        # to_link의 from_node가, 현재 노드의 to_node로 설정되는 것
        to_node = _to_link.get_from_node()
        self.set_to_node(to_node)
    """

    def get_from_node(self):
        return self.from_node 

    def get_to_node(self):
        return self.to_node

    def get_from_links(self):
        return self.from_node.get_from_links()
    
    def get_to_links(self):
        return self.to_node.get_to_links()

    def get_from_node_sharing_links(self):
        '''
        특정 노드에서 같이 출발하는 링크가 있을 수 있다.
        나를 제외한 해당 링크를 반환한다.
        '''
        links = self.from_node.get_to_links()
        ret = list()
        for each_link in links:
            if each_link is not self: # [중요] value가 같은게 아니라, instance가 동일여부인지를 체크해야 함 그래서 is not을 사용
                ret.append(each_link)
        return ret

    def get_to_node_sharing_links(self):
        '''
        특정 노드로 같이 들어가는 링크가 있을 수 있다.
        나를 제외한 해당 링크를 반환한다.
        '''
        links = self.to_node.get_from_links()
        ret = list()
        for each_link in links:
            if each_link is not self: # [중요] value가 같은게 아니라, instance가 동일여부인지를 체크해야 함 그래서 is not을 사용
                ret.append(each_link)
        return ret

    def set_points_using_node(self, from_node, to_node, step_len):
        self.set_from_node(from_node)
        self.set_to_node(to_node)

        p1 = from_node.point
        p2 = to_node.point

        # from_node 에서 to_node로 가는 직선을 구성하는 점을 만든다
        vector_len = np.sqrt((p2[0] - p1[0]) ** 2 + (p2[1] - p1[1]) ** 2)
        unit_vector = (p2 - p1) / vector_len
        step_vector =  step_len * unit_vector

        num_points = (int)(np.floor(vector_len / step_len))

        points_p1_to_p2 = self._create_points_using_step(p1, step_vector, num_points)
        points = p1
        points = np.vstack((points, points_p1_to_p2))
        points = np.vstack((points, p2))
        self.set_points(points)

    def get_included_planes(self):
        return self.included_plane

    def add_included_plane(self, plane):
        self.included_plane.append(plane)

    def remove_included_plane(self, plane_to_remove):
        self.included_plane.remove(plane_to_remove)

    def draw_plot(self, axes):
        # 그려야하는 width와 color가 지정되어 있으면 해당 값으로만 그린다
        if self.vis_mode_line_width is not None and \
            self.vis_mode_line_color is not None:
            self.plotted_obj = axes.plot(self.points[:,0], self.points[:,1],
                linewidth=self.vis_mode_line_width,
                color=self.vis_mode_line_color,
                markersize=1,
                marker='o')
            return
        

        if self.get_vis_mode_all_different_color():
            # 모두 다르게 그리라고하면, 색을 명시하지 않으면 된다
            self.plotted_obj = axes.plot(self.points[:,0], self.points[:,1],
                markersize=1,
                marker='o')
        
        else:
            # 이 경우에는 선의 종류에 따라 정해진 색과 모양으로 그린다
            
            if not self.included_plane:
                # 이는 list of matplotlib.lines.Line2D 인스턴스를 반환
                self.plotted_obj = axes.plot(self.points[:,0], self.points[:,1],
                    markersize=1,
                    marker='o',
                    color='k')
            else:
                self.plotted_obj = axes.plot(self.points[:,0], self.points[:,1],
                    markersize=1,
                    marker='o',
                    color='b')

    def erase_plot(self):
        if self.plotted_obj is not None:
            # list of matplotlib.lines.Line2D 이므로
            # iterate 하면서 remove를 호출해야 함
            for obj in self.plotted_obj:
                if obj.axes is not None:
                    obj.remove()

    def hide_plot(self):
        if self.plotted_obj is not None:
            for obj in self.plotted_obj:
                obj.set_visible(False)

    def unhide_plot(self):
        if self.plotted_obj is not None:
            for obj in self.plotted_obj:
                obj.set_visible(True)

    def set_vis_mode_all_different_color(self, on_off):
        self.vis_mode_all_different_color = on_off

    def get_vis_mode_all_different_color(self):
        return self.vis_mode_all_different_color

    def set_vis_mode_manual_appearance(self, width, color):
        self.vis_mode_line_width = width
        self.vis_mode_line_color = color

    def reset_vis_mode_manual_appearance(self):
        self.set_vis_mode_manual_appearance(None, None)

                
                
