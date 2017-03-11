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
syms x y z;%对x,y,z分别求导
f=sin(x^2*y)*exp(-x^2*y-z^2);
df=diff(diff(diff(f,x,2),y),z);
pretty(df)
%%
%jacobi矩阵
syms r theta phi; 
x=r*sin(theta)*cos(phi);
y=r*sin(theta)*sin(phi); 
z=r*cos(theta);
J=jacobian([x; y; z],[r theta phi])
%%
%隐函数的偏导
syms x y; 
f=(x^2-2*x)*exp(-x^2-y^2-x*y);
pretty(-simple(diff(f,x)/diff(f,y)))
%%
%不定积分
syms x;
y=sin(x)/(x^2+4*x+3);
y1=diff(y);%求导
y0=int(y1);%积分
pretty(y0);
%%
%4阶导数，四次积分
syms x;
y=sin(x)/(x^2+4*x+3);
y4=diff(y,4);
y0=int(int(int(int(y4))));
pretty(y0)
%%
syms a x;
f=x^3*cos(a*x)^2;
f0=int(f,x);
f1=x^4/8+(x^3/(4*a)-3*x/(8*a^3))*sin(2*a*x)+(3*x^2/(8*a^2)-3/(16*a^4))*cos(2*a*x);
pretty(f0-f1)
%%
%定积分问题的求解
syms x;
f=exp(-x^2/2);
I1=int(f,x,0,1.5);
vpa(I1,70)%vpa求解的近似，保留70位
I2=int(f,x,0,inf);%0到正无穷求解
%%
%多重积分
syms x y z;
f0=-4*z*exp(-x^2*y-z^2)*(cos(x^2*y)-10*cos(x^2*y)*y*x^2+4*sin(x^2*y)*x^4*y^2+4*cos(x^2*y)*x^4*y^2-sin(x^2*y));
f1=int(f0,z);%对z先积分
f1=int(f1,y);%对y求积分
f1=int(f1,x);
f1=int(f1,x);%对x求两次积分x^2
%%
%多重定积分
syms x y z;
f=4*x*z*exp(-x^2*y-z^2);
f1=int(f,x,0,1)
f1=int(f1,y,0,pi)
f2=int(f1,z,0,pi)
vpa(f2,60)
%%
%泰勒展开式
syms x;
f=sin(x/(x^2+4*x+3));
y1=taylor(f,x,9);%泰勒展开为9项目
pretty(y1)
taylor(f,x,9,2)
%%
x0=-2*pi:0.1:2*pi;
y0=sin(x0);
syms x; 
y=sin(x);
plot(x0,y0,'r-.'),axis([-2*pi,2*pi,-1.5,1.5]);
hold on
a=[8:2:16];
for n=a
p=taylor(y,x,n); 
y1=subs(p,x,x0);
line(x0,y1)
end
%%
%多变量函数的Taylor幂级数展开
syms x y; 
f=(x^2-2*x)*exp(-x^2-y^2-x*y);
maple('readlib(mtaylor)');
F=maple('mtaylor',f,'[x,y]',8)
%%
%傅里叶级数展开
syms x;
f=x*(x-pi)*(x-2*pi);
[A,B,F]=fseries(f,x,6,0,2*pi);
%%
%傅里叶级数拟合
syms x;
f=abs(x)/x;
xx=[-pi:pi/200:pi];
xx=xx(xx~=0); %剔除0点
xx=sort([xx,-eps,eps])%剔除0点
yy=subs(f,x,xx);%计算生成
plot(xx,yy,'r-.')
hold on
for n=2:20%傅里叶展开
[a,b,f1]=fseries(f,x,n)
y1=subs(f1,x,xx);
plot(xx,y1)
end
%%
%级数求和
format long%长型数据打开
sum(2.^[0:200])
%%
%无穷级数,解析解
syms n;
s=symsum(1/((3*n-2)*(3*n+1)),n,1,inf);%n的选值,1到inf 正无穷
%无穷级数，数值解
m=1:10000000;
s1=sum(1./((3*m-2).*(3*m+1)));
%%
%无穷级数求和
syms n x;
s1=symsum(2/((2*n+1)*(2*x+1)^(2*n+1)),n,0,inf)
syms m n;
a=limit(symsum(1/m,m,1,n)-log(n),n,inf)
vpa(a,70)
%%
%数值微分,中心差分方法
diff_ctr()


















