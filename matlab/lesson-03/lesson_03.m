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
syms x y z;%��x,y,z�ֱ���
f=sin(x^2*y)*exp(-x^2*y-z^2);
df=diff(diff(diff(f,x,2),y),z);
pretty(df)
%%
%jacobi����
syms r theta phi; 
x=r*sin(theta)*cos(phi);
y=r*sin(theta)*sin(phi); 
z=r*cos(theta);
J=jacobian([x; y; z],[r theta phi])
%%
%��������ƫ��
syms x y; 
f=(x^2-2*x)*exp(-x^2-y^2-x*y);
pretty(-simple(diff(f,x)/diff(f,y)))
%%
%��������
syms x;
y=sin(x)/(x^2+4*x+3);
y1=diff(y);%��
y0=int(y1);%����
pretty(y0);
%%
%4�׵������Ĵλ���
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
%��������������
syms x;
f=exp(-x^2/2);
I1=int(f,x,0,1.5);
vpa(I1,70)%vpa���Ľ��ƣ�����70λ
I2=int(f,x,0,inf);%0�����������
%%
%���ػ���
syms x y z;
f0=-4*z*exp(-x^2*y-z^2)*(cos(x^2*y)-10*cos(x^2*y)*y*x^2+4*sin(x^2*y)*x^4*y^2+4*cos(x^2*y)*x^4*y^2-sin(x^2*y));
f1=int(f0,z);%��z�Ȼ���
f1=int(f1,y);%��y�����
f1=int(f1,x);
f1=int(f1,x);%��x�����λ���x^2
%%
%���ض�����
syms x y z;
f=4*x*z*exp(-x^2*y-z^2);
f1=int(f,x,0,1)
f1=int(f1,y,0,pi)
f2=int(f1,z,0,pi)
vpa(f2,60)
%%
%̩��չ��ʽ
syms x;
f=sin(x/(x^2+4*x+3));
y1=taylor(f,x,9);%̩��չ��Ϊ9��Ŀ
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
%�����������Taylor�ݼ���չ��
syms x y; 
f=(x^2-2*x)*exp(-x^2-y^2-x*y);
maple('readlib(mtaylor)');
F=maple('mtaylor',f,'[x,y]',8)
%%
%����Ҷ����չ��
syms x;
f=x*(x-pi)*(x-2*pi);
[A,B,F]=fseries(f,x,6,0,2*pi);
%%
%����Ҷ�������
syms x;
f=abs(x)/x;
xx=[-pi:pi/200:pi];
xx=xx(xx~=0); %�޳�0��
xx=sort([xx,-eps,eps])%�޳�0��
yy=subs(f,x,xx);%��������
plot(xx,yy,'r-.')
hold on
for n=2:20%����Ҷչ��
[a,b,f1]=fseries(f,x,n)
y1=subs(f1,x,xx);
plot(xx,y1)
end
%%
%�������
format long%�������ݴ�
sum(2.^[0:200])
%%
%�����,������
syms n;
s=symsum(1/((3*n-2)*(3*n+1)),n,1,inf);%n��ѡֵ,1��inf ������
%���������ֵ��
m=1:10000000;
s1=sum(1./((3*m-2).*(3*m+1)));
%%
%��������
syms n x;
s1=symsum(2/((2*n+1)*(2*x+1)^(2*n+1)),n,0,inf)
syms m n;
a=limit(symsum(1/m,m,1,n)-log(n),n,inf)
vpa(a,70)
%%
%������
syms x;
y=sin(x)/(x^2+4*x+3)
a=0:0.05:pi;
yy1=diff(y);%һ�׵���
subs(yy1,x,a);
yy2=diff(yy1);%���׵���
subs(yy2,x,a);
yy3=diff(yy2);%���׵���
subs(yy3,x,a);
yy4=diff(yy3);%�Ľ׵���
subs(yy4,x,a);%�������̺���aֵ����xֵ
%��ֵ��
y=sin(x)./(x.^2+4*x+3);   % ������֪���ݵ�
h=0:0.05:pi;
[y1,dx1]=diff_ctr(y,h,1); subplot(221),plot(x,f1,dx1,y1,':');
[y2,dx2]=diff_ctr(y,h,2); subplot(222),plot(x,f2,dx2,y2,':');
[y3,dx3]=diff_ctr(y,h,3); subplot(223),plot(x,f3,dx3,y3,':');
[y4,dx4]=diff_ctr(y,h,4); subplot(224),plot(x,f4,dx4,y4,':');
%subplot(row,col,num)
%%
%��ֵ����϶���ʽ������
xd=[ 0  0.2000  0.4000  0.6000  0.8000  1.000];
yd=[0.3927  0.5672  0.6982  0.7941  0.8614  0.9053];
a=0.3;
L=length(xd);%�������
d=polyfit(xd-a,yd,L-1);%�Ȳ�ֵ,��0.3�������ʽ
fact=[1];
for k=1:L-1
    fact=[factorial(k),fact];%������׵Ľ׳�
end
deriv=d.*fact%���׵Ľ׳ˡ����׵ĵ���
%ֱ�ӵ���der����
ploy_dry(xd,yd,a)
%%
%��Ԫ�������ݶȼ���
[x,y]=meshgrid(-3:.2:3,-2:.2:2);%x,y�ľ���
z=(x.^2-2*x).*exp(-x.^2-y.^2-x.*y);%���庯��
[fx,fy]=gradient(z); 
fx=fx/0.2; fy=fy/0.2;
contour(x,y,z,30); 
hold on;
quiver(x,y,fx,fy)
%�����������,��������ֵ�����ͽ���������ֵ
zx=-exp(-x.^2-y.^2-x.*y).*(-2*x+2+2*x.^3+x.^2.*y-4*x.^2-2*x.*y);%��ȷ��xƫ����ʽ
zy=-x.*(x-2).*(2*y+x).*exp(-x.^2-y.^2-x.*y);%��ȷ��yƫ����ʽ
surf(x,y,abs(fx-zx)); axis([-3 3 -2 2 0,0.08])%���Ʊ���ͼ,fx��zx��������
figure;  
surf(x,y,abs(fy-zy)); axis([-3 3 -2 2 0,0.11])%���Ʊ���ͼ,fy��zy��������
%%
%��ֵ���������
x1=[0:pi/30:pi]';
y=[sin(x1) cos(x1) sin(x1/2)];
x=[x1 x1 x1];
S=sum((2*y(1:end-1,:)+diff(y)).*diff(x))/2
trapz(x1,y)%x1Ϊ������,yΪ����ÿ�б�ʾ��ͬ�ĺ���
%%
x=[0:0.01:(3/2)*pi,(3/2)*pi];
y=cos(15*x);
plot(x,y)
%����ֵ
syms x;
int(cos(15*x),0,3*pi/2)%����
%��ֵ����
h0=[0.1,0.01,0.001,0.0001,0.00001,0.000001]; %��ͬ�Ĳ���
v=[];
for h=h0,
    x=[0:h:3*pi/2, 3*pi/2]; y=cos(15*x); I=trapz(x,y); 
    v=[v; h, I, 1/15-I ];%v;��ʾѭ��ÿ�λ��У���֮ǰ��v��h����,I��ֵ���֣�1/15-I���
end
format long; %��ʾ����
v
%%
%����ɭ��⹫ʽ
%������������ʾ
f=inline('2/sqrt(pi)*exp(-x.^2)','x');
%����
y=quad(fun,0,1.5,1e-20);
%%
x=[0:0.01:2,2+eps:0.01:4,4];
y=exp(x.^2).*(x<=2)+80./(4-sin(16*pi*x)).*(x>2);
y(end)=0;% ǿ����y��end��Ϊ�㣬Ϊ�˻������ͼ
x=[eps,x];%���x
y=[0,y];%���y
fill(x,y,'g')%���ͼ
%%
f=inline('exp(x.^2).*(x<=2)+80./(4-sin(16*pi*x)).*(x>2)','x');%���庯��
quad(f,0,4)%����ɭ����
quadl(f,0,4)
%������
syms x;
I=vpa(int(exp(x^2),0,2)+int(80/(4-sin(16*pi*x)),2,4))
%%
%Guass���
%������˸�˹�Ĺ�ʽ
gauss2('gaussf',0,1)
%%
%˫�ػ��ֵ���ֵ��
%1�������������
f=inline('exp(-x.^2/2).*sin(x.^2+y)','x','y')
dblquad(f,-2,2,-1,1)
%2���������µĻ��֣����ù�����NIT,��������ڹ���·����
f=inline('exp(-x.^2/2)*sin(x.^2+y)','y','x')
yl=inline('sqrt((1-x.^2)/2)','x')
ys=inline('-sqrt((1-x.^2)/2)','x')
quad2dggen(f,ys,yl,-1/2,1,eps)%
%%
%������������
syms x y;
i1=int(exp(-x^2/2)*sin(x^2+y), y, -sqrt(1-x^2/2), sqrt(1-x^2/2));
int(i1, x, -1/2, 1)
vpa(ans)
%%
%Բ�Ļ���
f1=inline('sqrt(1-y.^2)','y');
f2=inline('-sqrt(1-y.^2)','y')
f=inline('exp(-x.^2/2).*sin(x.^2+y)','x','y'); 
quad2dggen(f,f2,f1,-1,-1,eps)
%%
%�������
syms t
syms a positive;
x=a*cos(t);
y=a*sin(t);
z=a*t;
int(z^2/(x^2+y^2)*sqrt(diff(x,t)^2+diff(y,t)^2)+diff(z,t)^2,t,0,2*pi)
%%
x=0:0.01:1.2;
y1=x;
y2=x.^2
plot(x,y1,x,y2)












































