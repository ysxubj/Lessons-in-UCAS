function A=myhilb(n, m)        %�������ͷ��ر����ĸ��������⣡ϵͳ��ֱ�Ӽ�⣬�汾����������
%����A=MYHILB(N,M)��A=MYHILB(N)��
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
