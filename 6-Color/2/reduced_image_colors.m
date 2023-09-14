baboon = imread("D:\Dars\Masters\digital image processing\Homeworks\Images\6\Baboon.bmp");
redChannel = baboon(:, :, 1);
greenChannel = baboon(:, :, 2);
blueChannel = baboon(:, :, 3);
rgbImage = cat(3, redChannel, greenChannel, blueChannel);
Levels = [8; 16; 32];
figure;
subplot(4,1,1); imshow(rgbImage); title('Original');
for i=1:size(Levels)
    img_reduced = kmeans_color_quantize(baboon, Levels(i));
    red_reduced = img_reduced(:, :, 1);
    green_reduced = img_reduced(:, :, 2);
    blue_reduced = img_reduced(:, :, 3);
   
    img_reduced_to_show = cat(3, red_reduced, green_reduced, blue_reduced);
    subplot(4,1,i+1); imshow(img_reduced_to_show); title(strcat('Reduced to ',int2str(Levels(i)),'colors'));

    mse_value = immse(baboon, uint8(img_reduced_to_show))
    psnr_value = psnr(uint8(img_reduced_to_show), baboon)
end