%matlab R2015b
%%������%%
%%
%diag�ĵ���
c=[1,2,3]
v=diag(c);
diag(v);
diag(v,1)
diag(c,1)%�Խ��߾�����϶Խ�Ԫ��
%���Խ���
V=diag([1,2,3,4])+diag([2,3,4],1)+diag([5,4,3],-1)
%hilbert����
hilb(4)
invhilb(4)%���������
%hankel����
c=[1,2,3,4]
r=[1,2,3,4,5,6]
H=hankel(c,r);
%%
%�������
P=[2 0 4 5 6];
compan(P) 
%%
%���ž���
A=hilb(3)
b=sym(A)
%%
%����ʽ��
a=hilb(4)
det(a)
%%
%������������ʽ,����ʾʱ��
tic,
A=sym(hilb(20))
det(A)
,toc
%%
%����Խ������
A=hilb(5)
trace(A)
%�������
rank(A)
%%
%��ֵ��������
B=hilb(20)
A=sym(B)
det(A)
det(B)
rank(A)
rank(B)
%%
%�����ķ���
A=[16 2 3 13];
[norm(A),norm(A,1),norm(A,Inf)]%Ĭ��Ϊ2����
A=[16 2 3 13; 5 11 10 8; 9 7 6 12; 4 14 15 1];
[norm(A), norm(A,2), norm(A,1), norm(A,Inf)]
%%
%��������ʽ
A=[16 2 3 13; 5 11 10 8; 9 7 6 12; 4 14 15 1];
poly(A)
sym(A);
poly(A)
%%
%�������ʽ���
a=[1,2,3,4]
A=[5,6;7,8]
polyvalm(a,A)
%%
%����ʽת��Ϊ����
P=[1 2 3 4 5 6];%����
f=poly2sym(P,'v')
%%
%��������
format long;
A=hilb(4)
B=inv(A)
A*B
norm(A*inv(A)-eye(size(A)))%���÷���������
invhilb(4)








