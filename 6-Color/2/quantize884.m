lena = imread("D:\Dars\Masters\digital image processing\Homeworks\Images\6\Lena.bmp");
redChannel = lena(:, :, 1);
greenChannel = lena(:, :, 2);
blueChannel = lena(:, :, 3);
rgbImage = cat(3, redChannel, greenChannel, blueChannel);

red_quantized_8 = uniform_quantize(redChannel, 8);
green_quantized_8 = uniform_quantize(greenChannel, 8);
blue_quantized_4 = uniform_quantize(blueChannel, 4);
quantized_884_to_show = cat(3, red_quantized_8, green_quantized_8, blue_quantized_4);
blue_quantized_8 = uniform_quantize(blueChannel, 8);
quantized_8_to_show = cat(3, red_quantized_8, green_quantized_8, blue_quantized_8);

figure;
subplot(3,1,1); imshow(rgbImage); title('Original');
subplot(3,1,2); imshow(uint8(quantized_884_to_show)); title('Quantized with 8-8-4 Levels for RGB Respectively');
subplot(3,1,3); imshow(uint8(quantized_8_to_show)); title('Quantized with 8 Levels');