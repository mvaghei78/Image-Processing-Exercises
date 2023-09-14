function filtered_img = apply_filter(img, filter, window_size)
padding = floor(window_size/2);
padding_img = zeros(size(img)+(padding*2));
padding_img((padding+1):size(padding_img,1)-padding,(padding+1):size(padding_img,2)-padding) = img;
filtered_img = zeros(size(img));
for i=1:size(img,1)
    for j=1:size(img,2)
        img_block = padding_img(i:i+(padding*2),j:j+(padding*2));
        filter_apply = img_block.*filter;
        pixel_value = sum(filter_apply,'all');
        filtered_img(i,j) = pixel_value;
    end
end