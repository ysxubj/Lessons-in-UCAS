%%多项式、插值与数据拟合%%
%%
clear
clc
%%
%多项式的表示
p=[2 1 4 5]
a=poly2sym(p)%多项式转化为符号
roots(p)%求根
roots([1 -6 15 -20 15 -6 1])%重根时候影响精度
%%
%多项式求值
c=[3 -7 2 1 1]
x=2.5
y=polyval(c,x)
%多个点
x=[1 2]
y=polyval(c,x)
%%
%数据插值
x=[1.1,2.3,3.9,5.1];
y=[3.887,4.276,4.651,2.117];
a=polyfit(x,y,length(x)-1)
poly2sym(a)
%%
%多项式运算
a=[2,-5,6,-1,9];
b=[3,-90,-18];
c=conv(a,b)
[q,r]=deconv(c,b)
%%
%拉格朗日插值
x=[0.4,0.1,0.8];
y=[-0.916291,-0.693147,-0.510826,-0.356675,-0.223144];
lagrange(x,y,[0.54,0.55,0.78])
%%
%埃尔米特插值
x0=[0.3,0.32,0.35];
y0=[0.29552,0.31457,0.34290];
y1=[0.95534,0.94924,0.93937];
format long; y=hermite(x0,y0,y1,0.34)
%%
%Runge现象
x=[-5:1:5];
y=1./(1+x.^2);
x0=[-5:0.1:5]
y1=1./(1+x0.^2);
y0=lagrange(x,y,x0)
plot(x0,y0,'--r')
hold on
plot(x0,y1,'-b')
%%
%分段线性插值
temp=[300,400,500,600]';
beta=1000*[3.33,2.50,2.00,1.67]';
alpha=10000*[0.2128,0.3605,0.5324,0.7190]';
ti=[321,400,571]';
propty=interp1(temp,[beta,alpha],ti);
%%
%三次样条插值
year=1900:10:2010;
product=[75.995,91.972,105.711,123.203,131.669, 150.697,179.323,203.212,226.505,249.633,256.344,267.893];
p1995=interp1(year,product,1995)
x=1900:1:2010;
y=interp1(year,product,x,'cubic')
plot(year,product,'o',x,y)
%%
%原函数
x=0:0.12:1;
y=(x.^2-3*x+5).*exp(-5*x).*sin(x); 
plot(x,y,x,y,'o')
xx=0:0.02:1;yy=(x0.^2-3*x0+5).*exp(-5*x0).*sin(x0); 
%分段线性插值
y0=interp1(x,y,xx)
y1=interp1(x,y,xx,'spline')
y2=interp1(x,y,xx,'nearest')
y3=interp1(x,y,xx,'cubic')
plot(xx,[yy',y0',y1',y2',y3'],':')
%%
%二维数据插值
years=1950:10:1990;
service=10:10:30;
wage = [150.697 199.592 187.625
       179.323 195.072 250.287
       203.212 179.092 322.767
       226.505 153.706 426.730
       249.633 120.281 598.243];
w=interp2(service,years,wage,15,1975)%计算工资工作15年，自1875年开始工作的工资
%%
[x,y]=meshgrid(-3:.6:3,-2:.4:2);
z=(x.^2-2*x).*exp(-x.^2-y.^2-x.*y);
surf(x,y,z)
axis([-3,3,-2,2,-0.7,1.5])
%默认插值
[x1,y1]=meshgrid(-3:.2:3,-2:.2:2);
z1=interp2(x,y,z,x1,y1);
surf(x1,y1,z1)
%%
%二维一般分布
x=-3+6*rand(200,1);
y=-2+4*rand(200,1);
z=(x.^2-2*x).*exp(-x.^2-y.^2-x.*y);
[x1,y1]=meshgrid(-3:.2:3,-2:.2:2);
z1=griddata(x,y,z,x1,y1,'cubic');
surf(x1,y1,z1)
hold on
z2=griddata(x,y,z,x1,y1,'v4')
surf(x1,y1,z2)
%误差分析
z0=(x1.^2-2*x1).*exp(-x1.^2-y1.^2-x1.*y1);%计算真值
surf(x1,y1,abs(z0-z1)),axis([-3,3,-2,2,0,0.15])
figure;
surf(x1,y1,abs(z0-z2)),axis([-3,3,-2,2,0,0.15])
%%
x=-3+6*rand(200,1); y=-2+4*rand(200,1);
z==(x.^2-2*x).*exp(-x.^2-y.^2-x.*y);   % 生成已知数据
plot(x,y,'x');
figure;
plot3(x,y,z,'x')
axis([-3,3,-2,2,-0.7,1.5])
grid
%%
x=-3+6*rand(200,1); y=-2+4*rand(200,1);  % 重新生成样本点
z=(x.^2-2*x).*exp(-x.^2-y.^2-x.*y); 
ii=find((x+1).^2+(y+0.5).^2>0.5^2);  % 找出满足条件的点坐标
x=x(ii); y=y(ii); z=z(ii); plot(x,y,'x')
t=[0:.1:2*pi,2*pi]; x0=-1+0.5*cos(t); y0=-0.5+0.5*sin(t);
line(x0,y0)   % 在图形上叠印该圆，可见，圆内样本点均已剔除
[x1,y1]=meshgrid(-3:.2:3,-2:.2:2);
z1=griddata(x,y,z,x1,y1,'v4')
surf(x1,y1,z1)
axis([-3,3,-2,2,-0.7,1.5]);
z0=(x1.^2-2*x1).*exp(-x1.^2-y1.^2-x1.*y1);
surf(x1,y1,abs(z0-z1))
contour(x1,y1,abs(z0-z1),30);
hold on
plot(x,y,'x')
line(x0,y0)
%%
%三维网格
[x,y,z]=meshgrid(-1:0.2:1);
[x0,y0,z0]=meshgrid(-1:.05:1);
V=exp(x.^2.*z+y.^2.*x+z.^2.*y).*cos(x.^2.*y.*z+z.^2.*y.*x);
V0=exp(x0.^2.*z0+y0.^2.*x0+z0.^2.*y0).*cos(x0.^2.*y0.*z0+z0.^2.*y0.*x0);
V1=interp3(x,y,z,V,x0,y0,z0,'spline')
err=V1-V0;
max(err(:))
%%
%样条插值
x0=[0,0.4,1,2,pi];
y0=sin(x0);
sp=csapi(x0,y0);%样条插值
fnplt(sp,':');%绘制插值图
hold on
ezplot('sin(t)',[0,pi]);%图形曲线
plot(x0,y0,'o')%绘制点
sp.coefs%求系数
%%
x=0:.12:1; y=(x.^2-3*x+5).*exp(-5*x).*sin(x);
sp=csapi(x,y); fnplt(sp)
c=[sp.breaks(1:4)' sp.breaks(2:5)' sp.coefs(1:4,:),sp.breaks(5:8)' sp.breaks(6:9)' sp.coefs(5:8,:) ]
c
%%
x0=-3:.6:3;
y0=-2:.4:2;
[x,y]=ndgrid(x0,y0);
z=(x.^2-2*x).*exp(-x.^2-y.^2-x.*y);
sp=csapi({x0,y0},z);%二维样条插值
fnplt(sp);%绘图
%%
%三次样条插值
x = [0 2 4 5 8 12 12.8 17.2 19.9 20]; 
y = exp(x).*sin(x);
xx=0:0.25:20;
yy=spline(x,y,xx)
yy0=exp(xx).*sin(xx);
plot(x,y,'o',xx,yy)
hold on
plot(xx,yy0,'red')
%%
%B样条函数的计算
x0=[0,0.4,1,2,pi];
y0=sin(x0);
ezplot('sin(t)',[0,pi]);
hold on
sp1=csapi(x0,y0);
fnplt(sp1,'--');%三次分段样条
hold on
sp2=spapi(5,x0,y0);
fnplt(sp2,':','red')
%%
x=0:.12:1; y=(x.^2-3*x+5).*exp(-5*x).*sin(x);
ezplot('(x^2-3*x+5)*exp(-5*x)*sin(x)',[0,1])
hold on
sp1=csapi(x,y)
fnplt(sp1,'blue');
sp2=spapi(5,x,y)
fnplt(sp2,'red')
%%
%样条微积分
syms x;
f=(x^2-3*x+5)*exp(-5*x)*sin(x);
ezplot(diff(f),[0,1])
hold on
x=0:.12:1
y=(x.^2-3*x+5).*exp(-5*x).*sin(x);
sp1=csapi(x,y);
dsp1=fnder(sp1,1)%对样条函数一阶求导
fnplt(dsp1,'red');
hold on
sp2=spapi(5,x,y);
dsp2=fnder(sp2,1);
fnplt(dsp2,'blue')
%%
x0=-3:.3:3; y0=-2:.2:2; 
[x,y]=ndgrid(x0,y0);
z=(x.^2-2*x).*exp(-x.^2-y.^2-x.*y);
sp=spapi({5,5},{x0,y0},z)
dspxy=fnder(sp,[1,1])%求导
fnplt(dspxy)
syms x y;
z=(x^2-2*x)*exp(-x^2-y^2-x*y);
ezsurf(diff(diff(z,x),y),[-3 3],[-2 2])
%%
%积分运算
x=[0,0.4,1,2,pi];
y=sin(x);
sp1=csapi(x,y)
a=fnint(sp1,1)%积分
xx=fnval(a,[0,pi])%求在两个的点的值
xx(2)-xx(1)
%B样条
sp2=spapi(5,x,y)
b=fnint(sp2,1)
xx=fnval(b,[0,pi])
xx(2)-xx(1)
ezplot('-cos(t)+2',[0,pi]); hold on
fnplt(a,'--')
fnplt(b,':')
%%
%数据拟合
x0=0:.1:1;
y0=(x0.^2-3*x0+5).*exp(-5*x0).*sin(x0);
p3=polyfit(x0,y0,3)%拟合
vpa(poly2sym(p3),10)%计算值
x=0:.01:1
ya=(x.^2-3*x+5).*exp(-5*x).*sin(x);
y1=polyval(p3,x);%
plot(x,y1,x,ya,x0,y0,'o')
p4=polyfit(x0,y0,4);y2=polyval(p4,x);
p5=polyfit(x0,y0,5);y3=polyval(p5,x);
p8=polyfit(x0,y0,8);y4=polyval(p8,x);
plot(x,ya,x0,y0,'o',x,y2,x,y3,x,y4)
vpa(poly2sym(p8),10)
%%
%泰勒展开
sym x;
y=(x^2-3*x+5)*exp(-5*x)*sin(x);
vpa(taylor(y,9),5)
%%
%多项式拟合
x0=-1+2*[0:10]/10;
y0=1./(1+25*x0.^2);
x=-1:.01:1;
ya=1./(1+25*x.^2);
p3=polyfit(x0,y0,3);
y1=polyval(p3,x)
p5=polyfit(x0,y0,5);
y2=polyval(p5,x)
p8=polyfit(x0,y0,8);
y3=polyval(p8,x)
p10=polyfit(x0,y0,10);
y4=polyval(p10,x)
plot(x,ya,x,y1,x,y2,x,y3,x,y4)
%%
%泰勒展开
syms x; y=1/(1+25*x^2); p=taylor(y,x,10)
x1=-1:.01:1;
ya=1./(1+25*x1.^2);
y1=subs(p,x,x1)
plot(x1,ya,x1,y1)
%%
%曲线的拟合，确定函数前的系数，利用矩阵的最小二乘法
x=[0,0.2,0.4,0.7,0.9,0.92,0.99,1.2,1.4,1.48,1.5]';
y=[2.88;2.2576;1.9683;1.9258;2.0862;2.109; 2.1979;2.5409;2.9627;3.155;3.2052];%列向量
A=[ones(size(x)),exp(-3*x),cos(-2*x).*exp(-4*x),x.^2];
c=A\y;
c1=c';
x0=0:0.01:1.5;
A1=[ones(size(x0)),exp(-3*x0),cos(-2*x0).*exp(-4*x0),x0.^2];
y1=A1*c
plot(x0,y1,x,y,'x');
%%
x=[1.1052,1.2214,1.3499,1.4918,1.6487,1.8221,2.0138,2.2255,2.4596,2.7183,3.6693];
y=[0.6795,0.6006,0.5309,0.4693,0.4148,0.3666,0.3241,0.2864,0.2532,0.2238,0.1546];
plot(x,y,x,y,'x')
x1=log(x)
y1=log(y)
plot(x1,y1)
%%
A=[x1',ones(size(x1'))];
c=[A\y1']';
exp(c(2));
%%
%多项式拟合
x=[0:0.01:1]';
y=(x.^2-3*x+5).*exp(-5*x).*sin(x);
n=8;
A=[]
for i=1:n+1;
    A(:,i)=x.^(n+1-i);
end
c=A\y;
vpa(poly2sym(c),5)
%%
%最小二乘拟合
x=0:0.1:10;
y=0.12*exp(-0.231*x)+0.54*exp(-0.17*x).*sin(1.23*x);
f=inline('a(1)*exp(a(2)*x)+a(3)*exp(a(4)*x).*sin(a(5)*x)','a','x');
[xx,res]=lsqcurvefit(f,[1,1,1,1,1],x,y)
xx'%参数
res%最小误差
ff=optimset; ff.TolFun=1e-20; ff.TolX=1e-15; % 修改精度限制
[xx,res]=lsqcurvefit(f,[1,1,1,1,1],x,y,[],[],ff)
x1=0:0.01:10;
y1=f(xx,x1)%xx为参数
plot(x1,y1,x,y,'x')
%%
x=0.1:0.1:1;
y=[2.3201,2.6470,2.9707,3.2885,3.6008,3.9090,4.2147,4.5191,4.8232,5.1275];
f=inline('a(1)*x+a(2)*x.^2.*exp(-a(3)*x)+a(4)','a','x');
a=lsqcurvefit(f,[1;1;1;1],x,y);
a'



















