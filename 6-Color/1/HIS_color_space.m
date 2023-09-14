lena = imread("D:\Dars\Masters\digital image processing\Homeworks\Images\6\Lena.bmp");
redChannel = lena(:, :, 1);
greenChannel = lena(:, :, 2);
blueChannel = lena(:, :, 3);
% plot red green and blue channels seperately
figure;
rgbImage = cat(3, redChannel, greenChannel, blueChannel);
subplot(2,2,1);colormap gray;imshow(rgbImage);title('Original');
subplot(2,2,2);colormap gray;imshow(redChannel); title('Red channel');
subplot(2,2,3);colormap gray;imshow(greenChannel); title('Green channel');
subplot(2,2,4);colormap gray;imshow(blueChannel); title('Blue channel');
[hue, saturation, intensity] = rgb_to_hsi(rgbImage);
figure;
% plot Hue and saturation and intensity
subplot(1,3,1);colormap gray;imshow(hue,[]); title('Hue');
subplot(1,3,2);colormap gray;imshow(saturation,[]); title('Saturation');
subplot(1,3,3);colormap gray;imshow(intensity,[]); title('Intensity');