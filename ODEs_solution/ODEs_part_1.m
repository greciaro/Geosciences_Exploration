% Non-linear least squares regression

ac0 = [1;1];
x = vrgdata(:,1);
yreal = vrgdata(:,2);
%Objective function using lsqcurvefit
yfun = @(ac,x)ac(2).*((1.5.*(x./ac(1))-0.5.*(x./ac(1)).^3).*(x<ac(1)) +  (x>=ac(1)));
ac = lsqcurvefit(yfun,ac0,x,yreal);
plot(x,yreal,'ko',x,yfun(ac,x),'b-');
ac;
residuals = yfun(ac,x)-yreal;
n = norm(residuals); 

% Optimtool Utilization

optimtool;
%Objective function using lsqnonlin
yfun2 = @(ac2)ac2(2).*((1.5.*(x./ac2(1))-0.5.*(x./ac2(1)).^3).*(x<ac2(1)) + (x>=ac2(1)))-yreal;
ac2 = lsqnonlin(yfun2,ac0);

%Objective function using fminsearch
yfun3= @(ac3)sum(abs((ac3(2).*((1.5.*(x./ac3(1))-0.5.*(x./ac3(1)).^3).*(x<ac3(1)) +  (x>=ac3(1)))-yreal)));
ac0 = [1 1];
[ac3 fval] = fminsearch(yfun3,ac0);


%Numerical solution of ODEs

%For values of rho close to 1
% figure
% rho = [-1 0 0.5 0.8 1 1.2 1.5 2 3]; %Close to 1
for rho = [26 50 100]%Greater than 25
% ode45(@(t,y) vdp1(t,y,25),[0 10],[1 15 30]); 
[t, y]= ode45(@(t,y) vdp1(t,y,rho),[0 50],[1 15 34]);
figure
plot(t, y(:,1),'o','markersize',3)% time series plots of the “chaotic” solutions
hold  on
plot(t, y(:,2),'.','markersize',7)% time series plots of the “chaotic” solutions
plot(t, y(:,3),'*','markersize',3)% time series plots of the “chaotic” solutions
title(['time series plots of the “chaotic” solutions with Rho = ',num2str(rho)]);% phase space plots
xlabel('Time (sec)'), ylabel('Temperature')% time series plots of the “chaotic” solutions
legend('x','y','z');
hold off
% plot3(y(:,1), y(:,2), y(:,3))% phase space plots
% hold on% phase space plots
end

% view(-129,15)% phase space plots
% title('Phase space close to 1');% phase space plots
% xlabel('x'), ylabel('y'), zlabel('z')% phase space plots

% title('time series plots of the “chaotic” solutions close to 1');% phase space plots
% title('time series plots of the “chaotic” solutions with Rho greater than 25');% phase space plots
% xlabel('Time (sec)'), ylabel('Temperature')% time series plots of the “chaotic” solutions
% legend('x','y','z');
% hold off











