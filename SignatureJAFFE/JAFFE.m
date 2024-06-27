PATH = 'C:\DB\JAFFE\';
FILES = dir([PATH,'\*.pts']);

lmrk = [18,20,22,23,25,27,37,38,41,40,43,44,47,46,32,34,36,49,55,52,58];
%lmrk = 1:68;
lenT = nchoosek(length(lmrk),3);
% Fuzzy Tringel Sinature
FTS = zeros(length(FILES),lenT,5);
% Centroid Distance Signature
CDS = zeros(length(FILES),lenT,6);
% Tringel Side Signature
TSS = zeros(length(FILES),lenT);
% Centroid Distance Signature
emotions = {'NE','HA','SA','SU','AN','DI','FE'}; 
EMO = zeros(1,length(FILES));
%EXP = zeros(length(FILES),1);

h = waitbar(0,'Please wait computing Signatures ...');

for i = 1:length(FILES)
    disp(i)
    
    name = FILES(i).name;
    folder = FILES(i).folder;
    foldername = [folder,'\',name];
    
    % Get Emotions
    for j = 1:length(emotions)
        if contains(name,emotions{j})
            EMO(i) = j;
        end
    end
    
    temp = dlmread(foldername);
    pts = temp(lmrk,:);
        
    %FTS(i,:,:) = fuzzy_tringle_signature(pts); % mu_i
    CDS(i,:,:) = centroid_distance_signature(pts); %di/ri
    %TSS(i,:,:) = triangle_side_signature(pts);
    
    waitbar(i / length(FILES))
    
end

close(h)
I = eye(7);
EMO2 = I(EMO,:);

        
        