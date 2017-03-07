%%
x=0:0.01:20;
y1=sin(x);
y2=sin(5*x);
y3=sin(x)+sin(5*x);
plot(x,y1,'*',x,y2,':',x,y3)
legend('sin(x)','sin(5x)','sin(x)+sin(5x)')
xlabel('x')%x轴标注
ylabel('y')%y轴标注
grid%绘制网格
title('the function of sin')
%%
%隐函数的绘制
ezplot('x^2 *sin(x+y^2) +y^2*exp(x+y)+5*cos(x^2+y)')%x自选
ezplot('x^2 *sin(x+y^2) +y^2*exp(x+y)+5*cos(x^2+y)',[-10,10])%x自选
%%
%三维图形表示
t=0:0.1:2*pi
x=t.^3.*sin(3*t)*exp(-1);
y=t.^3.*cos(3*t).*exp(-t); 
z=t.^2;
plot3(x,y,z)
grid
stem3(x,y,z)%火柴棍图
hold on%保持原图
plot3(x,y,z)
%%
%三维空间曲面
[x,y]=meshgrid(0:31);%平面上给出随机点
n=2;
D0=200;
D=sqrt((x-16).^2+(y-16).^2);
z=1./(1+D.^(2*n)/D0); 
mesh(x,y,z)%网格图
axis([0,31,0,31,0,1]) %设置坐标轴范围
surf(x,y,z)%三维表面图
contour3(x,y,z,30)%等高线图
subplot(2,2,1),surf(x,y,z),axis([0,31,0,31,0,1]);
view(0,90);%俯视图
subplot(2,2,2),surf(x,y,z),axis([0,31,0,31,0,1]);
view(90,0);%侧视图
subplot(2,2,3),surf(x,y,z),axis([0,31,0,31,0,1]);%正视图
subplot(2,2,4),surf(x,y,z),axis([0,31,0,31,0,1]);
view(0,0);
%%
%二元函数
[x,y]=meshgrid(-2:0.1:2);
z=1./(sqrt((1-x).^2+y.^2))+1./(sqrt((1+x).^2+y.^2));
mesh(x,y,z)
%%
%变步长
xx=[-2:.1:-1.2, -1.1:0.02:-0.9, -0.8:0.1:0.8, 0.9:0.02:1.1, 1.2:0.1:2];
yy=[-1:0.1:-0.2, -0.1:0.02:0.1, 0.2:.1:1];
[x,y]=meshgrid(xx,yy);
z=1./(sqrt((1-x).^2+y.^2))+1./(sqrt((1+x).^2+y.^2));
surf(x,y,z);
shading faceted;
set(gca,'zlim',[0,20])%z轴范围重新设置
%%
%符号运算可视化
syms t;
x=t;
y=sin(t);
z=2*cos(t);
ezplot3(x,y,z,[0,20])
grid
%%
%符号表达式
syms a t1 t2;
x=sin(t1)*cos(t2)
y=16*sin(t1)*sin(t2)
z=2*cos(t1);
ezmesh(x,y,z,[0,pi,0,2*pi])
hdden off%透视效果
%%
syms t u 
x=cos(t)*(3+cos(u)); 
y=sin(t)*(3+cos(u)); 
z=sin(u); 
ezsurf(x,y,z,[0,2*pi,0,2*pi]) 
axis off %不显示坐标轴






