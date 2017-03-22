%%
%µÚÒ»Ìâ
function result=mat_add(varargin)
[row,col]=size(varargin{1});
result=zeros(row,col);
for i=1:length(varargin)
    result=result+varargin{i};
end
end

    