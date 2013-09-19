% Benjamin Shih
% Section 5.1 Sensitivity to Normalization

function [ normP ] = normBS( p )
    % Input: p is 3xN set of points in 2d, where N is the number of points
    % Output: normP is a 3xN set of points in 2d, where N is the number of
    % points, but normalized.

%     % Translate the centroid of the points to the origin.
%     mux = mean(p(1,:));
%     muy = mean(p(2,:));
%     transx = p(1,:) - mux;
%     transy = p(2,:) - muy;
% 
%     % Scale the points so that the average distance from the origin is sqrt(2).
%     avgDist = mean(sqrt(transx.^2 + transy.^2));
%     scale = sqrt(2)/avgDist;
%     
%     sim = [scale 0 -scale*mux;
%            0 scale -scale*muy;
%            0 0 1];
%        
%     normP = sim*p;
    


end