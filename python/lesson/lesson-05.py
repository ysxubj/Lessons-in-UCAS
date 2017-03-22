# -*- coding: utf-8 -*-
"""
Created on Tue Mar 14 15:32:30 2017

@author: yansenxu

lesson 5 numpy
"""
#%%
#求和、平均值、方差
import numpy as np
a=np.random.randint(0,10,size=(4,5))
a
np.sum(a)
np.sum(a,axis=1)
np.sum(a,axis=0)
c=np.array([1,2,3,4])
np.sum(a,axis=1,out=c)
c
#%%
#精度改变
b =np.ones(1000000, dtype=np.float32) * 1.1
np.sum(b,dtype=np.double)
#%%
#求平均值
a
np.mean(a,axis=1)
np.mean(a,axis=1,dtype=np.double)
#%%
#最值和排序
np.min(a)
np.argmax(a)
a.ravel()[4] 
np.unravel_index(2, a.shape)
idx=np.argmax(a,axis=1)
a[arange(a.shape[0]),idx]
#%%
#排序
np.sort(a)#按行排序
b=np.sort(a)
idx=np.argsort(a)
np.median(a,axis=0)#求中值
#%%
#多项式函数
a=np.array([1.0,0,-2,1])
p=np.poly1d(a)#处理为三次多项式
p(np.linspace(0,1,5))#带入多项式计算
print(np.poly1d(p))#打印
np.sqrt(a)#系数的平方
#多项式运算
p+[-2,1]
p.integ()#求积分
p.deriv()#求微分
p.integ().deriv()==p#先求积分再求导
r=np.roots(p)#求根
p(r)#将根代入原方程
#%%
#多项式拟合
import pylab as pl#绘图库导入
pl.figure(figsize=(8,4))
x=np.linspace(-np.pi/2,np.pi/2,1000)
y=np.sin(x)
for deg in [3,5,7]:
    a=np.polyfit(x,y,deg)
    error=np.abs(np.polyval(a,x)-y)#polyval将x代入a中去
    print ("poly %d:" %deg,a)
    print ("max error of order %d:" % deg , np.max(error))
    pl.semilogy(x, error, label=u"%d阶多项式的误差" % deg)
pl.legend(loc=3)
pl.axis('tight')
pl.show()
    







