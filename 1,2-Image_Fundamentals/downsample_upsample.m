A = imread("E:\Dars\Masters\digital image processing\Homeworks\Images\1\Goldhill.bmp");
%downsample without average filtering by removing one among the columns and rows
ds_without_avg = A(1:2:end,1:2:end);
% downsample with applying average filter on image
average_filter = ones(2)/4;
downsample_size = size(A)/2;
ds_with_avg = zeros(downsample_size);
for i = 2:2:size(A,1)-1
    for j = 2:2:size(A,2)-1
        temp = double(A(i-1:i,j-1:j)) .* average_filter;
        ds_with_avg(floor(i/2),floor(j/2)) = sum(temp(:));
    end
end
ds_with_avg = uint8(ds_with_avg);
imwrite(ds_without_avg,"down_sample_without_averaging.bmp");
imwrite(ds_with_avg,"down_sample_with_averaging.bmp");
% upsample with pixel replication
us_without_avg = pixelReplication(ds_without_avg);
us_with_avg = pixelReplication(ds_with_avg);
% upsample with Bilinear interpolation

% compute mse
mse_without_avg = immse(A, uint8(us_without_avg))
mse_with_avg = immse(A, uint8(us_with_avg))


