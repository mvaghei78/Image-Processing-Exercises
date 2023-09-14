img = imread("E:\Dars\Masters\digital image processing\Homeworks\Images\3\Elaine.bmp");
noise_density = [0.01; 0.05; 0.1];
window_size = [3; 5; 7; 9; 11];
for ns=1:size(noise_density)
    % apply gussian noise with different densities
    noisy_img = imnoise(img, "gaussian", noise_density(ns));
    imwrite(uint8(noisy_img),strcat("gussian_noise_",num2str(noise_density(ns)),".bmp"));
    fig = figure;
    subplot(2,3,1); imshow(img); title(strcat("noisy image with density ",num2str(noise_density(ns))));
    % apply median filter on noisy image
    for ws=1:size(window_size)
        padding = floor(window_size(ws)/2);
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
        imwrite(improved_img,strcat("gussian_noise_",num2str(noise_density(ns)),"_median_",int2str(window_size(ws)),".bmp"));
        subplot(2,3,ws+1); imshow(improved_img); title(strcat("median size:",int2str(window_size(ws))," immse:",num2str(error)));
    end
    fig = figure;
    subplot(2,3,1); imshow(img); title(strcat("noisy image with density ",num2str(noise_density(ns))));
    % apply box filter on noisy image
    for ws=1:size(window_size)
        boxfilter = ones(window_size(ws))/(window_size(ws).^2);
        improved_img = apply_filter(noisy_img, boxfilter, window_size(ws));
        improved_img = uint8(improved_img);
        error = immse(img,improved_img);
        imwrite(improved_img,strcat("gussian_noise_",num2str(noise_density(ns)),"_box_",int2str(window_size(ws)),".bmp"));
        subplot(2,3,ws+1); imshow(improved_img); title(strcat("box size:",int2str(window_size(ws))," immse:",num2str(error)));
    end
end