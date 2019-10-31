function [x] = plotCrypto

<<<<<<< HEAD
in=1581;
gg=1645;
check=xlsread('btc.csv');
=======

gg=550;
check=xlsread('Etherium.csv');
>>>>>>> 4622e2c83782d5aeaa8049a5d624c138a08724a9
ydata=fliplr((check(1:(length(check)),4))')';
ydata=ydata(in:gg);
xdata=[1:(gg-in+1)]';
xdata=xdata./(gg-in+1);
ydata=log(ydata);
% plot(xdata,ydata)

<<<<<<< HEAD
A=9;
B=-5;
tc=1.143; 
beta=0.6; %0.2 to 0.8
C=0.1;
omega=9;
phi=1.5;
=======
A=2.5;
B=-3.5;
tc=1.5; 
beta=0.3; %0.2 to 0.8
C=20;
omega=12;
phi=4;
>>>>>>> 4622e2c83782d5aeaa8049a5d624c138a08724a9
x0=[A B tc beta C omega phi];
fun=@(x,xdata) (x(1)+x(2)*(x(3)-xdata).^x(4).*(1+x(5).*cos(x(6).*log(x(3)-xdata)+x(7))));
x = lsqcurvefit(fun,x0,xdata,ydata);
% values=fun(x,xdata);
% error=sum((ydata-values).^2)*100/sum(ydata);
times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'ko',times,fun(x,times),'b-');
legend('Data','Fitted exponential');
title('Data and Fitted Curve');

end