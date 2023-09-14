function show_matched_features(img1, img2, title1, title2)
% find SIFT features
img1_points = detectSIFTFeatures(img1,"EdgeThreshold",2);
img2_points = detectSIFTFeatures(img2,"EdgeThreshold",2);

% Extract the neighborhood features
[features1, valid_points1] = extractFeatures(img1, img1_points);
[features2, valid_points2] = extractFeatures(img2, img2_points);

% Retrieve the locations of matched points
indexPairs = matchFeatures(features1, features2);
matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);

% Display the matching points
figure; ax = axes;
showMatchedFeatures(img1, img2, matchedPoints1, matchedPoints2,"montag",Parent=ax);
title(ax,"Candidate point matches");
legend(ax, title1, title2);
end