function [hue, saturation, intensity] = rgb_to_hsi(rgb_image)
rgb_image = double(rgb_image) / 255.0;
hue = calculate_hue(rgb_image);
saturation = calculate_saturation(rgb_image);
intensity = calculate_intensity(rgb_image);
end