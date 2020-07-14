function [] = Wavesvel(d,M0,Mend,wr)
%Phase velocity of propagating waves, group velocity and attenuation as a
%function of frequency in viscoelastic rocks.
%low and high frequency limiting moduli
% M0=1;
% Mend=4;
% %Density
% d=1;
% %Resonant Frequency
% wr=100;
%boundary values of f
f0=wr*0.01;
fend=wr*100;
%Span the frequency range from say 0.01wr to 100wr
%f is a column vector with 100 values with linear separation
f=logspace(log10(f0),log10(fend),100);
%Frequency
w=2*pi*f;
%Initializing Vectors
%Modulus
Mod = zeros(1, length(f));
%Attenuation
A = zeros(1, length(f));
%Phase velocity
v = zeros(1, length(f));
%Group velocity
vg = zeros(1, length(f));
%Calculating Modulus
Mod1 = sqrt(M0*Mend);
Mod2 = w./wr;
Mod3 = Mod1.*Mod2;
Mod4 = Mend.*(M0+i.*Mod3);
Mod5 = Mend+i.*Mod3;
Mod = Mod4./Mod5;
%Calculating Attenuation
A = imag(Mod)./real(Mod);
%Calculating Velocity
v = sqrt(real(Mod)./d);
%Calculating Group velocity
dw = diff(w)
dv = diff(v)
vg1 = 1./v(1:end-1) - (w(1:end-1)./v(1:end-1).^2).*(dv./dw);
vg = 1./vg1
%Semilogaritmic plots of velovity, group velocity and attenuation
figure;
semilogx(w,v);
hold on
plot(w(1:end-1),vg,'o');
hold on
semilogx(w,A);
end

