function dst = downsample_by_average_filter(img)
[height, width] = size(img);
dst_height = floor(height/2);
dst_width = floor(width/2);
dst = zeros(dst_height,dst_width);
for i=1:dst_height
    for j=1:dst_width
        block = img(2*i-1: 2*i, 2*j-1: 2*j);
        dst(i, j) = mean(block,'all');
    end
end