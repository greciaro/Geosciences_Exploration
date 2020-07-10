function [] = logistic(r,x0,n)
%This program plots the bifurcation diagram of the Logistic function
%Input variables
% r = 1.8:0.001:3;
% x0 = 0.3;
% n = 100;
figure;
for i=1:length(r);
    x(1) = x0;
    x = zeros(1,n);x(1) = x0;
    for j=2:n;
        x1 = 1.-x(j-1);
        x2 = r(i)*x(j-1).*x1;
        x(j) = x(j-1)+x2;
    end
    plot(r(i),x(26:end),'+k','MarkerSize',4);hold on
%     plot(x,'k','MarkerSize',4);
%     drawnow; pause(0.5)
%     if i>25
%     plot(r,x,'+','MarkerSize',4);
%       ylim([0 1.5]);
%       title(['r = ' num2str(r(i))]);
%       drawnow;
% end
end
end

