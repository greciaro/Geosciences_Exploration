function []= Archimedes(N)
%This program runs the algorithm that Archimedes used to calculate pi.
% N=30;
a=1;
b=6;
nn=0;
dif=100;
dif6=[0,0,0,0];
pi_estimate=1;
pi_estimate6=[0,0,0,0];
N6=[0,0,0,0];
error6=[0,0,0,0];
c=0;

while nn<N;
   nn=nn+1; 
   b=2*b;
   a=(2-(4-a^2)^(1/2))^(1/2);
   L=(a*b)/2;
   u=L/((1-(a^2)/2)^(1/2));
   pi_estimate=(u+L)/2;
   error=(u-L)/2;
   dif=abs(pi_estimate-pi);
   if dif<0.0000009;
   c=c+1;
   N6(c)=nn;
   pi_estimate6(c)=pi_estimate;
   dif6(c)=dif;
   error6(c)=error;
   end;
end;
format long;
fprintf('Total number of iterations (N)= %d ',N);
fprintf('\n');
fprintf('real pi value = %d ',pi);
fprintf('\n');
fprintf('estimated pi value = %d ', pi_estimate);
fprintf('\n');
fprintf('value difference = %d ', dif);
fprintf('\n');
fprintf('error = %d ', error);
fprintf('\n');
fprintf('\n');
fprintf('\n');
fprintf('Number of iterations to meet the 6th decimal= %d ',N6(1));
fprintf('\n');
fprintf('real pi value = %d ',pi);
fprintf('\n');
fprintf('estimated pi value = %d ', pi_estimate6(1));
fprintf('\n');
fprintf('value difference = %d ', dif6(1));
fprintf('\n');
fprintf('error = %d ', error6(1));
fprintf('\n');
end

