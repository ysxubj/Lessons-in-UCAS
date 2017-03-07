%%
%%%%%%%%%%%΢������������%%%%%%%%%%%%%%
%%
%��������
syms x a b;
f=x*(1+a/x)^x*sin(b/x)
L=limit(f,x,inf)%����
%%
%���߼���
syms x;
limit((exp(x^3)-1)/(1-cos(sqrt(x-sin(x)))),x,0,'right') %���߼���
x=-0.1:0.0001:0.1;%����ͼ��
y=(exp(x.^3)-1)./(1-cos(sqrt(x-sin(x))));
plot(x,y,'-',[0],[12],'o')
%%
%��Ԫ�����ļ�ֵ�ƽ�
syms x y a;
f=exp(-1/(y^2+x^2))...
*sin(x)^2/x^2*(1+1/y^2)^(x+a^2*y^2);
L=limit(limit(f,x,1/sqrt(y)),y,inf)
%%
%��
syms x; 
f=sin(x)/(x^2+4*x+3);
f1=diff(f); pretty(f1)%diff(fun,x,n) n���׵���,pretty �÷�ʽ����
%����ͼ��
x1=0:0.01:5;
y=subs(f,x,x1);
y1=subs(f1,x,x1);
plot(x1,y,x1,y1,':')
%�Ľ׵���
f4=diff(f,x,4);
pretty(f4);
%%
%ƫ����
syms x y;
z=(x^2-2*x)*exp(-x^2-y^2-x*y);
zx=diff(z,x);
%zx=simple(diff(z,x))%����
zy=diff(z,y);
[x,y]=meshgrid(-3:0.2:3,-2:0.2:2);
z=(x.^2-2*x).*exp(-x.^2-y.^2-x.*y);
surf(x,y,z),axis([-3 3 -2 2 -0.7 1.5])
contour(x,y,z,30)%��ֵ��ͼ
hold on
zx=-exp(-x.^2-y.^2-x.*y).*(-2*x+2+2*x.^3+x.^2.*y-4*x.^2-2*x.*y);
zy=-x.*(x-2).*(2*y+x).*exp(-x.^2-y.^2-x.*y);    % ƫ������ֵ��
quiver(x,y,zx,zy)  % ����������
%%
syms x y z;
f=sin(x^2*y)*exp(-x^2*y-z^2);
df=diff(diff(diff(f,x,2),y),z);









