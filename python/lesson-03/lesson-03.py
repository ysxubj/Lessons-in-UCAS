# -*- coding: utf-8 -*-
#%%
"""
Spyder Editor

This is a temporary script file.
"""
#%%
#字典
tel={'jack':4098, 'shy':4139}
tel['green']=4127#字典内容增加
tel['jack']
tel.get('jack')#查找
del tel['shy']#删除
tel.keys()#所有关键字
tel.values()#字典中所有值
tel.items()
#%%
tel1 = {'gree':5127, 'pang':6008}
tel={'gree': 4127, 'irv': 4127, 'jack': 4098}
tel.update(tel1)#合并两个字典
tel
tel.pop('gree')#删除green的值和key
tel
#%%
#流程控制语句
n=10
if n>2:
    print("hello")
elif n>8:
    print("e")
else:
    print('e')   
#%%
number=23
guess=34
if guess == number:
    print ('Congratulations, you guessed it.') 
    # New block starts here
    print ("(but you do not win any prizes!)") # New block ends here
elif guess < number:
    print ('No, it is a little higher than that') # Another block
    # You can do whatever you want in a block ...
else:
    print ('No, it is a little lower than that')
    # you must have guess > number to reach here
print ('Done')
# This last statement is always executed, after the if statement is executed
#%%
choice='ham'
dic={'spam': 1.25, 'ham': 1.99,'eggs': 0.99, 'bacon': 1.10}
print (dic[choice])
#%%
a='t'if'spam'else'f'
a#三元表达式
#%%
a=0
b=10
while a<b:
    print(a)
    a=a+1
#%%
while True:
    s =input('Enter something : ')
    if s == 'quit':
        break
    if len(s) < 3:
        print ('Input is of sufficient length')
        continue
    # Do other kinds of processing here...
#%%
sum=0
for i in [1,2,3,4,5,6,7]:
    sum=sum+i
print(sum)
#%%
#python函数
def add(x):
    x=x+1
    return x
add(32)

def myadd():
    sum=1+1
    return sum
a=myadd()
print(a)
#%%
def f(arg1,arg2=2,arg3=3):
             print ('arg1 = ', arg1)
             print ('arg2 = ', arg2)
             print ('arg3 = ', arg3)
f(10,arg3=10)
#%%
def printinfo(arg1,*vartuple):#用于传递多个参数
   print("打印任何传入的参数")
   print (arg1)
   for var in vartuple:
       print(var)
       return
 #%%
x=3
y=[1,2]
def test(a,b):
       a=5
       b[0]=4
       print (a,b)
#%%
sum = lambda arg1, arg2: arg1 + arg2;
print ("Value of total :",sum(10,20))
#%%
#全局变量的定语
globalInt=9
def myAdd():
    localInt=3
    global gi
    gi=7
    return globalInt+localInt
print(myAdd())
print(globalInt)
print(gi)
#%%
def add2(a,b):
    "两个数相加"
    return a+b
#help add2 看到自己编写的注释说明
#%%
abs(-100)#取绝对值
abs(2+8j)#复数的模
a='123'
callable(a)#册数对象是否能调用
isinstance(a,str)#测试a是否为str
#%%
def displayNumType(num): 
    print (num, 'is') 
    if isinstance(num, (int, float, complex)): 
        print ('a number of type:', type(num).__name__) 
    else: print ('not a number at all!!!')

displayNumType(-69)
displayNumType(9999999999999999999999999) 
displayNumType(565.8) 
displayNumType(-344.3+34.4j) 
displayNumType('xxx')
#%%
divmod(10,3)#返回商和余数
pow(2,1,3)
len('rewrwe')
round(321.45321)
a=range(12)


