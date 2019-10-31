function [beta_final] = plotBetaTime

gg=172;
check=xlsread('2006-2008.csv');
beta_final=[];
for gg=600:-4:500
    fprintf(' %d ,', gg);
    ydata=check(1:(length(check)-gg),4);
    xdata1=[1:(length(check)-gg)]';
    xdata=xdata1./(length(check)-gg);
    ydata=log(ydata);
    % A=8.4;
    % B=1.3;
    % tc=1.3; 
    % beta=0.2; %0.2 to 0.8
    % C=2.2;
    % omega=8.5;
    % phi=2.5;
    % x0=[A B tc beta C omega phi];
    fun=@(x,xdata) (x(1)+x(2)*(x(3)-xdata).^x(4).*(1+x(5).*cos(x(6).*log(x(3)-xdata)+x(7))));
    % x = lsqcurvefit(fun,x0,xdata,ydata);

    p0=[5,-1, 1.05, 0.7, 0.5, 12, pi];
    lb = [0,-Inf,1,0,-1,2,0];
    ub = [5*max(ydata),0,1.35,1.2,1,30,2*pi];


    problem = createOptimProblem('lsqcurvefit','x0',p0,'objective',fun,'lb',lb,'ub',ub,'xdata',xdata,'ydata',ydata);

    ms = MultiStart('PlotFcns',@gsplotbestf);
    ms.Display='off';
    [xmulti,errormulti] = run(ms,problem,50);

    % disp(xmulti)

    % values=fun(x,xdata);
    % error=sum((ydata-values).^2)*100/sum(ydata);
    % times = linspace(xdata(1),xdata(end));
    % plot(xdata,ydata,'ko',times,fun(xmulti,times),'b-');
    % legend('Data','Fitted exponential');
    % title('Data and Fitted Curve');
%     xmulti(4)
%     plot(gg, xmulti(4), 'x');
    beta_final=[beta_final xmulti(4)];
end

% plot([600:-4:592], beta_final)
end