im = rgb2gray(imread('E:\Dars\Masters\digital image processing\\Homeworks\Images\4\Lena.bmp'));

filter_a = [1 2 1; 2 4 2; 1 2 1] * (1/16);
filter_b = [-1 -1 -1; -1 8 -1; -1 -1 -1];
filter_c = [0 -1 0; -1 5 -1; 0 -1 0];

% apply filters on original image
im_filter_a = filter2(filter_a,im);
im_filter_b = filter2(filter_b,im);
im_filter_c = filter2(filter_c,im);

figure;
subplot(2,2,1); imshow(im); title(strcat("Original"));
subplot(2,2,2); imshow(im_filter_a,[]); title(strcat("Convolved with filter (a)"));
subplot(2,2,3); imshow(im_filter_b,[]); title(strcat("Convolved with filter (b)"));
subplot(2,2,4); imshow(im_filter_c,[]); title(strcat("Convolved with filter (c)"));

% obtaining magnitude of fourier transform a,b,c
figure; 
fft_result = fft2(filter_a);
magnitude_with_shift = log(abs(fftshift(fft_result)));
magnitude_without_shift = log(abs(fft_result));
subplot(3,3,1);imshow(filter_a,[]);title('filter a');
subplot(3,3,2);imshow(magnitude_with_shift,[]); title('filter (a) magnitude with shift');
subplot(3,3,3);imshow(magnitude_without_shift,[]); title('filter (a) magnitude without shift');

fft_result = fft2(filter_b);
magnitude_with_shift = log(abs(fftshift(fft_result)));
magnitude_without_shift = log(abs(fft_result));
subplot(3,3,4);imshow(filter_b,[]);title('filter b');
subplot(3,3,5);imshow(magnitude_with_shift,[]); title('filter (b) magnitude with shift');
subplot(3,3,6);imshow(magnitude_without_shift,[]); title('filter (b) magnitude without shift');

fft_result = fft2(filter_c);
magnitude_with_shift = log(abs(fftshift(fft_result)));
magnitude_without_shift = log(abs(fft_result));
subplot(3,3,7);imshow(filter_c,[]);title('filter c');
subplot(3,3,8);imshow(magnitude_with_shift,[]); title('filter (c) magnitude with shift');
subplot(3,3,9);imshow(magnitude_without_shift,[]); title('filter (c) magnitude without shift');

% filter a is separable: filter_a = filter_a1 * filter_a2
filter_a1 = [1; 2; 1] * (1/4);
filter_a2 = [1 2 1] * (1/4);
im_filter_a1 = filter2(filter_a1,im);
im_filter_a2 = filter2(filter_a2,im);
figure;
subplot(1,3,1); imshow(im); title(strcat("Original"));
subplot(1,3,2); imshow(im_filter_a,[]); title(strcat("Convolved with filter [1; 2; 1] * (1/4)"));
subplot(1,3,3); imshow(im_filter_b,[]); title(strcat("Convolved with filter [1 2 1] * (1/4)"));

figure;
fft_result = fft2(filter_a1);
magnitude_with_shift = log(abs(fftshift(fft_result)));
magnitude_without_shift = log(abs(fft_result));
subplot(1,3,1);imshow(filter_a1,[]);title('filter [1; 2; 1] * (1/4)');
subplot(1,3,2);imshow(magnitude_with_shift,[]); title('magnitude with shift');
subplot(1,3,3);imshow(magnitude_without_shift,[]); title('magnitude without shift');

figure;
fft_result = fft2(filter_a2);
magnitude_with_shift = log(abs(fftshift(fft_result)));
magnitude_without_shift = log(abs(fft_result));
subplot(1,3,1);imshow(filter_a2,[]);title('filter [1 2 1] * (1/4)');
subplot(1,3,2);imshow(magnitude_with_shift,[]); title('magnitude with shift');
subplot(1,3,3);imshow(magnitude_without_shift,[]); title('magnitude without shift');

