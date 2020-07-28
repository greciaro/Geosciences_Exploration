
% Action potential pulses in biological neurons  

[t1, theta1]= ode45(@(t,theta) HHo1(t,theta),[0 1000],3.25);
Pot1 = cos(theta1+pi/4);
[t2, theta2]= ode45(@(t,theta) HHo2(t,theta),[0 1000],3.25);
Pot2 = cos(theta2+pi/4);
plot(t1,Pot1,'s-r');
hold on
plot(t2,Pot2,'.-b');
axis([0 1000 -1.5 1.5]);
legend('Neuronal Action Potential 1','Neuronal Action Potential 2');
xlabel('time'), ylabel('cos(\theta+\pi/4)');
grid on
hold off

% Symbolic toolbox

syms x
ezplot('exp(-x^2)',[0,3]);
F = int(exp(-x^2),x);
hold on
ezplot('(pi^(1/2)*erf(x))/2',[0,3]);
axis([0 3.2 -.2 1.2]);
title('Symbolic Solution');
legend('-exp^x^2','Integral');
hold off



% Optical transfer functions 

syms x y
ezsurfc('sin(sqrt(x^2+y^2))/sqrt(x^2+y^2)',[-4*pi,4*pi]);
shading interp
lightangle(-45,15)