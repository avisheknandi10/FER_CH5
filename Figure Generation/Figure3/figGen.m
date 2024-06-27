I = imread('AB.jpg');
pts = dlmread('AB.pts');
lmrk = [18,20,22,23,25,27,37,38,41,40,43,44,47,46,32,34,36,49,55,52,58,61,65,63,67];
pts2 =  pts(lmrk,:);

[hog,vis] = triangle_image(pts2);%,name,EXP(i));


