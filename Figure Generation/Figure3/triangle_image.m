function [hog1,visualization] = triangle_image(pts)

    len = length(pts);
    di = zeros(len,len,len);
    disp(size(di))
    for i = 1:len
        for j = 1:len
            for k = 1:len
                x = pts(i,:);
                y = pts(j,:);
                z = pts(k,:);
                
                a = sum(sqrt((x - y).^2));
                b = sum(sqrt((y - z).^2));
                c = sum(sqrt((z - x).^2));
                
                mx = max([a,b,c]);
                mn = min([a,b,c]);
                
                di(i,j,k) = (mx-mn)/(mx+mn);
                
                
            end
        end  
    end
    
    %di2 = reshape(di,[len,len*len]);
    CR = cell(5,5);
    
    for i = 1:5
        for j = 1:5
            CR{i,j} = di(:,:,i+(j-1)*5);
        end
    end
    
    img = cell2mat(CR);
    [hog1,visualization] = extractHOGFeatures(img,'CellSize',[5,5]);
    
    subplot(1,2,1);
    imshow(img);
    subplot(1,2,2);
    plot(visualization);
    
    imwrite(img,'SIM.jpg');
    %imwrite(visualization,'VIS.jpg');
    
end
    
    