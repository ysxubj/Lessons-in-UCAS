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








