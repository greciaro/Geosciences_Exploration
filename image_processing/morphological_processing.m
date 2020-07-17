
% Morphological Processing
rice = imread('rice.png');
% imhist(rice);
se = strel('disk',12);
toohat_rice = imtophat(rice,se);
contrast_rice = imadjust(toohat_rice);
level = graythresh(rice);
brice = im2bw(rice,graythresh(rice));
bw = bwmorph(brice, 'majority',inf);
cc = bwconncomp(bw);
lbl = labelmatrix(cc);
stats = regionprops(bw,'all');
bslabel = bwlabel(bw);
close all;
figure;
subplot(3,2,1),imshow(rice),title('1.- ORIGINAL');
subplot(3,2,2),imshow(toohat_rice),title('2.- TOP-HAT FILTERED');
subplot(3,2,3),imshow(contrast_rice),title('3.- CONTRAST ADJUSTED');
subplot(3,2,4),imshow(brice),title('4.- BINARY IMAGE');
subplot(3,2,5),imshow(bw),title('5.- MAJORITY (0 OR 1)');
subplot(3,2,6),imshow(bslabel),title('');
figure;
subplot(1,2,1),hist([stats.MajorAxisLength]),title('GRAIN LENGHT');
subplot(1,2,2),hist([stats.MinorAxisLength]),title('GRAIN WIDHT');


