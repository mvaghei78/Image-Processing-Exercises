A = imread("E:\Dars\Masters\digital image processing\Homeworks\Images\1\Elaine.bmp");
Levels = [4 8 16 32 64 128];
for i=1:size(Levels,2)
    %resize figure to 1000*600 pixel
    fig = figure;
    width=1000;
    height=600;
    set(fig,'position',[0,0,width,height])
    %quantize image
    image_copy = double(A);
    fm = image_copy - min(image_copy(:));
    quantized_image = floor((Levels(i)-1) * (fm/max(fm(:))));
    % we want to show quantized image so we should convert [0:3] value range to [0:255] range
    a = quantized_image/max(quantized_image(:));
    b = uint8(255 * (a));
    %d = unique(c(:));
    % after quantization we equalize image with histeq and put the result in equalized_image variable
    equalized_image = histeq(b);
    % compute mse for equalized and non equalized images
    mse_without_eq = immse(A, b);
    mse_with_eq = immse(A, equalized_image);
    % here we show the result in figure
    subplot(2,2,1), imshow(b);
    title(strcat(int2str(Levels(i)),' Levels without equalization with mse=', num2str(mse_without_eq)));
    subplot(2,2,2), imshow(equalized_image);
    title(strcat(int2str(Levels(i)),' Levels with equalization with mse=', num2str(mse_with_eq)));
    subplot(2,2,3), imhist(b);
    title('histogram of nonequalized image');
    subplot(2,2,4), imhist(equalized_image);
    title('histogram of equalized image');
    %save figure and image results
    saveas(fig,strcat(int2str(Levels(i)),'Levels_result.png'));
    imwrite(b,strcat(int2str(Levels(i)),'L_noneq_img.png'));
    imwrite(equalized_image,strcat(int2str(Levels(i)),'L_eq_img.png'));
    pause(1);
end


