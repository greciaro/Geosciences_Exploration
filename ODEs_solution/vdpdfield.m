function vdpdfield

mu = 5;

[y1,y2]=meshgrid(-2:0.25:2,-8:0.5:8);

dy1 = y2;
dy2 = mu*(1 - y1.^2).*y2 - y1;

quiver(y1, y2, dy1, dy2, 4);


pause

svert = stream2(y1,y2,dy1,dy2,y1,y2);
streamparticles(svert,0.01,'animate',3,'markersize',5);

