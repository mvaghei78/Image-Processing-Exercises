lena = imread("D:\Dars\Masters\digital image processing\Homeworks\Images\6\Lena.bmp");
redChannel = lena(:, :, 1);
greenChannel = lena(:, :, 2);
blueChannel = lena(:, :, 3);
rgbImage = cat(3, redChannel, greenChannel, blueChannel);

levels = [64; 32; 16; 8];
quantized_images = zeros(size(redChannel));
figure;
subplot(2,3,1); imshow(rgbImage,[]); title('Original');
for i=1:size(levels)
    current_level = levels(i);
    red_quantized = uniform_quantize(redChannel, current_level);
    green_quantized = uniform_quantize(greenChannel, current_level);
    blue_quantized = uniform_quantize(blueChannel, current_level);
    quantized = cat(3, red_quantized, green_quantized, blue_quantized);

    mse_quantized = immse(lena, uint8(quantized))
    psnr_quantized = psnr(uint8(quantized), lena)
    quantized_to_show = uint8(cat(3, quantized(:,:,1), quantized(:,:,2), quantized(:,:,3)));
    subplot(2,3,i+1); imshow(quantized_to_show); title(strcat('Quantized with ',int2str(levels(i)),' Levels'));
end
