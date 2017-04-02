%matlab R2015b
%%第四章%%
%%
%diag的调用
c=[1,2,3]
v=diag(c);
diag(v);
diag(v,1)
diag(c,1)%对角线矩阵的上对角元素
%三对角阵
V=diag([1,2,3,4])+diag([2,3,4],1)+diag([5,4,3],-1)
%hilbert矩阵
hilb(4)
invhilb(4)%他的逆矩阵
%hankel矩阵
c=[1,2,3,4]
r=[1,2,3,4,5,6]
H=hankel(c,r);
%%
%伴随矩阵
P=[2 0 4 5 6];
compan(P) 
%%
%符号矩阵
A=hilb(3)
b=sym(A)
%%
%行列式求法
a=hilb(4)
det(a)
%%
%解析法求行列式,并显示时间
tic,
A=sym(hilb(20))
det(A)
,toc
%%
%矩阵对角线求和
A=hilb(5)
trace(A)
%矩阵的秩
rank(A)
%%
%数值方法求秩
B=hilb(20)
A=sym(B)
det(A)
det(B)
rank(A)
rank(B)
%%
%向量的范数
A=[16 2 3 13];
[norm(A),norm(A,1),norm(A,Inf)]%默认为2范数
A=[16 2 3 13; 5 11 10 8; 9 7 6 12; 4 14 15 1];
[norm(A), norm(A,2), norm(A,1), norm(A,Inf)]
%%
%特征多项式
A=[16 2 3 13; 5 11 10 8; 9 7 6 12; 4 14 15 1];
poly(A)
sym(A);
poly(A)
%%
%矩阵多项式求解
a=[1,2,3,4]
A=[5,6;7,8]
polyvalm(a,A)
%%
%多项式转化为符号
P=[1 2 3 4 5 6];%次数
f=poly2sym(P,'v')
%%
%逆矩阵的求法
format long;
A=hilb(4)
B=inv(A)
A*B
norm(A*inv(A)-eye(size(A)))%利用范数求解误差
invhilb(4)
%%
H=sym(hilb(7))
inv(H)
%%
H=sym(hilb(30))%符号化
norm(double(H*inv(H)-eye(size(H))))
%%
A=[16 2 3 13; 5 11 10 8; 9 7 6 12; 4 14 15 1];
format long;
B=inv(A);
norm(A*B-eye(size(A)))
%%
syms a1 a2 a3 a4;
C=[a1 a2;a3 a4]
inv(C)
%%
%正交矩阵
A=[5,9,8,3; 0,3,2,4; 2,3,5,9; 3,4,5,8];
T=orth(A)
norm(T'*T-eye(size(A)))
C=T'*A*T
det(C)
det(A)
%%
%解线性方程组
A=[.4096,.1234,.3678,.2943;.2246,.3872,.4015,.1129;
.3645,.1920,.3781,.0643;.1784,.4002,.2786,.3927];
b=[0.4043 0.1550 0.4240 -0.2557]';
X=A\b;
X'
%%
%超定方程组的解
A=[1 2 3 4; 2 2 1 1; 2 4 6 8; 4 4 2 2];  
B=[1;3;2;6];
C=[A B];
rank(C)
rank(A)
Z=null(A,'r')%解出规范化的化零空间
x0=pinv(A)*B    
%任意解,为Z[1]*a1+Z[2]*a2+x0
%解析解
z=null(sym(A))
x0=sym(pinv(A)*B)
a1=randn(1); a2=rand(1);  % 取不同分布的随机数
x=a1*Z(:,1)+a2*Z(:,2)+x0; norm(double(A*x-B))
%%
%LU分解
A=[1 2 3; 2 4 1; 4 6 7];
[l,u,p]=lu(A)
%QR分解
A =[ 1  2  3;4  5  6; 7  8  9; 10  11  12];
[Q,R] = qr(A)
%对称正定阵
A=[16 4 8; 4 5 -4; 8 -4 22];
chol(A)
%%
%矩阵变换
A=[1 2 -2;1 1 1;2 2 1];
triu(A,1)%上三角阵
tril(A,-1);%
diag(A)%主对角元素
%%
%稀疏矩阵
load sp.dat
spconvert(sp)
full(ans)
%%
n=1000;
a1=sparse(1:n,1:n,4*ones(1,n),n,n);
a2=sparse(2:n,1:n-1,ones(1,n-1),n,n);
a=a1+a2+a2';
a
full(a)
%%
%特征值和特征向量
A=[1 2 3 13; 5 11 101 8;9 7 6 12;4 14 15 1];
eig(A)
eig(sym(A))%符号化
vpa(ans,70)
[v,d]=eig(A)
norm(A*v-v*d)
norm(double(A*v(:,2)-d(2,2)*v(:,2)))%验证
%%
%广义特征值
A=[5,7,6,5; 7,10,8,7; 6,8,10,9; 5,7,9,10];
B=[2,6,-1,-2; 5,-1,2,3; -3,-4,1,10; 5,-2,-3,8];
[V, D] = eig(A, B)



















