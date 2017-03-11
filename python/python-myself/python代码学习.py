#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os  # 导入标准库
os.getcwd()  # 查看当前工作路径
os.chdir('D:\GitHub\Lessons-in-UCAS\python')
os.getcwd()
i = 5
print (i)
name=input()
print (name)
print("I\'m \"OK\"")
print(
'''ifan
fds
fdsa''')
age=23
if age>19:
    print(27)
else:
    print(43)
print(123)
print(456.789)
print('hello world')
print('hello,\'world\'')
print(r'hello, "barae"')
print(r'''hef
fdsf''')#换行输出
print ('Hello, %s' % 'world')

print("%2d-%02d"%(2,3))
s1=72
s2=85
r=((s2-s1)/5)*100
#%%
print('%f.1 %%'%r)
classname=['M','FD','S']
print(classname)
classname=('fds','fsa','fdsa')
print(classname)
classname[-1]
#%%
classtuple=('ysx','ucas','beijing')
classlist=['ysx','ucas','beijing']
classlist.append('huairou')
classlist.insert(1,"321")
classlist[1]
#%%
classlist.pop(1)
classlist
s = ['python', 'java', ['asp', 'php'], 'scheme']
#%%
L = [
    ['Apple', 'Google', 'Microsoft'],
    ['Java', 'Python', 'Ruby', 'PHP'],
    ['Adam', 'Bart', 'Lisa']
]
len(L)
print(L[0][0])
print(L[1][1])
print(L[2][2])
#%%
age=20
if age>2:
    print("your age is",age)
else:
    print("too young too simple")
#%%
if age>3:
    print("hello")
elif age>4:
    print("what the fuck")
else:
    print("too stupid")
#%%
birth=input("what/'s your birthday")
birth=int(birth)
if birth>20:
    print('yellow book')
else:
    print('too young too navie')
#%%
height=1.75
weight=80.5
BMI=weight/height
if BMI<18.5:
    print('过轻')
elif BMI<25:
    print('正常')
elif BMI<28:
    print('过重')
elif BMI<32:
    print('肥胖')
else:
    print('严重肥胖')
    #%%
#for循环
for classlist in classlist:
    print(classlist)
#%%数组循环
import numpy
num=numpy.linspace(1,32,32)
for num in num:
    print(num)
#%%
#for循环
sum=0
for i in range(101):
    sum=sum+i
print(sum)
#%%
#while循环
sum=0
n=100
while n>0:
    sum=sum+n
    n=n-1
print(sum)
#%%
L=['Bart','Lisa','Adam']
for L in L:
    print(L)
#%%
i=100
while i>2:
    if i<20:
        break#提前结束循环
    print("end")
    i=i+10
print(i)
#%%
n=0
while n<10:
    n=n+1
    if n % 2==0:
        continue
    print(n)
#%%
names = ['Michael', 'Bob', 'Tracy']
scores = [95, 75, 85]
d={'Michael':95,'Bob': 75,'Tracy': 85}#dict的定义
d["Bob"]=10000
#%%
#函数的调用与编写
abs(-100)#绝对值函数
max(1,23,4,5,6,34322,4,32,1,3212,32)
min(1,23,412,41,2321,-123)
#数据类型转换函数
int(-213201.32)
float(321)
s=str(1.32)
type(s)#查看数据类型
bool(1)
#练习
print(hex(255))
#%%定义函数
def my_abs(x):
    if x>0:
        print(x)
    else:
        print(-x)
my_abs(-3214321)
my_abs(213)
import os 
os.getcwd()
os.chdir("D:\\GitHub\\Lessons-in-UCAS\\python\\python-myself")
os.getcwd()
import my_abs
my_abs.my_abs(21312)
x=21
if x>3:
    pass#空占位符，表示什么也不干
import move
step=move.move(12,23,4,5)
#%%
def number(num):#可以传递list and tuple
    result=0
    for x in num:
        result=result+x^2
    return result
number(*(1,2,3,5,4))#添加*可以传递元组数据
#%%
def person(name,age,**kw):
    print('name:',name,'age:',age,'other:',kw)
person('xuyansen',35,city='beijing')
#%%
def fact(n):
    result=1
    for x in list(range(1,n+1)):
        result=x*result
    return result
#%%
#递归函数
def fact(n):
    if n==1:
        return 1
    return n * fact(n - 1)

    
   








