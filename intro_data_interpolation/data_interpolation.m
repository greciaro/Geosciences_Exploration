
%% Exercise 1
close all
z(1)=subplot(1,2,1);
plot(porosity,depth);
t1=title(z(1),'porosity');
xy1=gca;
xy1.YAxis.Direction='reverse';
z(2)=subplot(1,2,2);
plot(velocity,depth);
t2=title(z(2),'velocity');
xy2=gca;
xy2.YAxis.Direction='reverse';

%% Using linaxes
linkaxes([z(1),z(2)],'y');
ylim([0.4 0.6]*1e4);

%% Exercise 2
close all
aa=1;
qq=2;
theta=linspace(0,4*pi,1000);
rho1=aa*theta;
rho2=aa*(qq.^theta);
subplot(1,2,1);
polarplot(theta,rho1)
title('Mummulites shell');
subplot(1,2,2);
polarplot(theta,rho2)
title('Periwinkle and Nautilus shell');

%% Exercise 3
close all
winds1999=xlsread('winds1999.xls');
winds1999(:,4).*(pi/180);
rose(winds1999(:,4))
view([90,-90])

%% Exercise 4
close all
imagesc(tops)
colormap spring
mapspring=colormap(gca);
colormap winter
mapwinter=colormap(gca);
colormap summer
mapsummer=colormap(gca);
colormap autumn
hold
[c, h] = contour(tops, '-k');
v = [-1730,-1700];
clabel(c,h,v)
colorbar
clabel(c,h)

%% Exercise 5
close all
y(1)=subplot(2,2,1);
surf(tops)
y(2)=subplot(2,2,2);
mesh(tops)
y(3)=subplot(2,2,3);
meshz(tops)
y(4)=subplot(2,2,4);
surfc(tops)

%% Trying 'camlight', 'lighting', and 'material' 
close all
y(1)=subplot(1,3,1);
surf(tops)
camlight('headlight')
y(2)=subplot(1,3,2);
surf(tops)
lighting gouraud
y(3)=subplot(1,3,3);
mesh(tops)
material dull 

%% Make a ‘surf’ plot of the top, color-coded by the velocities
close all
figure
w=surf(tops,topvel)
colormapeditor


%% Exercise 6
close all
slice(vpcsm, [57 97], [20 30], [5 1])
shading flat
shading interp

%% Exercise 7
close all
plot3(hsu6(:,1),hsu6(:,2),hsu6(:,3),'o')
hold on
plot3(hsu6(:,1),hsu6(:,2),hsu6(:,4),'x')
close all
xx=linspace(6000,12500,99);
yy=linspace(8000,14000,99);
[xq,yq] = meshgrid(xx,yy);
vq3 = griddata(hsu6(:,1),hsu6(:,2),hsu6(:,3),xq,yq);
vq4 = griddata(hsu6(:,1),hsu6(:,2),hsu6(:,4),xq,yq);
figure
mesh(xq,yq,vq3)
hold on
mesh(xq,yq,vq4)
hold on
plot3(hsu6(:,1),hsu6(:,2),hsu6(:,3),'o');
hold on
plot3(hsu6(:,1),hsu6(:,2),hsu6(:,4),'x');
rotate3d on

% Try out some of the options of the ‘griddata’ command (help griddata) to see how the gridded surface varies with different interpolation methods.
close all
vq3 = griddata(hsu6(:,1),hsu6(:,2),hsu6(:,3),xq,yq, 'linear');
figure
mesh(xq,yq,vq3)
vq3 = griddata(hsu6(:,1),hsu6(:,2),hsu6(:,3),xq,yq, 'natural');
figure
mesh(xq,yq,vq3)

%% Exercise 8
close all
soils1(soils1==-999)=nan;
soils1(soils1>=10e30)=nan;
% Arsenic
Am=nanmean(soils1(:,3))
Ast=nanstd(soils1(:,3))
% Cadmium
Cm=nanmean(soils1(:,4))
Cst=nanstd(soils1(:,4))
% Lead
Lm=nanmean(soils1(:,5))
Lst=nanstd(soils1(:,5))

