% Benjamin Shih
% Section 4.2: Implementation of normalized planar homography in 2D.

function [H2to1norm] = computeH_norm(p1, p2)
    % Translate the centroid of the points to the origin.
    % p1
    mu1x = mean(p1(1,:));
    mu1y = mean(p1(2,:));
    x1 = p1(1,:) - mu1x;
    y1 = p1(2,:) - mu1y;
    
    % Scale the points so that the average distance from the origin is sqrt(2).
    % p1
    sc1x = mean(abs(x1));
    sc1y = mean(abs(y1));
    
    sim1 = [1/sc1x 0 -mu1x/sc1x;0 1/sc1y -mu1y/sc1y;0 0 1];
    inv_sim1 = [sc1x 0 mu1x ; 0 sc1y mu1y; 0 0 1];
    p1norm = sim1*p1;
    
    H2to1 = computeH(p1norm, p2);
    H2to1norm = inv_sim1*H2to1;
end


% function [H2to1norm] = computeH_norm(p1, p2)
% 
%     % Translate the centroid of the points to the origin.
%     % p1
%     mu1x = mean(p1(1,:));
%     mu1y = mean(p1(2,:));
%     p1trans(1,:) = p1(1,:) - mu1x;
%     p1trans(2,:) = p1(2,:) - mu1y;
%     % p2
%     mu2x = mean(p2(1,:));
%     mu2y = mean(p2(2,:));
%     p2trans(1,:) = p2(1,:) - mu2x;
%     p2trans(2,:) = p2(2,:) - mu2y;
% 
% %     % Scale the points so that the average distance from the origin is sqrt(2).
% %     % p1
% %     xvec1 = p1trans(1,:);
% %     yvec1 = p1trans(2,:);
% %     avgDist1 = mean(sqrt(xvec1.^2 + yvec1.^2));
% %     scale1 = sqrt(2)/avgDist1;
% %     sim1 = [scale1  0       -scale1*mu1x;
% %             0       scale1  -scale1*mu1y;
% %             0       0       1];
% %     p1norm = sim1*p1;
% %     %p2
% %     xvec2 = p2trans(1,:);
% %     yvec2 = p2trans(2,:);
% %     avgDist2 = mean(sqrt(xvec2.^2 + yvec2.^2));
% %     scale2 = sqrt(2)/avgDist2;
% %     sim2 = [scale2  0       -scale2*mu2x;
% %             0       scale2  -scale2*mu2y;
% %             0       0       1];
% %     p2norm = sim2*p2;
% 
% scx1 = mean(abs(p1trans(1,:)));
% scy1 = mean(abs(p1trans(2,:)));
% sim1 = [1/scx1 0 -mu1x/scx1; 0 1/scy1 -mu1y/scy1; 0 0 1];
% p1norm = sim1*p1;
% 
% scx2 = mean(abs(p2trans(1,:)));
% scy2 = mean(abs(p2trans(2,:)));
% sim2 = [1/scx2 0 -mu2x/scx2; 0 1/scy2 -mu2y/scy2; 0 0 1];
% p2norm = sim2*p2;
% 
%     H2to1 = computeH(p1norm, p2norm)
%     %H2to1norm = sim2 * H2to1 * sim1^-1;
%     H2to1norm = sim1^-1*H2to1*sim2
% 
% 
% end


% function [ sim, H2to1 ] = computeH_norm( p1, p2)
% % Normalize the coordinates p1 and p2 prior to calling compute_H. 
% 
% % p1 and p2 are 3xN matrices of corresponding (x,y)' coordinates between
% % two images
% 
% % Translate the centroid of the points to the origin.
% mux = mean(p1(1,:));
% muy = mean(p1(2,:));
% transx = p1(1,:) - mux;
% transy = p1(2,:) - muy;
% 
% % Scale the points so that the average distance from the origin is sqrt(2).
% avgDist = mean(sqrt(transx.^2 + transy.^2));
% scale = sqrt(2)/avgDist;
% 
% sim = [scale 0 -scale*mux;
%        0 scale -scale*muy;
%        0 0 1];
% 
% normP1 = sim*p1;
% 
% % Translate the centroid of the points to the origin.
% mux = mean(p2(1,:));
% muy = mean(p2(2,:));
% transx = p2(1,:) - mux;
% transy = p2(2,:) - muy;
% 
% % Scale the points so that the average distance from the origin is sqrt(2).
% avgDist = mean(sqrt(transx.^2 + transy.^2));
% scale = sqrt(2)/avgDist;
% 
% sim = [scale 0 -scale*mux;
%        0 scale -scale*muy;
%        0 0 1];
% 
% normP2 = sim*p2;
% 
% % Compute H.
% H2to1 = computeH(normP1, normP2);
% 
% 
% end
% 
