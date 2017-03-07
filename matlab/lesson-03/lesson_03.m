%%
%%%%%%%%%%%微积分问题的求解%%%%%%%%%%%%%%
%%
%极限问题
syms x a b;
f=x*(1+a/x)^x*sin(b/x)
L=limit(f,x,inf)%求极限
%%
%单边极限
syms x;
limit((exp(x^3)-1)/(1-cos(sqrt(x-sin(x)))),x,0,'right') %单边极限
x=-0.1:0.0001:0.1;%绘制图形
y=(exp(x.^3)-1)./(1-cos(sqrt(x-sin(x))));
plot(x,y,'-',[0],[12],'o')
%%
%二元函数的极值逼近
syms x y a;
f=exp(-1/(y^2+x^2))...
*sin(x)^2/x^2*(1+1/y^2)^(x+a^2*y^2);
L=limit(limit(f,x,1/sqrt(y)),y,inf)
%%
%求导
syms x; 
f=sin(x)/(x^2+4*x+3);
f1=diff(f); pretty(f1)%diff(fun,x,n) n几阶导数,pretty 用分式描述
%绘制图形
x1=0:0.01:5;
y=subs(f,x,x1);
y1=subs(f1,x,x1);
plot(x1,y,x1,y1,':')
%四阶导数
f4=diff(f,x,4);
pretty(f4);
%%
%偏导数
syms x y;
z=(x^2-2*x)*exp(-x^2-y^2-x*y);
zx=diff(z,x);
%zx=simple(diff(z,x))%化简
zy=diff(z,y);
[x,y]=meshgrid(-3:0.2:3,-2:0.2:2);
z=(x.^2-2*x).*exp(-x.^2-y.^2-x.*y);
surf(x,y,z),axis([-3 3 -2 2 -0.7 1.5])
contour(x,y,z,30)%等值线图
hold on
zx=-exp(-x.^2-y.^2-x.*y).*(-2*x+2+2*x.^3+x.^2.*y-4*x.^2-2*x.*y);
zy=-x.*(x-2).*(2*y+x).*exp(-x.^2-y.^2-x.*y);    % 偏导的数值解
quiver(x,y,zx,zy)  % 绘制引力线
%%
syms x y z;
f=sin(x^2*y)*exp(-x^2*y-z^2);
df=diff(diff(diff(f,x,2),y),z);









