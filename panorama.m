% Benjamin Shih
% Section 6: Creating a panorma image from multiple views of the same
% scene.




function [ H2to1 ] = q6_1( img1, img2, pts)


img1pts = pts(1:2,:);
img2pts = pts(3:4,:);

[~,H2to1] = computeH_norm(img1pts, img2pts);

outSize = [size(img1, 1), 3000];

end


