function [f_magnitude,fshift_magnitude,f_magnitude_log,fshift_magnitude_log] = fft_and_magnitude(img)
f = fft2(img);
fshift = fftshift(f);
f_magnitude = abs(f);
fshift_magnitude = abs(fshift);
f_magnitude_log = log(f_magnitude);
fshift_magnitude_log = log(fshift_magnitude);