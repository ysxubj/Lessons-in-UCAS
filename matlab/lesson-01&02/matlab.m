%%
x=0:0.01:20;
y1=sin(x);
y2=sin(5*x);
y3=sin(x)+sin(5*x);
plot(x,y1,'*',x,y2,':',x,y3)
legend('sin(x)','sin(5x)','sin(x)+sin(5x)')
xlabel('x')%x���ע
ylabel('y')%y���ע
grid%��������
title('the function of sin')
%%
%�������Ļ���
ezplot('x^2 *sin(x+y^2) +y^2*exp(x+y)+5*cos(x^2+y)')%x��ѡ
ezplot('x^2 *sin(x+y^2) +y^2*exp(x+y)+5*cos(x^2+y)',[-10,10])%x��ѡ
%%
%��άͼ�α�ʾ
t=0:0.1:2*pi
x=t.^3.*sin(3*t)*exp(-1);
y=t.^3.*cos(3*t).*exp(-t); 
z=t.^2;
plot3(x,y,z)
grid
stem3(x,y,z)%����ͼ
hold on%����ԭͼ
plot3(x,y,z)
%%
%��ά�ռ�����
[x,y]=meshgrid(0:31);%ƽ���ϸ��������
n=2;
D0=200;
D=sqrt((x-16).^2+(y-16).^2);
z=1./(1+D.^(2*n)/D0); 
mesh(x,y,z)%����ͼ
axis([0,31,0,31,0,1]) %���������᷶Χ
surf(x,y,z)%��ά����ͼ
contour3(x,y,z,30)%�ȸ���ͼ
subplot(2,2,1),surf(x,y,z),axis([0,31,0,31,0,1]);
view(0,90);%����ͼ
subplot(2,2,2),surf(x,y,z),axis([0,31,0,31,0,1]);
view(90,0);%����ͼ
subplot(2,2,3),surf(x,y,z),axis([0,31,0,31,0,1]);%����ͼ
subplot(2,2,4),surf(x,y,z),axis([0,31,0,31,0,1]);
view(0,0);
%%
%��Ԫ����
[x,y]=meshgrid(-2:0.1:2);
z=1./(sqrt((1-x).^2+y.^2))+1./(sqrt((1+x).^2+y.^2));
mesh(x,y,z)
%%
%�䲽��
xx=[-2:.1:-1.2, -1.1:0.02:-0.9, -0.8:0.1:0.8, 0.9:0.02:1.1, 1.2:0.1:2];
yy=[-1:0.1:-0.2, -0.1:0.02:0.1, 0.2:.1:1];
[x,y]=meshgrid(xx,yy);
z=1./(sqrt((1-x).^2+y.^2))+1./(sqrt((1+x).^2+y.^2));
surf(x,y,z);
shading faceted;
set(gca,'zlim',[0,20])%z�᷶Χ��������
%%
%����������ӻ�
syms t;
x=t;
y=sin(t);
z=2*cos(t);
ezplot3(x,y,z,[0,20])
grid
%%
%���ű��ʽ
syms a t1 t2;
x=sin(t1)*cos(t2)
y=16*sin(t1)*sin(t2)
z=2*cos(t1);
ezmesh(x,y,z,[0,pi,0,2*pi])
hdden off%͸��Ч��
%%
syms t u 
x=cos(t)*(3+cos(u)); 
y=sin(t)*(3+cos(u)); 
z=sin(u); 
ezsurf(x,y,z,[0,2*pi,0,2*pi]) 
axis off %����ʾ������






