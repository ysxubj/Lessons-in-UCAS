function k=my_fact(n)
if nargin~=1, error('���������������ֻ����һ���������'); end
if nargout>1, error('���������������'); end
if abs(n-floor(n))>eps | n<0 % �ж� n �Ƿ�Ϊ����
   error('n Ӧ��Ϊ�Ǹ�����');
end   
if n>1      % ��� n>1, ���еݹ����
   k=n*my_fact(n-1);
elseif any([0 1]==n) % 0!=1!=1
   k=1;
end
