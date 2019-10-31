function [x] = plotFunc1

check=xlsread('SENSEX 1YR.csv');
ydata=check(1:277,4);
xdata=[1:277]';
ydata=log(ydata);
x0=[8 0.5 350 2];
fun=@(x,xdata) (x(1)+x(2)*(x(3)-xdata).^x(4));
x = lsqcurvefit(fun,x0,xdata,ydata);
values=fun(x,xdata);
error=sum((ydata-values).^2)*100/sum(ydata);

times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'ko',times,fun(x,times),'b-');
legend('Data','Fitted exponential');
title('Data and Fitted Curve');

end

