img = imread("E:\Dars\Masters\digital image processing\Homeworks\Images\3\Elaine.bmp");
noise_density = [0.05; 0.1; 0.2; 0.4];
window_size = [3; 5; 7; 9; 11];
for ns=1:size(noise_density)
    noisy_img = imnoise(img, 'salt & pepper', noise_density(ns));
    imwrite(uint8(noisy_img),strcat("noise_",num2str(noise_density(ns)),".bmp"));
    fig = figure;
    subplot(2,3,1); imshow(img); title(strcat("noisy image with density ",num2str(noise_density(ns))));
    for mf=1:size(window_size)
        padding = floor(window_size(mf)/2);
        padding_img = zeros(size(noisy_img)+(padding*2));
        padding_img((padding+1):size(padding_img,1)-padding,(padding+1):size(padding_img,2)-padding) = noisy_img;
        improved_img = zeros(size(noisy_img));
        for i=1:size(noisy_img,1)
            for j=1:size(noisy_img,2)
                img_block = padding_img(i:i+(padding*2),j:j+(padding*2));
                improved_img(i,j) = median(img_block(:));
            end
        end
        improved_img = uint8(improved_img);
        error = immse(img,improved_img);
        imwrite(improved_img,strcat("noise_",num2str(noise_density(ns)),"_median_",int2str(window_size(mf)),".bmp"));
        subplot(2,3,mf+1); imshow(improved_img); title(strcat("median size:",int2str(window_size(mf))," immse:",num2str(error)));
    end
end