files = dir('*.png');
for i = 1:length(files)
    disp(i)
	name = files(i).name;
	I = imread(name);
	pts = dlmread(strrep(name,'png','pts'));
	lmrk = [18,20,22,23,25,27,37,38,41,40,43,44,47,46,32,34,36,49,55,52,58,61,65];
	Text = cell(1,length(lmrk));
	for j = 1:length(lmrk)
		Text{j} = num2str(j);
	end
	position = pts(lmrk,:);
	J = insertText(I,position,Text,'FontSize',10,'BoxColor',...
		'red','BoxOpacity',0.4,'TextColor','white','AnchorPoint','Center');
	imshow(J)
	imwrite(J,[name(1:end-4),'PlottedFace.jpg']);
end