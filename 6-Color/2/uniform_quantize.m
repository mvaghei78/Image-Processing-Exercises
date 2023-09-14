function dst = uniform_quantize(img, num_levels)
[height, width] = size(img);
dst = zeros(height, width);
max_value = max(img(:));
min_value = min(img(:));
dynamic_range = max_value - min_value;
Q = zeros(256, 1);
step_size = dynamic_range / num_levels;
for i=1:256
    Q(i, 1) = floor((i - min_value) / step_size) * step_size + step_size / 2 + min_value;
end

for x=1:height
    for y=1:width
        dst(x, y) = Q(img(x,y),1);

    end
end

end