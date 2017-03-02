function A=myhilb(n, m)        %检测输入和返回变量的个数有问题！系统可直接监测，版本升级？？！
%产生A=MYHILB(N,M)或A=MYHILB(N)；
if nargout>1, error('Too many output arguments.'); end
if nargin==1, m=n; 
elseif nargin==0 | nargin>2
   error('Wrong number of input arguments.'); 
end
A1=zeros(n,m);
for i=1: n
   for j=1:m
      A1(i,j)=1/(i+j-1);
end, end
if nargout==1, A=A1; elseif nargout==0, disp(A1); end
