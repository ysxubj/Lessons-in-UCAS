# -*- coding: utf-8 -*-
"""
Created on Tue Mar 14 15:32:30 2017

@author: yansenxu

lesson 4 numpy
"""
#%%
import os
os.getcwd()#查看环境位置
import numpy as np#导入numpy库,简写为np
np.array #查看说明
c=np.array([[1,2,3,4],[5,6,7,8],[7,8,9,0]])
a=np.array([1,2,3,4])
b=np.array((1,2,3,4))
a.dtype
a.shape
b.shape
c.shape=4,3#修改为4行3列数组
c.shape=2,-1#-1表示为自行计算,定义好了两行
d=a.reshape(2,2)#改变结构,d位2×2,a和d现在共享内存数据，修改一个数据就会发生变化
a[21]=109;#a[1]修改为100
d#d也发生了修改
np.array([1,2,3,4.4],dtype=np.float)#浮点数显示
np.array([1,2,3,4.4],dtype=np.complex)#复数显示
np.arange(0,1,0.1)#数列
number=np.linspace(1,5,10)#1到5生成10个点
number
np.linspace(0,1,10,endpoint=False)#不包括终点1
list(np.logspace(0,2,20))
np.empty((2,3),np.int)#空矩阵
np.zeros((4,3))#0矩阵
#%%
#np.fromfunction
def func(i):
    return i%4+1
np.fromfunction(func,(10,))#第一个为函数，第二个为数组大小
def func2(i,j):
    return (i+1)*(j+1)
np.fromfunction(func2,(9,9))#(9,9)为一个9×9的矩阵
#%%
a=np.arange(10)
a[3:5]
a[2:4]=100,101
a[1:-1:2]
b=a[np.array([1,3,4,5])]#不共享空间
b=[[1,2,3,4]]#按照下标存取
#%%
#b布尔数组存储
x=np.arange(5,0,-1)
x
x[np.array([True,False,True,True,False])]#生成一个新的变量，True取出来
x[[True,False,True,True,False]]#list,T为1好位置，F为0号位置
#%%
#布尔数组的生成
x=np.random.rand(10)#生一个10个，0-1的随机数的数组
x>0.5#生成一个布尔数组
x[x>0.5]#
#%%
#多维数组的创建与存储
a=np.arange(0,60,10).reshape(-1,1)+np.arange(0,6)#列和行向量相加成为一个广播
a[(2,3,4,5),(1,2,3,4)]#矩阵索引
a[3:,[0,2,5]]
#%%
#结构数组
persontype=np.dtype({'names':['name','age','weight'],'formats':['S32','i','f']})#定义一个类型
a = np.array([("Zhang",32,75.5),("Wang",24,65.2)],dtype=persontype)#定义一个数组
c=a[0]
c['name']='li'
b=a['age']
b
b[0]=100
b
#%%
#ufunc运算
x=np.linspace(0.2*np.pi,10)#10点
y=np.sin(x,x)#计算的x覆盖原来的x
id(y)#查看地址
#%%
#比较numpy和python数据库的运算速度比较
import time#时间库
import math#数学库
x=[i*0.001 for i in range(10000000)]
start=time.clock()
for i,t in enumerate(x):
    x[i]=math.sin(t)
print('math.sin',time.clock()-start)
#numpy计算时间
x = [i * 0.001 for i in range(1000000)]
x = np.array(x)
start = time.clock()
np.sin(x,x)
print('numpy.sin:', time.clock()-start)
#%%
#四则运算
a=np.arange(0,4)
b=np.arange(1,5)
np.add(a,b)#相加
np.add(a,b,a)#将a覆盖
a
#%%
x=np.arange(5)
np.true_divide(x,4)#精确除
x/4
x//4

#%%
a=np.arange(5)
b=np.arange(4,-1,-1)
a==b
a>b
np.logical_or(a==b,a>b)#a==b or a>b
#%%
def triangle_wave(x,c,c0,hc):
    x=x-int(x)#保证x在0~1之间
    if x>=c:
        r=0.0
    elif x<c0:
        r=x/c0*hc
    else:
        r=(c-x)/(c-c0)*hc
        return r
#定义一个函数
x=np.linspace(0,2,1000)#生成一个数组
y1=np.array([triangle_wave(t,0.6,0.4,1.0) for t in x])#将每个x点带入进去
#ufunc函数的使用
triangle_ufunc1=np.frompyfunc(triangle_wave,4,1)#定义为一个新的函数类型
y2=triangle_ufunc1(x,0.6,0.4,1.0)
triangle_ufunc2=np.frompyfunc(lambda x: triangle_wave(x,0.6,0.4,1.0),1,1)
y3 = triangle_ufunc2(x)
#%%
#shape use
a=np.arange(0,60,10).reshape(-1,1)#one col
a.shape
b=np.arange(0,5)#one row
b.shape
c=a+b#利用广播进行了操作
c.shape
a.ndim
b.ndim   
b.shape=1,5
b
#%%
#ogrid对象
x,y=np.ogrid[0:5,0:5]
x
y
x,y=np.ogrid[0:1:4j,0:1:3j]#j表示三个点
#%%
from mayavi import mlab
x,y=np.ogrid[-2:2:20j,-2:2:20j]
z=x*np.exp(-x**2-y**2)
pl=mlab.surf(x,y,z,warp_scale="auto")#绘制立体图，
mlab.axes(xlabel='x',ylabel='y',zlabel='z')
mlab.outline(pl)
mlab.show
#%%
#ufunc函数的方法
np.add.reduce([1,2,3])#对数组相加
np.add.reduce([[1,2,3],[4,5,6]],axis=1)#按行相加
np.add.reduce([[1,2,3],[4,5,6]],axis=0)#按列相加
np.add.accumulate([1,2,3])#累加
np.add.accumulate([[1,2,3,4],[1,2,3,4]],axis=1)
a=np.array([1,2,3,4,5])
result=np.add.reduceat(a,indices=[0,1,0,2,0,3,0])
result
#%%
#矩阵运算
A=np.array([[1,2,3],[3,4,5],[4,5,6]])
A.T
A.T.T
c = np.array([[[ 0, 1, 2], [ 10, 12, 13]],[[100,101,102],[110,112,113]]])
#%%
a=np.random.rand(10,10)
b=np.random.rand(10)
x=np.linalg.solve(a,b)
x
#%%
np.mat([[1,2],[3,4]])








