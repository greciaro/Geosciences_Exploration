
% Samplig and Aliasing
clear all
% t = [0:pi/30:10*pi];% Bad sampling
t = [0:pi/500:10*pi];% Finer sampling
s = 1.0*sin(2*pi*2.*t)+.2*sin(2*pi*8.*t);
L = length(t);
% T = pi/30;% Bad sampling period
T = pi/500;% Finer sampling period
Fs = 1/T;
figure
subplot(2,1,1),plot(s(1:L/4)),xlabel('Time'),ylabel('Signal S');
sft = fft(s);
P2 = abs(sft/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
subplot(2,1,2),plot(f,P1),xlabel('f (Hz)'),ylabel('|P1(f)|');

figure
subplot(2,1,1),plot(real(sft)),title('Real Components (Symetry)');
subplot(2,1,2),plot(imag(sft)),title('Imaginary Components (Anti-symetry)');


% Spectral Analysis
clear all
load('signalsdata.mat');
% elnino = [0 elnino(:)']';
elninom = elnino-mean(elnino);
L = length(elninom);
T = 1;
Fs = 1/T;
figure
subplot(2,1,1),plot(elninom),xlabel('Time'),ylabel('Signal SOI');
sft = fft(elninom);
P2 = abs(sft/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
subplot(2,1,2),plot(f,P1),xlabel('f (Hz)'),ylabel('|P1(f)|');



% Cross-Correlation
clear all
load('signalsdata.mat');
L = length(w1);
T = 0.05*10^-6;
Fs = 1/T;
subplot(3,1,1),plot(w1),xlabel('Time'),ylabel('w1');
[x,y] = ginput;
sft = fft(w1);
P2 = abs(sft/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
subplot(3,1,2),plot(f,P1),xlabel('f (Hz)'),ylabel('|P1(f)|');
[psdv, ff]= pwelch(w1, [],[],[], Fs);
subplot(3,1,3),plot(ff,log(psdv)),title('Using pwelch');
pt2zc = 2*(x(2)-x(1))*0.05*10^-6;

[acf, lags]= xcorr(w1,w3,50,'coeff');
figure;
plot(lags,acf),



% 2-D Autocorrelation
clear all
load('signalsdata.mat');

velotm = velot-mean2(velot);
[out] = xcorr2(velotm);
cros2D = out./max(max(out));
vertical = (0:size(cros2D,1)-1);
horizontal = (0:size(cros2D,2)-1);
figure;
mesh(horizontal,vertical,cros2D);
xlabel('Horizontal');
ylabel('Vertical');




