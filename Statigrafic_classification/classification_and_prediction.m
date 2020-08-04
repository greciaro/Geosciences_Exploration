
% gscatter and plotmatrix 

load ('inklin3facies_data.txt');
load ('facies.mat')

group = ones(length(Sinem(:,1)),1);  figure('Color','W');
gscatter((1:length(Sinem(:,1))),Sinem(:,1),group,'r'); hold on
gscatter((1:length(Sinem(:,1))),Sinem(:,2),group,'b');
gscatter((1:length(Sinem(:,1))),Sinem(:,3),group,'g'); ylim ([0 100]);
xlabel('samples'); ylabel('percentage');legend('Plutonic','Volcanic','Sedimentary'); 
title('Sinemurian'); hold off

group1 = ones(length(LPlein(:,1)),1); figure('Color','W');
gscatter((1:length(LPlein(:,1))),LPlein(:,1),group1,'r'); hold on
gscatter((1:length(LPlein(:,1))),LPlein(:,2),group1,'b');
gscatter((1:length(LPlein(:,1))),LPlein(:,3),group1,'g'); ylim ([0 100]);
xlabel('samples'); ylabel('percentage');legend('Plutonic','Volcanic','Sedimentary'); 
title('Lower Pliensbachian'); hold off

group2 = ones(length(UPlein(:,1)),1);  figure('Color','W');
gscatter((1:length(UPlein(:,1))),UPlein(:,1),group2,'r'); hold on
gscatter((1:length(UPlein(:,1))),UPlein(:,2),group2,'b');
gscatter((1:length(UPlein(:,1))),UPlein(:,3),group2,'g'); ylim ([0 100]);
xlabel('samples'); ylabel('percentage');legend('Plutonic','Volcanic','Sedimentary'); 
title('Upper Pliensbachian'); hold off

x = (1:length(Sinem(:,1)))';
x1 = (1:length(LPlein(:,1)))';
x2 = (1:length(UPlein(:,1)))';
y = {'Sinem';'LPlein';'UPlein'};
figure('Color','W'); gplotmatrix(x,Sinem(:,[1 2 3]),group,'r',[],[],'off',...
[],'samples',y); title('Sinemurian');
figure('Color','W'); gplotmatrix(x1,LPlein(:,[1 2 3]),group1,'b',[],[],'off',...
    [],'Samples',y); title('Lower Pliensbachian');
figure('Color','W'); gplotmatrix(x2,UPlein(:,[1 2 3]),group2,'g',[],[],'off',...
    [],'Samples',y); title('Upper Pliensbachian');


% Table

sample = [1:length(Sinem),1:length(LPlein),1:length(UPlein)];
facies1 = [repmat(y(1),(length(Sinem(:,1))),1)',repmat(y(2),(length(LPlein(:,1))),1)',repmat(y(3),(length(UPlein(:,1))),1)'];
samplefacies1 = [facies1',cellstr(num2str(sample'))];
% facies = zeros(length(facies1),1);
for i =1:length(facies1)
facies(i) = cellstr(strjoin(samplefacies1(i,:)));
end
p = [Plutonic1',Plutonic2',Plutonic3'];
v = [Volcanic1',Volcanic2',Volcanic3'];
s = [Sedimentary1',Sedimentary2',Sedimentary3'];
inklin = table(p',v',s','RowNames',facies,'VariableNames',{'Plutonic' 'Volcanic' 'Sedimentary'})

statarray = grpstats(inklin,[],{'mean'});
func = @(x) mean(x);
MeanSinem = varfun(func,inklin(1:9,1:3))
MeanLPlein = varfun(func,inklin(10:17,1:3))
MeanUPlein = varfun(func,inklin(18:24,1:3))


% fitcdiscr and predict
newdata = [50 40 9]
mdiscrt = fitcdiscr(inklin,'Plutonic');
class = predict(mdiscrt, newdata(2:3))
mdiscrt1 = fitcdiscr(inklin,'Volcanic');
class1 = predict(mdiscrt, newdata([1 3]))
mdiscrt2 = fitcdiscr(inklin,'Sedimentary');
class2 = predict(mdiscrt, newdata(1:2))

% classification tree 

samples = (1:24)';
inklinm = table(p',v',s',facies1','RowNames',cellstr(num2str(samples)),'VariableNames',{'Plutonic' 'Volcanic' 'Sedimentary' 'Facies'})
t11 = fitctree(inklinm,'Facies');
view(t11,'Mode','graph');
[class] = predict(t11,newdata);


% Well data
clear all
load('Well2.txt')
sampless = cellstr(num2str((1:length(Well2(:,1)))'));
Well2table = table(Well2(:,2),Well2(:,3),Well2(:,4),Well2(:,5),Well2(:,6),'VariableNames',{'Vp' 'Vs' 'rho' 'GR' 'nphi'});
load('well2_cemSand.txt')
facies_cemsand = repmat({'cemSand'},(length(well2_cemSand(:,1))),1);
cemsandtable = table(well2_cemSand(:,2),well2_cemSand(:,3),well2_cemSand(:,4),well2_cemSand(:,5),well2_cemSand(:,6),facies_cemsand,'VariableNames',{'Vp' 'Vs' 'rho' 'GR' 'nphi' 'Facies'});
load('well2_clnSand.txt')
facies_clnSand = repmat({'clnSand'},(length(well2_clnSand(:,1))),1);
clnSandtable = table(well2_clnSand(:,2),well2_clnSand(:,3),well2_clnSand(:,4),well2_clnSand(:,5),well2_clnSand(:,6),facies_clnSand,'VariableNames',{'Vp' 'Vs' 'rho' 'GR' 'nphi' 'Facies'});
load('well2_Shale.txt')
facies_Shale = repmat({'Shale'},(length(well2_Shale(:,1))),1);
Shaletable = table(well2_Shale(:,2),well2_Shale(:,3),well2_Shale(:,4),well2_Shale(:,5),well2_Shale(:,6),facies_Shale,'VariableNames',{'Vp' 'Vs' 'rho' 'GR' 'nphi' 'Facies'});
load('well2_sltSand1.txt')
facies_sltSand1 = repmat({'sltSand1'},(length(well2_sltSand1(:,1))),1);
sltSand1table = table(well2_sltSand1(:,2),well2_sltSand1(:,3),well2_sltSand1(:,4),well2_sltSand1(:,5),well2_sltSand1(:,6),facies_sltSand1,'VariableNames',{'Vp' 'Vs' 'rho' 'GR' 'nphi' 'Facies'});
load('well2_sltSand2.txt')
facies_sltSand2 = repmat({'sltSand2'},(length(well2_sltSand2(:,1))),1);
sltSand2table = table(well2_sltSand2(:,2),well2_sltSand2(:,3),well2_sltSand2(:,4),well2_sltSand2(:,5),well2_sltSand2(:,6),facies_sltSand2,'VariableNames',{'Vp' 'Vs' 'rho' 'GR' 'nphi' 'Facies'});
load('well2_sltShale.txt')
facies_sltShale = repmat({'sltShale'},(length(well2_sltShale(:,1))),1);
sltShaletable = table(well2_sltShale(:,2),well2_sltShale(:,3),well2_sltShale(:,4),well2_sltShale(:,5),well2_sltShale(:,6),facies_sltShale,'VariableNames',{'Vp' 'Vs' 'rho' 'GR' 'nphi' 'Facies'});

AF = [cemsandtable;clnSandtable;Shaletable;sltSand1table;sltSand2table;sltShaletable];

t22 = fitctree(AF,'Facies');
view(t22,'Mode','graph');
[Faciesdata] = predict(t22,Well2table);

cellplot(Faciesdata)

