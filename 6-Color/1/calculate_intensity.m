function intensity = calculate_intensity(rgb_image)
redChannel = rgb_image(:, :, 1);
greenChannel = rgb_image(:, :, 2);
blueChannel = rgb_image(:, :, 3);
intensity = (redChannel + greenChannel + blueChannel) / 3.0;
intensity = intensity * 255.0;