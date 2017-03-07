%% 
%��һ�ογ�
%%
H=sym(hilb(20));%������ת��Ϊ����
det(H)
%%
det(hilb(20))
%% 
%�����ٶ�
tic;det(hilb(20));toc
%%
%��������
cd
%��ѯ�͸��Ĺ���·��
demo%��ʾʾ��
lookfor%���������ʾ�ĺ�������
who%�����ڵı�����
vpa(pi,300)%�Է�������ֵ�⣬���ƽ�
B=[1,2,3;4,5,6;7,8,9;];%�����ʾ
[0:0.4:pi,pi]%��pi��Ϊ�ϵ����
B(1:2:end,:)%������Ϣ��ȡ
[i,j]=find(B>2),[i,j]%��������,���ڵ���2��Ԫ��
all(B>2)%��/�о����ڵ���2�ĺ���
%%
%����ʽ����
syms s;%���Ż�s
P=(s+2)/2+s+2+3+2*23
[a,m]=simples(P)%������ű��ʽ
%%
syms a b c d t;
f=cos(a*t)+b+sin(c*t)*sin(d*t);
f1=subss(f,{a,b,c,d,t},{1,2,3,4,5})

%%
%��������
A=hilb(3)
[n,d]=rat(A)%
format long %����Ϊ����
m=10832;n=1232;[gcd(m,n);lcm(m,n)]%��С��Լ�������Լ��
%%
A=1:10;isprime(A)%����
A=1:100;A(isprime(A))%��������
%%
%���̿���
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
[s,m]%����10000ʱ���mֵ
%%
tic;
i=0;
for i=1:10000
    s=s+1/2^i+1/3^i;
end;
s
toc;
%sum������
tic;
i=1:10000
sum(1./2.^i+1./3.^i)
toc;
%%
%�жϽṹ
s=0;
for i=1:1000000
    s=s+i;
    if s>1000,break;end
i
s
end
%%
prod(1:11)%����
D=[1,2,3,4,5,1,2,4,2]
poly2sym(D)%��ʾ����ʽ
%%
%��ͼ
x=[-pi : 0.05: pi];  % �� 0.05 Ϊ���๹���Ա�������
y=sin(tan(x))-tan(sin(x)); % ����������ϵĺ���ֵ
plot(x,y)
plot(x,y,'r-.pentagram')
plot(x,y,'b-.pentagram')
%��ͼʱ��䲽��
x=[-pi:0.05:-1.8,-1.801:.001:-1.2, -1.2:0.05:1.2,...
    1.201:0.001:1.8, 1.81:0.05:pi]; 
y=sin(tan(x))-tan(sin(x)); % ����������ϵĺ���ֵ
plot(x,y,'b')
%�ֶκ�����ʹ��
x=[-2:0.02:2];  % �����Ա�������
y=1.1*sign(x).*(abs(x)>1.1) + x.*(abs(x)<=1.1); %�����ж����0��1����*����
plot(x,y)
%%
theta=0:0.01:6*pi;
rho=5*sin(4*theta/3);
polar(theta,rho);%������ͼ����
rho=5*sin(theta/3);
polar(theta,rho)
%%
%��һ��ͼ�δ��ڻ����ĸ���ͼ
t=0:0.2:2*pi;%xֵ
y=sin(t);%yֵ
subplot(2,2,1),stairs(t,y)%��һ����ͼ
subplot(2,2,2),stem(t,y)
subplot(2,2,3),bar(t,y)
subplot(2,2,4),semilogx(t,y)
%%
t=(1/16:1/8:1)*2*pi;
x=exp(t).*sin(t);
y=t.*cos(t);
fill(x,y,'k'),grid on%grid on�������� kΪ�����ɫ
fill(x,y,'k'),grid off%off�ر�
%%
x=0:0.01:5;
y1=cos(5*x)+0.1*x.^2;
y2=sin(3*x)+0.1*x;
figure(1)%������һ����ͼ����
plot(x,y1)
figure(2)%�����ڶ�����ͼ����
plot(x,y2)

