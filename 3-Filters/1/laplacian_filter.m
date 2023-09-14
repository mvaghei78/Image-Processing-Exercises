laplacianfilter = [0 -1 0; -1 5 -1;0 -1 0];
for i=1:5
    img_path = strcat("E:\Dars\Masters\digital image processing\Homeworks\Filters\1\box_filter_",int2str(i),"times.bmp");
    img = imread(img_path);
    fig = figure;
    subplot(2,3,1); imshow(img); title(strcat("box filter applied ",int2str(i)," times"));
    filtered_img = img;
    for j=1:5
        filtered_img = apply_filter(filtered_img,laplacianfilter,3);
        % we want to normalize output before passing to uint8 method
        fm = filtered_img - min(filtered_img(:));
        a = 255*(fm/max(fm(:)));
        imwrite(uint8(a),strcat("box_",int2str(i),"_laplacian_",int2str(j),"_times.bmp"));
        subplot(2,3,j+1); imshow(uint8(a)); title(strcat("laplacian filter applied ",int2str(j),"times"));
        %filtered_img = a;
    end
end