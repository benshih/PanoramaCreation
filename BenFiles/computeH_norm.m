% Benjamin Shih
% Section 4.2: Implementation of normalized planar homography in 2D.


function [ H2to1 ] = computeH_norm( p1, p2)
% Normalize the coordinates p1 and p2 prior to calling compute_H. 

% p1 and p2 are 2xN matrices of corresponding (x,y)' coordinates between
% two images


% Compute H.
H2to1 = computeH(normBS(p1), normBS(p2));


end

