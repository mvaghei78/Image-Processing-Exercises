function image_reduced = kmeans_color_quantize(img, clusters)
[height, width, ~] = size(img);
samples = zeros(height * width, 3);
count = 1;
for x=1:height
    for y=1:width
        samples(count,1) = img(x, y,1);
        samples(count,2) = img(x, y,2);
        samples(count,3) = img(x, y,3);
        count = count + 1;
    end
end
[labels, centers] = kmeans(samples,clusters,'maxiter',10000,'Display','iter','OnlinePhase','off');
centers = uint8(centers);
labels = uint8(labels);
image_reduced = centers(labels,:);
image_reduced = reshape(image_reduced, size(img));
image_reduced = imrotate(image_reduced, -90);
image_reduced = flip(image_reduced, 2);
end
