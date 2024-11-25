#!/usr/bin/env python
# -*- coding: utf-8 -*-

import numpy as np
from .junction import Junction

class JunctionSet:
    def __init__(self):
        self.junctions = dict()

    def append_junction(self, junction):
        self.junctions[junction.idx] = junction