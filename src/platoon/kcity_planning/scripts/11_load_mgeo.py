#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys

current_path = os.path.dirname(os.path.realpath(__file__))
sys.path.append(current_path) 
sys.path.append(current_path + '/../') 


from mgeo_viewer.lib.mgeo.class_defs import *
import mgeo_viewer.lib.mgeo.class_defs.mgeo_planner_map 





if __name__ == u'__main__':
    print(current_path)
    load_path = os.path.normpath(os.path.join(current_path, 'mgeo_viewer/kcity'))
    mgeo_planner_map = MGeoPlannerMap.create_instance_from_json(load_path)
    
    node_set = mgeo_planner_map.node_set
    link_set = mgeo_planner_map.link_set
    
    print('# of nodes: ', len(node_set.nodes))
    print('# of links: ', len(link_set.lines))

    start_node_idx = 'A119BS010700'
    end_node_idx = 'A119BS010314'

    while True :
        pass







    

    

    
    
