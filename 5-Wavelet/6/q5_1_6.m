lena = rgb2gray(imread('D:\Dars\Masters\digital image processing\Homeworks\Images\5\Lena.bmp'));
cA = lena;
[LoR, HiR] = wfilters('haar','r');
figure;
subplot(2,2,1); imshow(lena,[]); title('Original');
gamma = 2;
for i=1:3
    % compute dwt of approximation image of previous level
    [cA,cH,cV,cD] = dwt2(cA, LoD, HiD, 'mode', 'symh');
    %now quantize values of coeficients
    quantized_cA = quantization(cA, gamma);
    quantized_cH = quantization(cH, gamma);
    quantized_cV = quantization(cV, gamma);
    quantized_cD = quantization(cD, gamma);
    reconstructed = idwt2(quantized_cA, quantized_cH, quantized_cV, quantized_cD, LoR, HiR);
    reconstructed_Resized = imresize(reconstructed, size(lena), 'nearest');
    peak_snr = psnr(uint8(reconstructed_Resized),uint8(lena));
    subplot(2,2,i+1); imshow(reconstructed,[]); title(strcat('reconstructed from Level=',int2str(i),' with psnr=',int2str(peak_snr)));
end
