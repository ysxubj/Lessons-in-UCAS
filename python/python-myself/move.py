# -*- coding: utf-8 -*-
"""
Created on Thu Mar  9 19:54:57 2017

@author: yansenxu
"""

import math

def move(x,y,step,angle=0):
    nx=x+step*math.cos(angle)
    ny=y+step*math.sin(angle)
    return nx,ny
