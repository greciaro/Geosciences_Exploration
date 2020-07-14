function logstmovez
%function logstmovez(x0,n,r,c)

x0 = 0.3;
n = 100;
c = 1;
r = 1.8:0.001:3;

for k = 1:length(r)
  xx = zeros(1,n); xx(1) = x0;
    for j = 2:n, 
        dxx = r(k).*xx(j-1).*(1-xx(j-1)./c); 
        xx(j) = xx(j-1)+dxx; 
    end;
  plot(r,xx,'+'); 
  ylim([0 1.5]); 
%   title(['r = ' num2str(r(k))]);
drawnow
end


