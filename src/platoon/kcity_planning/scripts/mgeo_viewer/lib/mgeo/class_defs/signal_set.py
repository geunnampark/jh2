#!/usr/bin/env python
# -*- coding: utf-8 -*-

import matplotlib.pyplot as plt
import numpy as np 
from .signal import Signal

class KeyMaker():
    def __init__(self, prefix='S'):
        self.prefix = prefix
        self.num = -1
    
    def get_new(self):
        self.num += 1
        if self.prefix == '':
            # prefix가 0이면, 그냥 숫자로 반환
            return self.num
        else:
            return '{}{}'.format(self.prefix, self.num)

class SignalSet():
    def __init__(self):
        self.signals = dict()
        self.key_maker = KeyMaker()

    def append_signal(self, signal_obj, create_new_key=False):
        if create_new_key:
            signal_obj.idx = self.key_maker.get_new()

        self.signals[signal_obj.idx] = signal_obj

    def remove_signal(self, signal_obj):
        self.signals.pop(signal_obj.idx)

    def draw_plot(self, axes):
        for idx, signal in self.signals.items():
            signal.draw_plot(axes)
            
    def erase_plot(self):
        for idx, signal in self.signals.items():
            signal.erase_plot()
