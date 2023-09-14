img1 = imread("D:\Dars\Masters\digital image processing\Homeworks\Images\7\sl.jpg");
img2 = imread("D:\Dars\Masters\digital image processing\Homeworks\Images\7\sm.jpg");
img3 = imread("D:\Dars\Masters\digital image processing\Homeworks\Images\7\sr.jpg");

show_matched_features(rgb2gray(img1), rgb2gray(img2), "Matched points sl", "Matched points sm");
show_matched_features(rgb2gray(img1), rgb2gray(img3), "Matched points sl", "Matched points sr");
show_matched_features(rgb2gray(img2), rgb2gray(img3), "Matched points sm", "Matched points sr");