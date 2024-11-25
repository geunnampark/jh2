#!/usr/bin/env python
# -*- coding: utf-8 -*-

import numpy as np 

class Junction:
    def __init__(self, _id=None):
        self.idx = _id
        self.jc_nodes = list()
        self.connecting_road = dict()

    def add_jc_node(self, node):
        if node in self.jc_nodes:
            print('[WARN] Node passed (id={}) already exists in the current junction (id={})'.format(node.idx, self.idx))
        else:
            self.jc_nodes.append(node)

        if self in node.junctions:
            print('[WARN] Current junction (id={}) alreay exists in the node (id={})'.format(self.idx, node.idx))
        else:
            node.junctions.append(self)

    def get_jc_nodes(self):
        return self.jc_nodes