function hue = calculate_hue(rgb_image)
redChannel = rgb_image(:, :, 1);
greenChannel = rgb_image(:, :, 2);
blueChannel = rgb_image(:, :, 3);
[height, width] = size(redChannel);
hue = zeros(height, width);
for x=1:height
    for y=1:width
        temp = ((redChannel(x, y) - greenChannel(x, y)) + (redChannel(x, y) - blueChannel(x, y))); %(R-G)+(R-B)
        temp2 = power(redChannel(x, y) - greenChannel(x, y), 2); % (R-G).^2
        temp3 = (redChannel(x, y) - blueChannel(x, y)) * (greenChannel(x, y) - blueChannel(x, y)); % (R-B)(G-B)
        arg = (0.5 * temp) / sqrt(temp2 + temp3);
        theta = acos(arg);
        if blueChannel(x, y) > greenChannel(x, y)
            hue(x,y) = 2.0 * pi - theta;
        else
            hue(x,y) = theta;
        end
    end
end    
hue = hue / (2.0 * pi);
hue = hue * 255.0;
end