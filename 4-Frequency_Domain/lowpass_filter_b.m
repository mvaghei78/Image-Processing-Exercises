function reconstructed = lowpass_filter_b(img, T, shift_fft_img)
height = size(img,1);
width = size(img,2);
dst_b = zeros(height, width);
N = length(img);
for k=1:height
    for l=1:width
        if k <= T * N && k >= 0 && l <= T * N && l >= 0
            dst_b(k, l) = 0;
        elseif k <= T * N && k >= 0 && l <= (1 - T) * N && l >= N - 1
            dst_b(k, l) = 0;
        elseif k <= N - 1 && k >= (1 - T) * N && l <= T * N && l >= 0 
            dst_b(k, l) = 0;
        elseif k >= (1 - T) * N && l <= N - 1
            dst_b(k, l) = 0;
        else
            dst_b(k, l) = shift_fft_img(k, l);
        end
    end
end
back_ishift = ifftshift(dst_b);
reconstructed = abs(ifft2(back_ishift));
reconstructed = reconstructed * 255.0 / max(reconstructed(:));
reconstructed = uint8(reconstructed);