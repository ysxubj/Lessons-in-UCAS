%%
%΢�ַ��̵Ľⷨ
syms t;
u=exp(-5*t)*cos(2*t+1)+5;
uu=5*diff(u,t,2)+diff(u,t)+2*u;
%���΢�ַ���
syms t y;
y=dsolve(['D4y+10*D3y+35*D2y+50*Dy+24*y=','87*exp(-5*t)*cos(2*t+1)+92*exp(-5*t)*sin(2*t+1)+10'])
y=dsolve(['D4y+10*D3y+35*D2y+50*Dy+24*y=','87*exp(-5*t)*cos(2*t+1)+92*exp(-5*t)*sin(2*t+1)+10'], 'y(0)=3',  'Dy(0)=2', 'D2y(0)=0', 'D3y(0)=0')
%������������������
y=dsolve(['D4y+10*D3y+35*D2y+50*Dy+24*y=','87*exp(-5*t)*cos(2*t+1)+92*exp(-5*t)*sin(2*t+1) +10'],'y(0)=1/2','Dy(pi)=1','D2y(2*pi)=0','Dy(2*pi)=1/5');
vpa(y,10)    
%%
%���΢�ַ�����
[x,y]=dsolve('D2x+2*Dx=x+2*y-exp(-t)','Dy=4*x+3*y+4*exp(-t)')
%%
syms t x;
x=dsolve('Dx=x*(1-x^2)')
%%
