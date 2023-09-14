barbara = rgb2gray(imread('D:\Dars\Masters\digital image processing\\Homeworks\Images\4\Barbara.bmp'));
T14 = 1/4;
T18 = 1/8;
fft_barbara = fft2(barbara);
shift_fft_barbara = fftshift(fft_barbara);
figure; imshow(log(abs(shift_fft_barbara)),[]);title('Spectrum');
% filter a with T=1/4
reconstructed14a = lowpass_filter_a(barbara, T14, shift_fft_barbara);
figure;
subplot(1,3,1); imshow(barbara); title('Original');
subplot(1,3,2); imshow(reconstructed14a); title('Reconstructed by T = 1/4');
difference = double(barbara) - double(reconstructed14a);
subplot(1,3,3); imshow(difference,[]); title('Difference');
% filter a with T=1/8
reconstructed18a = lowpass_filter_a(barbara, T18, shift_fft_barbara);
figure;
subplot(1,3,1); imshow(barbara); title('Original');
subplot(1,3,2); imshow(reconstructed18a); title('Reconstructed by T = 1/8');
difference = double(barbara) - double(reconstructed18a);
subplot(1,3,3); imshow(difference,[]); title('Difference');
% filter b with T=1/4
reconstructed14b = lowpass_filter_b(barbara, T14, shift_fft_barbara);
figure;
subplot(1,3,1); imshow(barbara); title('Original');
subplot(1,3,2); imshow(reconstructed14b); title('Reconstructed by T = 1/4');
difference = double(barbara) - double(reconstructed14b);
subplot(1,3,3); imshow(difference,[]); title('Difference');
% filter b with T=1/8
reconstructed18b = lowpass_filter_b(barbara, T18, shift_fft_barbara);
figure;
subplot(1,3,1); imshow(barbara); title('Original');
subplot(1,3,2); imshow(reconstructed18b); title('Reconstructed by T = 1/8');
difference = double(barbara) - double(reconstructed18b);
subplot(1,3,3); imshow(difference,[]); title('Difference');
