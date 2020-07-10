function [] = henon(x0,y0,n)
%This program compute and plot the Henon map about stellar orbits
% x0 = 0;
% y0 = 0;
% n = 5000;
%Creating a dialog box to read the inputs
if nargin==0;
%Default values    
defans={'0', '0', '5000'};
prompt={'x0', 'y0', 'n'};
dlg_title = 'Input for Henon Map';
answer=inputdlg(prompt,'henon', 1, defans);
%Saving values of the variables
x0 = str2double(answer{1}); 
y0 = str2double(answer{2}); 
n = str2double(answer{3}); 
end
a = 1.4;
b = 0.3;
x(1) = x0;
y(1) = y0;
x = zeros(1,n);
y = zeros(1,n);
for i=2:n;
   x(i) = y(i-1)+1-a*((x(i-1))^2); 
   y(i) = b*x(i-1);
end
plot(x,y,'.')
end

