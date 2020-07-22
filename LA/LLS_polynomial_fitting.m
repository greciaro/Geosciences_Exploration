
% Linear least squares regression
plot(porosity(end-499:end),velocity(end-499:end),'.');
xlabel('Porosity');
ylabel('Velocity');
hold on
y = velocity(end-499:end);
poro = porosity(end-499:end);
b = ones(length(poro),1);
Gm =[poro b];
ab = Gm\y;
y1 = ab(1).*poro+ab(2);
plot (poro,y1,'--','MarkerSize',2);
poro2 = poro.*(poro > 0.18);
y2 = y;
b2 = b;
Gm2 =[poro2 b2];
ab2 = Gm2\y2;
y3 = ab2(1).*poro2+ab2(2);
% plot(poro2,y2,'*');
plot (poro2,y3);
legend('Data','LLSR','LLSR phi>0.18','Location','northoutside','Orientation','horizontal');
hold off


% Polynomial Fitting
plot(porosity,velocity,'.');
hold on
xlabel('Porosity'), ylabel('Velocity');
[p,S] = polyfit(porosity,velocity,2);
yp = polyval(p,porosity);
plot(porosity,yp,'o');
alpha = .5
[Y,DELTA] = polyconf(p,porosity,S,'alpha',alpha);
plot(porosity,Y+DELTA,'+','Markersize',.5);
plot(porosity,Y-DELTA,'+','Markersize',.5);
legend('Data','Poly^2','Poly^2 50% Confidence Above','Poly^2 50% Confidence Below');
hold off

figure();
plot(porosity,velocity,'g.');
xlim([min(porosity) .35]);
hold on
poros = linspace(max(porosity),.35,1202);
[p2,S] = polyfit(porosity,velocity,20);
yp2 = polyval(p2,porosity);
plot(porosity,yp2,'b.','Markersize',4);
plot(porosity,yp,'r.','Markersize',4);
% g = fnxtr(yp,2);
% g2 = fnxtr(yp2,20);
plot(poros,yp,'r.','Markersize',4);
plot(poros,yp2,'b.','Markersize',4);
hold off
legend('Data','Poly^2','Poly^6',' Extrap Poly^2',' ExtrapPoly^6');

