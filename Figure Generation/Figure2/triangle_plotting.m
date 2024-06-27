files = dir('*.png');
for i = 1:length(files)
	name = files(i).name;
	I = imread(name);
	pts = dlmread(strrep(name,'png','pts'));
	lmrk = [18,20,22,23,25,27,37,38,41,40,43,44,47,46,32,34,36,49,55,52,58,61,65];
	
    pts2 =  pts(lmrk,:);

    T = get_lines(pts2);
    T2 = T(1:2:end,:); 

    J = insertShape(I,'Line',T2,'Color','cyan');%,'LineWidth',2,'Color','cyan','Opacity','0.4');
    imshow(J)
    imwrite(J,[name(1:end-4),'line_plotted_face.jpg']);
end
