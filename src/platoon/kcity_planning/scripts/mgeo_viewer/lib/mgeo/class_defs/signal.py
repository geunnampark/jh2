#!/usr/bin/env python
# -*- coding: utf-8 -*-

from .base_point import BasePoint
import sys
import numpy as np


class Signal(BasePoint):
    def __init__(self, _id=None):
        super(Signal, self).__init__(_id)
        # if sys.version_info[0] > 2:
        #     super(Signal, self).__init__(_id)
        # else:
        #     BasePoint.__init__(_id)
   
        # 참조를 위한 key
        self.link_id_list = []
        self.road_id = None

        # 참조를 저장하는 변수
        # NOTE: 참조를 위한 key가 있어도 참조할 인스턴스가 존재할 수 있다
        #       >> 이 경우 len(self.link_id_list) != len(self.link_list)이다
        self.link_list = list()
        
        # 기타 속성 정보
        self.type = None
        self.sub_type = None
        self.dynamic = None
        self.orientation = None
        self.value = 0
        self.country = None # 나라 이름, 필수 값은 아님
        self.z_offset = None # z offset from track level to bottom edge of the signal
        self.height = None
        self.width = None

    def set_size(self):
        # 사이즈 단위 : m   
        # 
        # 코드값 1 : 주의표지
        # 설치높이(cm) : 100 ~ 210 
        if self.type == '1' :
            self.z_offset = 2.1
            self.height = 0.73
            self.width = 0.9
        # 코드값 2 : 규제표지
        # 설치높이(cm) : 100 ~ 210 cm
        elif self.type == '2' :
            self.z_offset = 2.1
            self.height = 0.6
            self.width = 0.6
        # 코드값 3 : 지시표지
        # 설치높이(cm) : 100 ~ 
        elif self.type == '3' :
            self.z_offset = 2.1
            self.height = 0.6
            self.width = 0.6
        # 코드값 4 : 보조표지
        # 설치높이(cm) : 100 ~ 
        elif self.type == '4' :
            self.z_offset = 2.1
            self.height = 0.4
            self.width = 0.4
        # 코드값 5 : 신호등
        # 측주식의 횡형, 현수식, 문형식 등은 신호등면의 하단이 차도의 노면으로부터 수직으로 450cm 이상의 높이에 위치하는 것을 원칙
        # 중앙주식, 측주식의 종형은 보도, 중앙섬 및 중앙분리대의 노면 혹은 상면에서 신호등 하단까지의 수직 높이가 250cm - 350cm 에 위치하는 것을 원칙
        elif self.type == '5' :
            # 코드값 502 : 횡형삼색등
            if self.sub_type == '502' :
                self.z_offset = 4.5
                self.height = 0.355
                self.width = 1.065
            # 코드값 505 : 횡형사색등A
            elif self.sub_type == '505' :
                self.z_offset = 4.5
                self.height = 0.355
                self.width = 1.42
            # 코드값 508 : 보행등
            elif self.sub_type == '508' :
                self.z_offset = 3.5
                self.height = 0.71
                self.width = 0.355
            # 코드값 510 : 종형삼색등
            elif self.sub_type == '510' :
                self.z_offset = 4.5
                self.height = 1.065
                self.width = 0.355
    
    def add_link_ref(self, link):
        if self.dynamic is None:
            raise BaseException('self.dynamic must be set first!')

        if link not in self.link_list:
            self.link_list.append(link)

        if self.dynamic:
            if self not in link.traffic_lights:
                link.traffic_lights.append(self)
        else:
            if self not in link.traffic_signs:
                link.traffic_signs.append(self)


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
                    fontsize=12)
            return

        """별도 style이 지정되어 있지 않을 경우, 아래의 디폴트 스타일로 그린다"""
        # 이는 list of matplotlib.lines.Line2D 인스턴스를 반환
        if self.dynamic:
            self.plotted_objs_point = axes.plot(self.point[0], self.point[1],
                markersize=7,
                marker='o',
                color='orange')
        else:
            self.plotted_objs_point = axes.plot(self.point[0], self.point[1],
                markersize=7,
                marker='o',
                color='teal')

        # matplotlib.text.Text 인스턴스를 반환 
        self.plotted_objs_text = axes.text(self.point[0], self.point[1]+0.1,
            self.idx,
            fontsize=10)
    
    @staticmethod
    def to_dict(obj):
        """json 파일등으로 저장할 수 있는 dict 데이터로 변경한다"""

        dict_data = {
            'idx': obj.idx,
            'link_id_list': obj.link_id_list,
            'road_id' : obj.road_id,
            'type': obj.type,
            'sub_type': obj.sub_type,
            'dynamic': obj.dynamic,
            'orientation': obj.orientation,
            'point': obj.point.tolist(),
            'country': obj.country,
            'z_offset': obj.z_offset,
            'height': obj.height,
            'width': obj.width
        }
        return dict_data

    @staticmethod
    def from_dict(dict_data, link_set=None):
        """json 파일등으로부터 읽은 dict 데이터에서 Signal 인스턴스를 생성한다"""

        """STEP #1 파일 내 정보 읽기"""
        # 필수 정보
        idx = dict_data['idx']
        point = dict_data['point']

        # 연결된 객체 참조용 정보
        link_id_list = dict_data['link_id_list']
        road_id = dict_data['road_id']
        
        # 기타 속성 정보
        sign_type = dict_data['type'] # type은 지정된 함수명이므로 혼란을 피하기 위해 sign_type으로
        sign_subtype = dict_data['sub_type']
        dynamic = dict_data['dynamic']
        orientation = dict_data['orientation']
        
        country = dict_data['country']
        z_offset = dict_data['z_offset']
        height = dict_data['height']
        width = dict_data['width']

        """STEP #2 인스턴스 생성"""
        # 필수 정보
        obj = Signal(idx)
        obj.point = np.array(point)

        # 연결된 객체 참조용 정보
        obj.link_id_list = link_id_list
        obj.road_id = road_id

        # 기타 속성 정보
        obj.type = sign_type
        obj.sub_type = sign_subtype
        obj.dynamic = dynamic
        obj.orientation = orientation
        obj.country = country
        obj.z_offset = z_offset
        obj.height = height
        obj.width = width

        """STEP #3 인스턴스 메소드 호출해서 설정할 값들 설정하기"""
        if link_set is not None:
            for link_id in link_id_list:
                if link_id in link_set.lines.keys():
                    link = link_set.lines[link_id]
                    obj.add_link_ref(link)

        return obj
        