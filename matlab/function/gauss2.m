function g=gauss2(fun,a,b)
h=(b-a)/2;
c=(a+b)/2;
x=[h*(-0.7745967)+c, c, h*0.7745967+c];
g=h*(0.55555556*(gaussf(x(1))+gaussf(x(3)))+0.88888889*gaussf(x(2)));
