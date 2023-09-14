mona_lisa = rgb2gray(imread('D:\Dars\Masters\digital image processing\Homeworks\Images\5\mona lisa.jpg'));
level = 5;
%GUSSIAN PYRAMID CREATION
gussian_pyr = cell(1,level);
gussian_pyr{1} = mona_lisa;
figure;
subplot(2,3,1);imshow(gussian_pyr{1});title('Original');
for i=2:level
    gussian_pyr{i} = impyramid(gussian_pyr{i-1},'reduce');
    subplot(2,3,i);imshow(gussian_pyr{i}); title(strcat('gussian pyramid level=',int2str(i)));
end

laplacian_pyr = cell(1,level);
% LAPLACIAN PYRAMID CREATION
current_img = gussian_pyr{1};% cur_img = Gi
figure;
for i=1:level-1
    expanded = pixel_replication(gussian_pyr{i+1});%expand(Gi+1)
    if size(current_img,1) ~= size(expanded,1)
        expanded = expanded(1:size(expanded,1)-(size(expanded,1)-size(current_img,1)),:);
    end
    if size(current_img,2) ~= size(expanded,2)
        expanded = expanded(:,1:size(expanded,2)-(size(expanded,2)-size(current_img,2)));
    end
    laplacian_pyr{i} = double(current_img) - double(expanded); % Li = Gi - expanded (Gi+1)
    current_img = gussian_pyr{i+1};
    subplot(2,3,i);imshow(double(laplacian_pyr{i}),[]); title(strcat('laplacian pyramid level=',int2str(i)));
end
laplacian_pyr{level} = gussian_pyr{level};
subplot(2,3,level);imshow(double(laplacian_pyr{level}),[]); title(strcat('laplacian pyramid level=',int2str(level)));