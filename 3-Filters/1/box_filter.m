img = imread("E:\Dars\Masters\digital image processing\Homeworks\Images\3\Elaine.bmp");
boxfilter = ones(3)/9;
fig = figure;
subplot(2,3,1); imshow(img); title("Original Image");
filtered_img = img;
for i=1:5
    filtered_img = apply_filter(filtered_img,boxfilter,3);
    imwrite(uint8(filtered_img),strcat("box_filter_",int2str(i),"times.bmp"));
    subplot(2,3,i+1); imshow(uint8(filtered_img)); title(strcat("box filter applied ",int2str(i),"times"));
end