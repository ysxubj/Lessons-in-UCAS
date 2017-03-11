# -*- coding: utf-8 -*-
"""
Created on Thu Mar  9 19:35:57 2017

@author: yansenxu
"""
def my_abs(x):
    if not isinstance(x,(int,float)):
        raise TypeError('yansen xu')
    if x>0:
        return x
    else:
        return -x