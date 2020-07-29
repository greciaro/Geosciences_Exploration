function [] = fractures (n,m,s,p)
% n = 10;%number of fractures
% m = 30; %mean
% s = 5; %standard deviation
% p = .75; %probability to decide direction
x = unifrnd(0,100,1,n); %m
y = unifrnd(0,100,1,n); %m
px = unifrnd(0,1,1,n);
py= 1-px;
L = normrnd(m,s,1,n);
figure
plot(x,y,'ko');
hold on
for i = 1:n
    if px(i) >p
        plot([x(i)+(L(i)/2),x(i)-(L(i)/2)],[y(i),y(i)],'b');
    else
        plot([x(i),x(i)],[y(i)-(L(i)/2),y(i)+(L(i)/2)],'r');
    end
end
title({[num2str(n),' fractures with ',num2str(p),' of probability of E-W'];['Size mean',num2str(m),' and SD of ',num2str(s)]});
xlabel('E-W');
ylabel('S-N');
hold off
end