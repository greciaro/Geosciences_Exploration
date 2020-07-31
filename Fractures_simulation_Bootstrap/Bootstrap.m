

%Bootstrap
clear all
load ('Inklin3facies_data.txt');
%1.- Plutonic 2.-Volcanic 3.-Sedimentary & Limestons
Sinemurian= Inklin3facies_data(1:9,:);
lower_Pliensbachian = Inklin3facies_data(10:17,:);
upper_Pliensbachian = Inklin3facies_data(18:24,:);
[f1,xi1] = ksdensity(Sinemurian(:,1));
[f2,xi2] = ksdensity(lower_Pliensbachian(:,1));
[f3,xi3] = ksdensity(upper_Pliensbachian(:,1));
figure
subplot(1,3,1),plot(xi1,f1);
subplot(1,3,2),plot(xi2,f2);
subplot(1,3,3),plot(xi3,f3);

A1 = [Sinemurian(:,1) Sinemurian(:,2)];
R1 = corrcoef(A1);
A2 = [lower_Pliensbachian(:,1) lower_Pliensbachian(:,2)];
R2 = corrcoef(A2);
A3 = [upper_Pliensbachian(:,1) upper_Pliensbachian(:,2)];
R3 = corrcoef(A3);

bootcc = bootstrp(1000, @corrcoef, lower_Pliensbachian(:,1), lower_Pliensbachian(:,2));
figure
subplot(1,2,1),hist(bootcc(:,2));
[f4,xi4] = ksdensity(bootcc(:,2));
subplot(1,2,2),plot(xi4,f4);
confidence90 = prctile(bootcc(:,2),90);
