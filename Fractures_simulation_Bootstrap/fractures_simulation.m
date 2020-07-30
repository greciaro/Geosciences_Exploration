
%Simulation
clear all
fractures(10,30,5,.75);
fractures(20,45,5,.75);
fractures(10,45,5,.75);
fractures(20,45,10,.75);
fractures(20,45,10,.90);
fractures(20,45,20,.75);
fractures(20,45,10,.90);
fractures(20,45,5,.90);
fractures(20,45,2,.50);
fractures(20,45,1,.90);

%Simulation
clear all
% H = 20000;
H = linspace(10000,25000);
m = 20000;
s = 3000;
n = 1000000;
C = normrnd(m,s,1,n);
for j = 1:length(H)
cost = zeros(1,n);
for i = 1:length(C)
    if C(i) <= H(j)
        cost(i) = 0.5.*(H(j)-C(i));
    else
        cost(i) = 2*(C(i)-H(j));
    end
end
avgcost(j) = mean(cost);
confidence95(j) = prctile(cost,95);
end
[v1,p1] = min(avgcost);
optimumavg = avgcost(p1);
[v2,p2] = min(confidence95);
optimum95 = v2;
optimumH = H(p2);
figure;
plot(H,avgcost,'b');
hold on
plot(H,confidence95,'r');
plot(H(p1),avgcost(p1),'bo');
plot(H(p2),confidence95(p2),'ro');
title({['Optimal H= ',num2str(round(H(p1))),' for min average'];['Optimal H= ',num2str(round(H(p2))),' for min 95%']})
legend('Average Cost','95 percentile cost','Min average cost','Min 95 percentile cost');
grid on
hold off


