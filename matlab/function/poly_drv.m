function der=poly_drv(xd,yd,a)
    m=length(xd)-1;
    d=polyfit(xd-a,yd,m);%��ֵ����
    c=d(m:-1:1);   %ȥ��������󵼵�ϵ�����仯Ϊ��1�׵�����5�׵�����ȥ����0����
    fact(1)=1;for i=2:m; fact(i)=i*fact(i-1);end %��׳�
    der=c.*fact;%������ϵ�������׳�