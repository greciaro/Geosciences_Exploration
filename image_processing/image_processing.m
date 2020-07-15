
% DESCRIPTIVE TEXT

sh = imsharpen(satfilteredg3,'Radius',2,'Amount',1);
sh1 = imsharpen(satfilteredg3,'Radius',20,'Amount',10);
subplot(1,3,1);
imshow(satfilteredg3);
title('Gaussian Filtered 1000x1000 SD=50');
subplot(1,3,2);
imshow(sh);
title('Sharpened Image R=2 A=1');
subplot(1,3,3);
imshow(sh1);
title('Sharpened Image R=20 A=10');
g = fspecial('gaussian', [1000 1000], 0.5);
g1 = fspecial('gaussian', [10 10], 0.5);
g2 = fspecial('gaussian', [10 10], 50);
g3 = fspecial('gaussian', [1000 1000], 50);
satfilteredg = imfilter(sat, g);
satfilteredg1 = imfilter(sat, g1);
satfilteredg2 = imfilter(sat, g2);
satfilteredg3 = imfilter(sat, g3);
subplot(1,5,1);
imshow(sat);
title('Original');
subplot(1,5,2);
imshow(satfilteredg);
title('Gaussian Filtered 1000x1000 SD=0.5');
subplot(1,5,3);
imshow(satfilteredg1);
title('Gaussian Filtered 10x10 SD=0.5');
subplot(1,5,4);
imshow(satfilteredg2);
title('Gaussian Filtered 10x10 SD=50');
subplot(1,5,5);
imshow(satfilteredg3);
title('Gaussian Filtered 1000x1000 SD=50');


% Swapping around the RGB planes 
close all;
pprs = imread ('peppers.png'); 
red = pprs(:,:,1); % Red plane
green = pprs(:,:,2); % Green plane
blue = pprs(:,:,3); % Blue plane
base = zeros (size(pprs,1),size(pprs,2));
pprsred = cat(3,red,base,base);
pprsgreen = cat(3,base,green,base);
pprsblue = cat(3,base,base,blue);
pprsRGB = cat(3,red,green,blue);
pprsRBG = cat(3,red,blue,green);
pprsGBR = cat(3,green,blue,red);
pprsGRB = cat(3,green,red,blue);
pprsBRG = cat(3,blue,red,green);
pprsBGR = cat(3,blue,green,red);
subplot(4,4,1),imshow(pprs),title('ORIGINAL');
subplot(4,4,2),imshow(pprsred),title('RED');
subplot(4,4,3),imshow(pprsgreen),title('GREEN');
subplot(4,4,4),imshow(pprsblue),title('BLUE');
subplot(4,4,6),imshow(pprsRGB),title('RGB');
subplot(4,4,7),imshow(pprsGRB),title('GRB');
subplot(4,4,8),imshow(pprsBRG),title('BRG');
subplot(4,4,10),imshow(pprsRBG),title('RBG');
subplot(4,4,11),imshow(pprsGBR),title('GBR');
subplot(4,4,12),imshow(pprsBGR),title('BGR');


% Finding Edges
Image = imread ('circuit.tif'); %Read image
[I,thresh] = edge(Image);
default = edge(Image);
default_thresh = num2str(thresh);
subplot(1,4,1),imshow(Image),title('ORIGINAL');
subplot(1,4,2),imshow(default),title([' Default Threshold = ', default_thresh]);
thresh10 = thresh*.55;
edge10 = edge(Image,'sobel',thresh10);
subplot(1,4,3),imshow(edge10),title(['Threshold = ', num2str(thresh10)]);
thresh100 = thresh*(1e-90000);
edge100 = edge(Image,'sobel',thresh100);
subplot(1,4,4),imshow(edge100),title(['Threshold = ', num2str(thresh100)]);


% Tomography
close all
P = phantom('Modified Shepp-Logan',200);
theta = [0:1:179];
Ra = radon(P, theta);
Ir = iradon(Ra, theta);
subplot(3,3,1),imagesc(P), title('Phantom');
subplot(3,3,2),imagesc(Ra), title('Radon [0:1:179]');
subplot(3,3,3),imagesc(Ir), title('Iradon [0:1:179]');
theta1 = [0:5:180];
Ra1 = radon(P, theta1);
Ir1 = iradon(Ra1, theta1);
subplot(3,3,5),imagesc(Ra1), title('Radon [0:5:180]');
subplot(3,3,6),imagesc(Ir1), title('Iradon [0:5:180]');
theta2 = [0:1:90];
Ra2 = radon(P, theta2);
Ir2 = iradon(Ra2, theta2);
subplot(3,3,8),imagesc(Ra2), title('Radon [0:1:90]');
subplot(3,3,9),imagesc(Ir2), title('Iradon [0:1:90]');
figure;
subplot(1,4,1), imagesc(Ir2), title('Iradon [0:1:90]');
Ir3 = iradon(Ra2, theta2,'nearest');
subplot(1,4,2), imagesc(Ir3), title('Iradon [0:1:90] Nearest');
Ir4 = iradon(Ra2, theta2,'nearest','Cosine');
subplot(1,4,3), imagesc(Ir4), title('Iradon [0:1:90] Nearest Cosine');
Ir5 = iradon(Ra2, theta2,'nearest','Shepp-Logan');
subplot(1,4,4), imagesc(Ir5), title('Iradon [0:1:90] Nearest Shepp-Logan');


% DESCRIPTIVE TEXT
nebula_red = imread ('RingNebula_r.TIFF');
nebula_green = imread ('RingNebula_g.TIFF');
nebula_blue = imread ('RingNebula_b.TIFF');
figure;
imshow(nebula_red);
figure;
imshow(nebula_green);
figure;
imshow(nebula_blue);
B = medfilt2(nebula_red);
subplot(1,2,1),imshow(nebula_red);
subplot(1,2,2),imshow(B);
nebulaRGB = cat(3,nebula_red,nebula_green,nebula_blue);
x = .5.*double(nebula_red);
y = 1.*double(nebula_green);
z = 1.*double(nebula_blue);
x = uint8(x);
y = uint8(y);
z = uint8(z);
nebulaRGB1 = cat(3,x,y,z);
nebulaRGB2 = imadjust(nebulaRGB,[],[]);
subplot(1,3,1),imshow(nebulaRGB),title('Normal Combination');
subplot(1,3,2),imshow(nebulaRGB1),title('0.8 * Red');
subplot(1,3,3),imshow(nebulaRGB2),title('Automatic Adjustment');




