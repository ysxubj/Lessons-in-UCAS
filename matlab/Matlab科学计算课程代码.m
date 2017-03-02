%% 
%第一次课程
%%
H=sym(hilb(20));%将矩阵转换为符号
det(H)
%%
det(hilb(20))
%% 
%计算速度
tic;det(hilb(20));toc
%%
%基本操作
cd
%查询和更改工作路劲
demo%显示示例
lookfor%查找相关提示的函数名字
who%环境内的变量名
vpa(pi,300)%对符合求数值解，近似解
B=[1,2,3;4,5,6;7,8,9;];%矩阵表示
[0:0.4:pi,pi]%将pi作为断点加入
B(1:2:end,:)%矩阵信息提取
[i,j]=find(B>2),[i,j]%矩阵运算,大于等于2的元素
all(B>2)%行/列均大于等于2的函数
%%
%多项式化简
syms s;%符号化s
P=(s+2)/2+s+2+3+2*23
[a,m]=simples(P)%化简符号表达式
%%
syms a b c d t;
f=cos(a*t)+b+sin(c*t)*sin(d*t);
f1=subss(f,{a,b,c,d,t},{1,2,3,4,5})

%%
%四则运算
A=hilb(3)
[n,d]=rat(A)%
format long %定义为长型
m=10832;n=1232;[gcd(m,n);lcm(m,n)]%最小公约数，最大公约数
%%
A=1:10;isprime(A)%质数
A=1:100;A(isprime(A))%返回质数
%%
%流程控制
s=0l;
for i=1:100
    s=s+i;
end;
s=0;
i=1;
while(i<100)
    s=s+i;
    i+i+1;
end;
sum(100);
%%
s=0;
m=0;
while(s<10000)
    m=m+1;
    s=s+m;
end;
[s,m]%超过10000时候的m值
%%
tic;
i=0;
for i=1:10000
    s=s+1/2^i+1/3^i;
end;
s
toc;
%sum的运算
tic;
i=1:10000
sum(1./2.^i+1./3.^i)
toc;
%%
%判断结构
s=0;
for i=1:1000000
    s=s+i;
    if s>1000,break;end
i
s
end
%%
prod(1:11)%联乘
D=[1,2,3,4,5,1,2,4,2]
poly2sym(D)%显示多项式
%%
%绘图
x=[-pi : 0.05: pi];  % 以 0.05 为步距构造自变量向量
y=sin(tan(x))-tan(sin(x)); % 求出各个点上的函数值
plot(x,y)
plot(x,y,'r-.pentagram')
plot(x,y,'b-.pentagram')
%绘图时候变步长
x=[-pi:0.05:-1.8,-1.801:.001:-1.2, -1.2:0.05:1.2,...
    1.201:0.001:1.8, 1.81:0.05:pi]; 
y=sin(tan(x))-tan(sin(x)); % 求出各个点上的函数值
plot(x,y,'b')
%分段函数的使用
x=[-2:0.02:2];  % 生成自变量向量
y=1.1*sign(x).*(abs(x)>1.1) + x.*(abs(x)<=1.1); %利用判读后的0和1利用*连接
plot(x,y)


