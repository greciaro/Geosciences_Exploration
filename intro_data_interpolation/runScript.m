%% Ques 1
load('dataintro.mat')
depth = logdata(:,1); poro = logdata(:,2); vel = logdata(:,3);

h(1)= subplot(1,2,1);
plot(poro,depth,'k'); axis ij; grid on;
xlabel('Porosity');ylabel('Depth (feet)');
h(2)= subplot(1,2,2);
plot(vel,depth,'k'); axis ij; grid on;
xlabel('Velocity');ylabel('Depth (feet)');
linkaxes(h,'y')
%% Ques 2
clear all;
close all;
clc;
a = 1;
q = 2;

delTheta = pi/(180);
theta = 0:delTheta:4*pi;
archSpiral = a*theta;
logSpiral = a*q.^theta;
subplot 121
polarplot(theta,archSpiral,'k'); title(['Spiral of Archimedes r = a{\theta}, a = ' num2str(a)])
subplot 122
polarplot(theta,logSpiral,'r');title(['Logaithmic spiral r = aq^{\theta}, a = ' num2str(a) ', q = ' num2str(q)])

%% Ques 3
clear all;
close all;
clc;

data = xlsread('winds1999.xls');
dirDeg = data(:,4) * pi/180;

rose(dirDeg); title('Frequency of wind direction')
view([90, -90])
%% Ques 4
clear all;
close all;
clc;
load('dataintro.mat')

ftsize = 14;
imagesc(tops);hold on;
[C,h] = contour(tops,'k','ShowText','on');
set(gca,'fontsize',ftsize); colormap(autumn)
c1 = colorbar; ylabel(c1,'Tops')

%% Ques 5
clear all;
close all;
clc;
load('dataintro.mat')

subplot 221
surf(tops); title('Plot using surf');shading interp;
xlim([1 70]);ylim([1 70]);zlim([-1800 -1600])

subplot 222
mesh(tops); title('Plot using mesh'); 
axis([1 70 1 70 -1800 -1600])

subplot 223
meshz(tops); title('Plot using meshz');shading faceted 
axis([1 70 1 70 -1800 -1600])

subplot 224
surfc(tops); title('Plot using surfc');shading flat
axis([1 70 1 70 -1800 -1600])
%% Ques 6
close all;
slice(vpcsm,50,50,10)
shading interp
colormap(jet)
%% Ques 7
clear all;
close all;
clc;
load('dataintro.mat')

xWell = hsu6(:,1);
yWell = hsu6(:,2);
heightAboveSeaLevelHydrSurf = hsu6(:,3);
heightAboveSeaLevelGrouSurf = hsu6(:,4);

xVec = linspace(6000, 12500, 100);
yVec = linspace(8000, 14000, 100);

[xMat, yMat] = meshgrid(xVec, yVec);

subplot 221
plot3(xWell,yWell,heightAboveSeaLevelHydrSurf,'ko','MarkerFaceColor','k'); hold on
interpGrid = griddata(xWell,yWell,heightAboveSeaLevelHydrSurf,xMat, yMat);
mesh(xMat, yMat,interpGrid); xlabel('X Loc.'); ylabel('Y Loc.'); zlabel({'Height above sea level' ; 'of a hydrostratigraphic surface'});
title('Using linear (default) interp.'); grid on; box on

subplot 222
plot3(xWell,yWell,heightAboveSeaLevelHydrSurf,'ko','MarkerFaceColor','k'); hold on
interpGrid = griddata(xWell,yWell,heightAboveSeaLevelHydrSurf,xMat, yMat,'nearest');
mesh(xMat, yMat,interpGrid); xlabel('X Loc.'); ylabel('Y Loc.'); zlabel({'Height above sea level' ; 'of a hydrostratigraphic surface'});
title('Using nearest interp.'); grid on; box on

subplot 223
plot3(xWell,yWell,heightAboveSeaLevelHydrSurf,'ko','MarkerFaceColor','k'); hold on
interpGrid = griddata(xWell,yWell,heightAboveSeaLevelHydrSurf,xMat, yMat,'natural');
mesh(xMat, yMat,interpGrid); xlabel('X Loc.'); ylabel('Y Loc.'); zlabel({'Height above sea level' ; 'of a hydrostratigraphic surface'});
title('Using natural interp.'); grid on; box on

subplot 224
plot3(xWell,yWell,heightAboveSeaLevelHydrSurf,'ko','MarkerFaceColor','k'); hold on
interpGrid = griddata(xWell,yWell,heightAboveSeaLevelHydrSurf,xMat, yMat,'cubic');
mesh(xMat, yMat,interpGrid); xlabel('X Loc.'); ylabel('Y Loc.'); zlabel({'Height above sea level' ; 'of a hydrostratigraphic surface'});
title('Using cubic interp.'); grid on; box on

%% Ques 8

clear all;
close all;
clc;

[X, Y, As, Cd, Pb] = textread('soils.dat', '%f %f %f %f %f',-1,'headerlines',1);
As(As > 10e29 | As < 0) = nan;
Cd(Cd > 10e29 | Cd < 0) = nan;
Pb(Pb > 10e29 | Pb < 0) = nan;
disp(['As mean = ' num2str(nanmean(As)) ', As std = ' num2str(nanstd(As))]);
disp(['Cd mean = ' num2str(nanmean(Cd)) ', Cd std = ' num2str(nanstd(Cd))]);
disp(['Pb mean = ' num2str(nanmean(Pb)) ', Pb std = ' num2str(nanstd(Pb))]);

cor = corrcoef(As,Cd,'rows','complete');
disp(['Correlation coefficient between As and Cd, ' num2str(cor(1,2))]);

cor = corrcoef(Pb,Cd,'rows','complete');
disp(['Correlation coefficient between Pb and Cd, ' num2str(cor(1,2))]);

cor = corrcoef(Pb,As,'rows','complete');
disp(['Correlation coefficient between Pb and As, ' num2str(cor(1,2))]);


XVec = linspace(min(X),max(X),50); YVec = linspace(min(Y),max(Y),50);
[xq,yq] = meshgrid(XVec,YVec);
scattInterpCd = scatteredInterpolant(X,Y,Cd);
scattInterpPb = scatteredInterpolant(X,Y,Pb);
scattInterpAs = scatteredInterpolant(X,Y,As);
scattInterpCdGrid = scattInterpCd(xq,yq);

scattInterpPbGrid = scattInterpPb(xq,yq);
surf(xq,yq,scattInterpCdGrid,scattInterpPbGrid);
hold on;
plot3(X,Y,Cd,'o');
xlabel('X pos.');ylabel('Y pos.');zlabel('Cadmium Conc.');
c1 = colorbar; ylabel(c1,'Lead Conc.'); colormap(jet);box on; grid on

disp(['Value of Cd conc. at (398, 252): ' num2str(scattInterpCd(398, 252))])
disp(['Value of Pb conc. at (398, 252): ' num2str(scattInterpPb(398, 252))])
disp(['Value of As conc. at (398, 252): ' num2str(scattInterpAs(398, 252))])

%%

A = [1 2 3 4 5 nan];
B = [nan 2 3 4 5 6];


corrcoef(A(~isnan(A) & ~isnan(B)),B(~isnan(A) & ~isnan(B)),'rows','complete')


