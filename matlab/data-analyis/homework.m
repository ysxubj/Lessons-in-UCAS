clear%清楚环境空间
clc%清场
omgn=[1,1.03,1.1];%定义SOR权重值
x=[0,0,0]';
A=[4,-1,0;-1,4,-1;0,-1,4];%定义矩阵A
b=[1,4,-3];%定义向量b
b=b';%转置
D=[A(1,1),0,0;0,A(2,2),0;0,0,A(3,3)];%定义对角阵
L=[0,0,0;-A(2,1),0,0;-A(3,1),-A(3,2),0];%下三角矩阵
U=[0,-A(1,2),-A(1,3);0,0,-A(2,3);0,0,0];%上三角矩阵
%%
format long
%guass消元法
if det(A)==0
    disp('方程有无穷多解')
else
    A=[4,-1,0;-1,4,-1;0,-1,4];%定义矩阵A
    b=[1,4,-3]';%定义向量b
    %function [A,b]= Gauss(A,b);
    [m,n]=size(A);%矩阵行列数m,n
    B=[A b];
   for i=1:n-1
      [v,u]=max(abs(A(i:m,i)));%v表示最大主元值,u表示位置
     if u==1
         disp('不用换主元')
      else
            u=u+i-1;%实际位置
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
    fprintf(' w值: "%f" \n 迭代次数: "%d"  \n 误差值: "%d" \n 方程组的解分别为 "%d" "%d" "%d" \n',omg,n,e,x(1),x(2),x(3));
end














