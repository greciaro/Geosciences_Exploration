
% 2-D Spectrum
clear all;
load('signalsdata.mat');
s2d = fftshift(log(abs(fft2(velot))));
vertical = (0:size(s2d,1)-1);
horizontal = (0:size(s2d,2)-1);
figure;
mesh(horizontal,vertical,s2d);
xlabel('Horizontal');
ylabel('Vertical');


% Whistler

clear all;
load('whistler.mat');

T = 1/fs;
finalt = T*(length(y)-1);
t = [0:T:finalt];
figure;
plot(t,y)
figure;
spectrogram(y, 'yaxis');

