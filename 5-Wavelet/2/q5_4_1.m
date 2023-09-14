lena = rgb2gray(imread('D:\Dars\Masters\digital image processing\\Homeworks\Images\5\Lena.bmp'));
temp = lena;
fig2 = figure;
figure(1); subplot(2,2,1); imshow(lena); title('Original');
figure(2); subplot(2,2,1); imshow(lena); title('Original');
for i=1:3
    approx_img = downsample_by_average_filter(temp);
    prediction_residual = double(temp) - pixel_replication(approx_img);
    temp = approx_img;
    figure(1); subplot(2,2,i+1); imshow(uint8(temp)); title(strcat('Approximation Level=',int2str(i)));
    figure(2); subplot(2,2,i+1); imshow(prediction_residual,[]); title(strcat('Prediction Residual Level=',int2str(i)));
end