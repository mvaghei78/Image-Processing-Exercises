function saturation = calculate_saturation(rgb_image)
redChannel = rgb_image(:, :, 1);
greenChannel = rgb_image(:, :, 2);
blueChannel = rgb_image(:, :, 3);
x = min(min(redChannel,greenChannel),blueChannel);

y = (redChannel + greenChannel + blueChannel + 1e-4);
saturation = 1.0 - ((3.0 * x) ./ y);
saturation = saturation * 255.0;