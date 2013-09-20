% Benjamin Shih
% Section 4.2: Implementation of normalized planar homography in 2D.


function [ sim, H2to1 ] = computeH_norm( p1, p2)
% Normalize the coordinates p1 and p2 prior to calling compute_H. 

% p1 and p2 are 3xN matrices of corresponding (x,y)' coordinates between
% two images

% Translate the centroid of the points to the origin.
mux = mean(p1(1,:));
muy = mean(p1(2,:));
transx = p1(1,:) - mux;
transy = p1(2,:) - muy;

% Scale the points so that the average distance from the origin is sqrt(2).
avgDist = mean(sqrt(transx.^2 + transy.^2));
scale = sqrt(2)/avgDist;

sim = [scale 0 -scale*mux;
       0 scale -scale*muy;
       0 0 1];

normP1 = sim*p1;

% Translate the centroid of the points to the origin.
mux = mean(p2(1,:));
muy = mean(p2(2,:));
transx = p2(1,:) - mux;
transy = p2(2,:) - muy;

% Scale the points so that the average distance from the origin is sqrt(2).
avgDist = mean(sqrt(transx.^2 + transy.^2));
scale = sqrt(2)/avgDist;

sim = [scale 0 -scale*mux;
       0 scale -scale*muy;
       0 0 1];

normP2 = sim*p2;

% Compute H.
H2to1 = computeH(normP1, normP2);


end

