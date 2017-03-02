function a=convs(varargin)
   a=1;
   for i=1:length(varargin), a=conv(a,varargin{i}); end
