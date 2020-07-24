function dydt=vdp1(t,y,rho)
 
dydt=zeros(3,1);
dydt(1) = 10*(y(2)-y(1));
dydt(2) = rho*y(1)-y(2)-y(1)*y(3);
dydt(3) = y(1)*y(2)-(8/3)*y(3); 
