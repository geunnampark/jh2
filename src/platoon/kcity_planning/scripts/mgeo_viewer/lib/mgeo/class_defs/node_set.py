#!/usr/bin/env python
# -*- coding: utf-8 -*-

import matplotlib.pyplot as plt
import numpy as np 
from .node import Node

class KeyMaker():
    def __init__(self, prefix='N'):
        self.prefix = prefix
        self.num = -1
    
    def get_new(self):
        self.num += 1
        if self.prefix == '':
            # prefix가 0이면, 그냥 숫자로 반환
            return self.num
        else:
            return '{}{}'.format(self.prefix, self.num)
        

class NodeSet():
    def __init__(self):
        self.nodes = dict()
        self.key_maker = KeyMaker()

    def append_node(self, node_obj, create_new_key=False):
        if create_new_key:
            node_obj.idx = self.key_maker.get_new()
        self.nodes[node_obj.idx] = node_obj

    def remove_node(self, node_obj):
        self.nodes.pop(node_obj.idx)

    def reorganize(self):
        '''
        아무것도 수행하지 않는다. 
        BaseClass인 NodeSet에서는 내부의 nodes가 list라 reorganize가 필요하지만, 
        내부의 nodes를 dict로 저장하는 본 클래스에서는 이 동작이 필요없다
        '''
        return 

    def delete_dangling_nodes(self):
        will_be_removed = []

        for key in self.nodes:
            node = self.nodes[key]
            if len(node.to_links) == 0 and len(node.from_links) == 0:
                will_be_removed.append(key)

        for key in will_be_removed:
            self.nodes.pop(key)

        return

    def draw_plot(self, axes):
        for idx, node in self.nodes.items():
            node.draw_plot(axes)
            
    def erase_plot(self):
        for idx, node in self.nodes.items():
            node.erase_plot()