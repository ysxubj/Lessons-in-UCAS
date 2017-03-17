function der=poly_drv(xd,yd,a)
    m=length(xd)-1;
    d=polyfit(xd-a,yd,m);%插值后求导
    c=d(m:-1:1);   %去掉常数项，求导的系数。变化为从1阶导数到5阶导数，去掉了0次项
    fact(1)=1;for i=2:m; fact(i)=i*fact(i-1);end %求阶乘
    der=c.*fact;%导数（系数）×阶乘