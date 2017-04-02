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
#%%
import numpy as np
x=np.arange(10)
np.where(x<5,9-x,x)
np.where(x>6,2*x,0)
#%%
def triangle_wave(x,c,c0,hc):
    x=x-x.astype(np.int)
    return np.where(x>=0,0,np.where(x<c0,x/c0*hc,(c-x)/(c-c0)*hc))
#%%
a=np.random.randint(0,10,10)
np.unique(a)
x,idx=np.unique(a,return_index=True)
x
idx
#%%
a=np.random.randint(0,10,10)
np.bincount(a)
#%%
x=np.array([0,1,2,2,1,1,0])
w=np.array([0.1,0.3,0.2,0.4,0.5,0.8,1.2])
np.bincount(x,w)
np.bincount(x,w)/np.bincount(x)
#%%
a=np.random.rand(100)
np.histogram(a,bins=5,range=(0,1))

np.histogram(a,bins=5,range=(0,1),normed=True)
#%%
d=np.loadtxt('height.csv',delimiter=',')
np.min(d[:,0])
np.max(d[:,0])
sums=np.histogram(d[:,0],bins=range(7,21),range=(7,20),weights=d[:,1])[0]
cnts=np.histogram(d[:,0],bins=range(7,21),range=(7,20))
#%%
#解线性方程组
a=np.random.rand(10,10)
b=np.random.rand(10)
x=np.linalg.solve(a,b)#求解线性方程组
np.sum(np.abs(np.dot(a,x)-b))
#solve解线性方程组
x=np.array([0,1,2,3])
y=np.array([-1,0.2,0.9,2.1])
A=np.vstack([x,np.ones(len(x))]).T
m,c=np.linalg.lstsq(A,y)[0]
print(m,c)
plt.plot(x, y, 'o', label='Original data', markersize=10) 
plt.plot(x, m*x + c, 'r', label='Fitted line') 
plt.legend() 
plt.show()
#%%
#线性代数模块
A=np.mat("0 1 2;1 0 3 ;4 -3 8")
print('A\n',A)
inverse=np.linalg.inv(A)
print('inverse of A\n',inverse)
B=A*inverse
print('test B\n',B)
#%%
#解线性方程组
A = np.mat("1 -2 1;0 2 -8;-4 5 9")
print("A\n", A)
b = np.array([0, 8, -9])
print("b\n", b)
x = np.linalg.solve(A, b)
print("Solution", x)
#%%
#特征向量
A=np.mat('3 -2;1 0')
eigenvalues=np.linalg.eigvals(A)
eigenvectors = np.linalg.eig(A)
for i in range(len(eigenvalues)):
   print("Left", np.dot(A, eigenvectors[:,i]))
   print("Right", eigenvalues[i] * eigenvectors[:,i])
#%%
#奇异值分解
A=np.mat('4 11 14;8 7 -2')
u,sigma,v=np.linalg.svd(A,full_matrices=False)
from numpy import linalg
#求秩
linalg.det(A)
#求行列式
#%%
#傅里叶变化
import numpy as np
from matplotlib.pyplot import plot,show
wave=np.cos(x)#余弦波
f=transformed=np.fft.fft(wave)
np.abs((f)-wave)<10**-9
#%%
import numpy as np
from matplotlib.pyplot import plot, show
cash=np.zero(10000)
cash[0]=1000
outcome=np.random.binomial(9,0.5,size=len(cash))
for i in range(1,len(cash)):
    if outcome[i]<5:
        cash[i]=cash[i-1]-1
    elif outcome[i]<10:
        cash[i]=cash[i-1]+1
    else:
        raise AssertionError('Unexpected outcome'+outcome)
print(outcome.min(), outcome.max())
#使用Matplotlib绘制cash数组：
plot(np.arange(len(cash)), cash)
show()
#%%
#超几何分布
import numpy as np
from matplotlib.pyplot import plot, show
points=np.zeros(100)#100个随机球
outcomes=np.random.hypergeometric(25,1,3,size=len(points))
for i in range(len(points)):
    if outcomes[i] == 3:
        points[i] = points[i - 1] + 1
    elif outcomes[i] == 2:
        points[i] = points[i - 1] - 6
    else:
        print(outcomes[i])

plot(np.arange(len(points)), points)
show()
#%%
#正态分布
import numpy as np
import matplotlib.pyplot as plt
#使用NumPy random模块中的normal函数产生指定数量的随机数。
N=10000
normal_values = np.random.normal(size=N)
dummy, bins, dummy = plt.hist(normal_values, np.sqrt(N), normed=True, lw=1)
sigma = 1
mu = 0
plt.plot(bins, 1/(sigma * np.sqrt(2 * np.pi)) * np.exp( - (bins -mu)**2 / (2 *
sigma**2) ),lw=2)
plt.show()
#%%
#对数正态分布
import numpy as np
import matplotlib.pyplot as plt
N=10000
lognormal_value=np.random.logistic(size=N)
dummy,bins,dummy=plt.hist(lognormal_value,np.sqrt(N),normed=True,lw=1)
sigma=1
mu=0
x = np.linspace(min(bins), max(bins), len(bins))
pdf = np.exp(-(np.log(x) - mu)**2 / (2 * sigma**2))/ (x * sigma * np.sqrt(2 * np.pi))#概率密度函数
plt.plot(x, pdf,lw=3)
plt.show()
#%%
#直方图
import numpy
import pylab 
# Build a vector of 10000 normal deviates with variance 0.5^2 and mean 2 
mu, sigma = 2, 0.5
v = numpy.random.normal(mu,sigma,10000) 
# Plot a normalized histogram with 50 bins
pylab.hist(v, bins=50, normed=1) 
# matplotlib version (plot) 
pylab.show()
 # Compute the histogram with numpy and then plot it 
(n, bins) = numpy.histogram(v, bins=50, normed=True) 
# NumPy version (no plot)
pylab.plot(.5*(bins[1:]+bins[:-1]), n)
pylab.show()


        









