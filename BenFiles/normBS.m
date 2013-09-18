% Benjamin Shih
% Section 5.1 Sensitivity to Normalization

function [ normP ] = normBS( p )
% Input: p is 3xN set of points in 2d, where N is the number of points
% Output: normP is a 3xN set of points in 2d, where N is the number of
% points, but normalized.

% Translate the centroid of the points to the origin.
mu = mean(p(:));
trans = p - mu;


% Scale the points so that the average distance from the origin is sqrt(2).
avgDist = sum(sqrt(trans(1,:).^2 + trans(2,:).^2))/length(trans(1,:));

normP = trans * sqrt(2) / avgDist;

end

