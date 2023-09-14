harris_img = imread("D:\Dars\Masters\digital image processing\Homeworks\Images\7\harris.JPG");
redChannel = harris_img(:, :, 1);
greenChannel = harris_img(:, :, 2);
blueChannel = harris_img(:, :, 3);
harris_img_rgb = cat(3, redChannel, greenChannel, blueChannel);
harris_img_gray = double(rgb2gray(harris_img));

% Compute Gaussian derivatives at each pixel
guassian_kernel = [1 2 1; 2 4 2; 1 2 1] * 1/16;
filtered_harris_img = conv2(harris_img_gray, guassian_kernel, 'same');

% Compute second moment matrix M in a Gaussian window around each pixel
sobel_x_kernel = [-1 0 1; -2 0 2; -1 0 1];
sobel_y_kernel = [1 2 1; 0 0 0; -1 -2 -1];

Ix = conv2(filtered_harris_img, sobel_x_kernel, 'same');
Iy = conv2(filtered_harris_img, sobel_y_kernel, 'same');

Ix2 = Ix.^2;
Iy2 = Iy.^2;
IxIy = Ix.*Iy;

g_Ix2 = conv2(Ix2, guassian_kernel, 'same');
g_Iy2 = conv2(Iy2, guassian_kernel, 'same');
g_IxIy = conv2(IxIy, guassian_kernel, 'same');
alpha = 0.05;
R_matrix = (g_Ix2 .* g_Iy2) - (g_IxIy.^2) - (alpha * (square(g_Ix2 + g_Iy2)));
min(R_matrix(:))
max(R_matrix(:))
%R_matrix = (R_matrix - min(R_matrix(:)))./(max(R_matrix(:))-min(R_matrix(:)));
R_matrix = normalize(R_matrix,'range', [0,1]);
% threshold R_matrix
threshold = 0.8;
[row, col] = find(R_matrix >= threshold);
key_points = cat(2, row, col);
% Find local maxima of response function (non-maximum suppression)
corner_points = [0 0];
for kp=1:length(key_points)
    row = key_points(kp,1);
    col = key_points(kp,2);
    if R_matrix(row, col) > 0
        corner_points = cat(1, corner_points, [col row]);
    end
end
corner_points = corner_points(2:length(corner_points),:);
% draw corners on image
corner_detected_image = insertMarker(harris_img_rgb, corner_points, 'o', 'Color', 'red','size',2);
figure;
subplot(1, 2, 1); imshow(harris_img_rgb); title("Original");
subplot(1, 2, 2); imshow(corner_detected_image); title("Corner Detected");

figure;
points = detectHarrisFeatures(harris_img_gray);
imshow(harris_img_rgb); hold on; plot(points.selectStrongest(100));