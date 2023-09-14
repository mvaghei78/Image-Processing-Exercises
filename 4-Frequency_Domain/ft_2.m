img_lena = rgb2gray(imread('E:\Dars\Masters\digital image processing\\Homeworks\Images\4\Lena.bmp'));
img_barbara = rgb2gray(imread('E:\Dars\Masters\digital image processing\\Homeworks\Images\4\Barbara.bmp'));
img_f16 = rgb2gray(imread('E:\Dars\Masters\digital image processing\\Homeworks\Images\4\F16.bmp'));
img_baboon = rgb2gray(imread('E:\Dars\Masters\digital image processing\\Homeworks\Images\4\Baboon.bmp'));

[f_magnitude,fshift_magnitude,f_magnitude_log,fshift_magnitude_log] = fft_and_magnitude(img_lena);
figure;
subplot(2,2,1);imshow(f_magnitude,[]);title('Lena magnitude without shift, without log');
subplot(2,2,2);imshow(fshift_magnitude,[]); title('Lena magnitude with shift, without log');
subplot(2,2,3);imshow(f_magnitude_log,[]); title('Lena magnitude without shift, with log');
subplot(2,2,4);imshow(fshift_magnitude_log,[]); title('Lena magnitude with shift, with log');

[f_magnitude,fshift_magnitude,f_magnitude_log,fshift_magnitude_log] = fft_and_magnitude(img_barbara);
figure;
subplot(2,2,1);imshow(f_magnitude,[]);title('Barbara magnitude without shift, without log');
subplot(2,2,2);imshow(fshift_magnitude,[]); title('Barbara magnitude with shift, without log');
subplot(2,2,3);imshow(f_magnitude_log,[]); title('Barbara magnitude without shift, with log');
subplot(2,2,4);imshow(fshift_magnitude_log,[]); title('Barbara magnitude with shift, with log');

[f_magnitude,fshift_magnitude,f_magnitude_log,fshift_magnitude_log] = fft_and_magnitude(img_f16);
figure;
subplot(2,2,1);imshow(f_magnitude,[]);title('F16 magnitude without shift, without log');
subplot(2,2,2);imshow(fshift_magnitude,[]); title('F16 magnitude with shift, without log');
subplot(2,2,3);imshow(f_magnitude_log,[]); title('F16 magnitude without shift, with log');
subplot(2,2,4);imshow(fshift_magnitude_log,[]); title('F16 magnitude with shift, with log');

[f_magnitude,fshift_magnitude,f_magnitude_log,fshift_magnitude_log] = fft_and_magnitude(img_baboon);
figure;
subplot(2,2,1);imshow(f_magnitude,[]);title('Baboon magnitude without shift, without log');
subplot(2,2,2);imshow(fshift_magnitude,[]); title('Baboon magnitude with shift, without log');
subplot(2,2,3);imshow(f_magnitude_log,[]); title('Baboon magnitude without shift, with log');
subplot(2,2,4);imshow(fshift_magnitude_log,[]); title('Baboon magnitude with shift, with log');