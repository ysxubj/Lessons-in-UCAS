function k=my_fact(n)
if nargin~=1, error('输入变量个数错误，只能有一个输入变量'); end
if nargout>1, error('输出变量个数过多'); end
if abs(n-floor(n))>eps | n<0 % 判定 n 是否为整数
   error('n 应该为非负整数');
end   
if n>1      % 如果 n>1, 进行递归调用
   k=n*my_fact(n-1);
elseif any([0 1]==n) % 0!=1!=1
   k=1;
end
