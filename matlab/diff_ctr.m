 function [dy,dx]=diff_ctr(y, Dt, n)
      yx1=[y 0 0 0 0 0]; yx2=[0 y 0 0 0 0]; yx3=[0 0 y 0 0 0];
       yx4=[0 0 0 y 0 0]; yx5=[0 0 0 0 y 0]; yx6=[0 0 0 0 0 y];
      switch n
      case 1
          dy = (-diff(yx1)+7*diff(yx2)+7*diff(yx3)- …   diff(yx4))/(12*Dt);  L0=3;
      case 2
         dy=(-diff(yx1)+15*diff(yx2)- 15*diff(yx3)… +diff(yx4))/(12*Dt^2);L0=3;
      %数值计算diff(X)表示数组X相邻两数的差,如果x为一组数
