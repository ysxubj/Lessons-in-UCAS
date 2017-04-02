# -*- coding: utf-8 -*-
"""
Created on Tue Mar 14 15:32:30 2017

@author: yansenxu

lesson 5 numpy
"""
#%%
import numpy as np
from scipy import constants as c
c.c#真空的光速
c.h#普朗特常数
c.physical_constants['electron mass']
c.mile
#%%
#scipy中的special模块的调用
from scipy import special as s
s.gamma(4)#调用伽马函数
s.gamma(0.5)
s.gamma(1+2j)
#%%
#线性代数
import numpy as np
from scipy import linalg
M,N=500,50
A=np.random.rand(M,M)
B=np.random.rand(M,N)
X1=linalg.solve(A,B)
X2=np.dot(linalg.inv(A),B)
np.allclose(X1,X2)
%timeit(linalg.solve(A,B))
%timeit(np.dot(linalg.inv(A),B))
luf=linalg.lu_factor(A)
x3=linalg.lu_solve(luf,B)
np.allclose(luf,x3)
#%%
#线性代数
M,N=1000,100
np.random.seed(0)
A=np.random.rand(M,M)
B=np.random.rand(M,N)
Ai = linalg.inv(A)
luf = linalg.lu_factor(A)
%timeit(linalg.inv(A))
%timeit (linalg.lu_factor(A))
%timeit (np.dot(Ai, B))
%timeit (linalg.lu_solve(luf, B))
#%%
#优化
from scipy.optimize import leastsq
X = np.array([ 8.19, 2.72, 6.39, 8.71, 4.7 , 2.66, 3.78])
Y = np.array([ 7.01, 2.78, 6.47, 6.71, 4.1 , 4.23, 4.05])
def residuals(p):
    k,b=p
    return Y-(k*x+b)
r=leastsq(residuals,[1,0])
#%%
#最小二乘拟合
import numpy as  np
from scipy.optimize import leastsq
def func(x,p):
    A,k,theta =p
    return A*np.sin(2*np.pi*k*x+theta)#定义函数
def residuals(p,y,x):
    return y-func(x,p)#定义残差
x=np.linspace(0,2*np.pi,100)#总共100个点
A,k,theta=10,0.34,np.pi\6#真实参数
y0=func(x,[A,k,theta])#真实数据
np.random.seed(0)
y1=y0+2*np.random.randn(len(x))#对真值加上了一些噪声
p0=[7,0.4,0]#初始值
plsq = leastsq(residuals, p0, args=(y1, x))
#定义残差
print (u"真实参数:", [A, k, theta])
print (u"拟合参数", plsq[0]) #实验数据拟合后的参数

import pylab as pl
pl.plot(x, y0, label=u"真实数据")
pl.plot(x, y1,"o", label=u"带噪声的实验数据")
pl.plot(x, func(x, plsq[0]), label=u"拟合数据")
pl.legend()
pl.show()
#%%
def func2(x,A,k,theta):
    return A*np.sin(2*np.pi*k*x+theta
a,b=scipy.optimize.curve_fit(func2,x,y1,p0=p0)
#%%
import scipy.optimize as opt
import numpy as np
import sys
points=[]
def f(p):
    x,y=p
    z=(1-x)**2+100*(y-x**2)**2
    points.append((x,y,z))#对列表加项
    return z
def fprime(p):
    x, y = p
    dx = -2 + 2*x - 400*x*(y - x**2)
    dy = 200*y - 200*x**2
	return np.array([dx,dy])
init_point =(-2,-2) 
try:
	method = sys.argv[1]
except:
	method = “fmin_bfgs” # method = "fmin” 
fmin_func = opt.__dict__[method] #>>>opt.fmin_l_bfgs_b?
if method in ["fmin", "fmin_powell"]:
	result = fmin_func(f, init_point) #参数为目标函数和初始值
elif method in ["fmin_cg", "fmin_bfgs", "fmin_l_bfgs_b", "fmin_tnc"]:
	result = fmin_func(f, init_point, fprime) #参数为目标函数、初始值和导函数
elif method in ["fmin_cobyla"]:
	result = fmin_func(f, init_point, [])
else:
	print "fmin function not found"
	sys.exit(0)
#%%
from scipy.optimize import fsolve
from math import sin

def f(x): 
	x0, x1, x2 = x.tolist() 
	return [
		5*x1+3,
		4*x0*x0 - 2*sin(x1*x2),
		x1*x2 - 1.5
	]

# f计算方程组的误差，[1,1,1]是未知数的初始值
result = fsolve(f, [1,1,1]) 
print (result)
print (f(result))
#%%
#插值
import numpy as np
from scipy import interpolate
import pylab as pl
x=np.linspace(0,10,11)
y=np.sin(x)
xnew=np.linspace(0,10,101)
pl.plot(x,y,'ro')
for kind in ['nearrest','zero','slinear','quadratic']:
    f=interpolate.interp1d(x,y,kind=kind)
    ynew=f(xnew)
    pl.plot(xnew,ynew,label=str(kind))
    pl.legend(loc='lower right')
    pl.show()
#%%















