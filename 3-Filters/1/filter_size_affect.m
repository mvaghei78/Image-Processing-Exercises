img = imread("E:\Dars\Masters\digital image processing\Homeworks\Images\3\Elaine.bmp");
fig = figure;
subplot(2,3,1); imshow(img); title("Original Image");
padding_img = zeros(size(img)+2);
for i=3:2:11
    idx = floor(i/2)+1;
    boxfilter = ones(i)/(i.^2);
    filtered_img = apply_filter(img, boxfilter, i);
    imwrite(uint8(filtered_img),strcat("box_filter_",int2str(i),"_size.bmp"));
    subplot(2,3,idx); imshow(uint8(filtered_img)); title(strcat("box filter applied ",int2str(i)," size"));
end