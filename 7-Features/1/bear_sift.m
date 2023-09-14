img1 = imread("D:\Dars\Masters\digital image processing\Homeworks\Images\7\books2.jpg");
img2 = imread("D:\Dars\Masters\digital image processing\Homeworks\Images\7\books3.jpg");
img3 = imread("D:\Dars\Masters\digital image processing\Homeworks\Images\7\books4.jpg");

show_matched_features(rgb2gray(img1), rgb2gray(img2), "Matched points books1", "Matched points books2");
show_matched_features(rgb2gray(img1), rgb2gray(img3), "Matched points books1", "Matched points books3");
show_matched_features(rgb2gray(img2), rgb2gray(img3), "Matched points books2", "Matched points books3");