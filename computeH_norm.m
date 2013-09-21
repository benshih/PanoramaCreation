% Benjamin Shih
% Section 4.2: Implementation of normalized planar homography in 2D.

function [H2to1norm] = computeH_norm(p1, p2)
    % Translate the centroid of the points to the origin.
    mu1x = mean(p1(1,:));
    mu1y = mean(p1(2,:));
    x1 = p1(1,:) - mu1x;
    y1 = p1(2,:) - mu1y;
    
    % Scale the points so that the average distance from the origin is sqrt(2).
    sc1x = mean(abs(x1));
    sc1y = mean(abs(y1));
    
    % Apply the similarity transformation to p1 in order to obtain p1'.
    sim1 = [1/sc1x 0 -mu1x/sc1x;0 1/sc1y -mu1y/sc1y;0 0 1];
    inv_sim1 = [sc1x 0 mu1x ; 0 sc1y mu1y; 0 0 1];
    p1norm = sim1*p1;
    
    % Compute the homography between p1' and p2. Apply the effects of
    % undoing the similarity transform by using the inverse of sim1 so that
    % we get a mapping from p1 to p2.
    H2to1 = computeH(p1norm, p2);
    H2to1norm = inv_sim1*H2to1;
end
