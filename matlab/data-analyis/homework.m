clear%��������ռ�
clc%�峡
omgn=[1,1.03,1.1];%����SORȨ��ֵ
x=[0,0,0]';
A=[4,-1,0;-1,4,-1;0,-1,4];%�������A
b=[1,4,-3];%��������b
b=b';%ת��
D=[A(1,1),0,0;0,A(2,2),0;0,0,A(3,3)];%����Խ���
L=[0,0,0;-A(2,1),0,0;-A(3,1),-A(3,2),0];%�����Ǿ���
U=[0,-A(1,2),-A(1,3);0,0,-A(2,3);0,0,0];%�����Ǿ���
%%
format long
%guass��Ԫ��
if det(A)==0
    disp('������������')
else
    A=[4,-1,0;-1,4,-1;0,-1,4];%�������A
    b=[1,4,-3]';%��������b
    %function [A,b]= Gauss(A,b);
    [m,n]=size(A);%����������m,n
    B=[A b];
   for i=1:n-1
      [v,u]=max(abs(A(i:m,i)));%v��ʾ�����Ԫֵ,u��ʾλ��
     if u==1
         disp('���û���Ԫ')
      else
            u=u+i-1;%ʵ��λ��
            C=B(u,:);
            D=B(i,:);
            B(u,:)=D;
            B(i,:)=C;
     end
    end
    A1=B(:,1:n);
    b1=B(:,n+1);
for i=1:n-1;
       E=eye(m,n);
     for ii=i+1:m
         k=-(A1(ii,i)/A1(i,i));
         E(ii,i)=k;
     end
        A1=E*A1;
        b1=E*b1;
end
    x=zeros(m,1);
    x(m)=b1(m)/A1(m,n);
   for iii=m-1:-1:1
        x(iii)=(b1(iii)-sum(x.*(A1(iii,:)')))/A1(iii,iii);
   end
end
disp(x)
x1=x;
%%
for i=1:3
    omg=omgn(i);
    B=inv(D-omg*L)*[(1-omg)*D+omg*U];
    f=omg*inv(D-omg*L);
    n=0;
    e=1;
    while (e>5e-06) 
        n=1+n;
        x=B*x+f*b;
        error=x-x1;
        e=norm(error);
    end
    number(i,1)=n;
    number(i,2)=e;
    number(i,3)=omg;
    number(i,4:6)=x;
    fprintf(' wֵ: "%f" \n ��������: "%d"  \n ���ֵ: "%d" \n ������Ľ�ֱ�Ϊ "%d" "%d" "%d" \n',omg,n,e,x(1),x(2),x(3));
end














