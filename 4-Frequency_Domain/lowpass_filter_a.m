function reconstructed = lowpass_filter_a(img, T, shift_fft_img)
height = size(img,1);
width = size(img,2);
dst_a = zeros(height, width);
N = length(img);
% TN< {k,l} <(1-T)N
for k=1:height
    for l=1:width
        if k < T * N && k > (1 - T) * N && l < T * N && l > (1 - T) * N
            dst_a(k,l) = 0;
        else
            dst_a(k,l) = shift_fft_img(k, l);
        end
    end
end
back_ishift = ifftshift(dst_a);
reconstructed = abs(ifft2(back_ishift));
reconstructed = reconstructed * 255.0 / max(reconstructed(:));
reconstructed = uint8(reconstructed);