function [ H2to1 ] = computeH_norm( p1, p2)
% Normalize the coordinates p1 and p2 prior to calling compute_H. 

% p1 and p2 are 2xN matrices of corresponding (x,y)' coordinates between
% two images

% Translate the centroid of the points to the origin.
mu1 = mean(p1(:));
mu2 = mean(p2(:));

trans1 = p1 - mu1;
trans2 = p2 - mu2;


% Scale the points so that the average distance from the origin is sqrt(2).
avgDist1 = sum(sqrt(trans1(1,:).^2 + trans1(2,:).^2))/length(trans1(1,:));
avgDist2 = sum(sqrt(trans2(1,:).^2 + trans2(2,:).^2))/length(trans2(1,:));

p1norm = trans1 * sqrt(2) / avgDist1;
p2norm = trans2 * sqrt(2) / avgDist2;


% Compute H.
H2to1 = computeH(p1norm, p2norm);


end

