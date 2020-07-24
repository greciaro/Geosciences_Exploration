function dt = Odefun(t,xyz,rho)

dt = zeros(3,1);
xyz = zeros(3);
dt(1) = 10*(xyz(2)-xyz(1));
dt(2) = rho*xyz(1)-xyz(2)-xyz(1)*xyz(3);
dt(3) = xyz(1)*xyz(2)-(8/3)*xyz(3); 
