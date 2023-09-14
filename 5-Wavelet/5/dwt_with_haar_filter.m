lena = rgb2gray(imread('D:\Dars\Masters\digital image processing\Homeworks\Images\5\Lena.bmp'));
cA = lena;
[LoD, HiD] = wfilters('haar','d');
for i=1:3
    [cA,cH,cV,cD] = dwt2(cA, LoD, HiD, 'mode', 'symh');
    figure;
    subplot(2,2,1); imshow(cA,[]); title(strcat('Approximation Level=',int2str(i)));
    subplot(2,2,2); imshow(cH,[]); title(strcat('Horizontal Level=',int2str(i)));
    subplot(2,2,3); imshow(cV,[]); title(strcat('Vertical Level=',int2str(i)));
    subplot(2,2,4); imshow(cD,[]); title(strcat('Diagonal Level=',int2str(i)));
end
