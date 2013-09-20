% Benjamin Shih
% Section 6: Creating a panorma image from multiple views of the same
% scene.

% img1 = imread('taj1r.jpg');
% img2 = imread('taj2r.jpg');
% pts = load('tajPts.mat');
% pts = pts.tajPts;

function [ H2to1 ] = q6_1( img1, img2, pts)

% Generate the 3xN matrices that represent the points.
% Input: 4x1048
% Output: 3x1048
img1pts = pts(1:2,:);
img1pts = [pts(1:2,:); ones(1,length(img1pts))];
img2pts = pts(3:4,:);
img2pts = [pts(3:4,:); ones(1,length(img2pts))];

[H2to1] = computeH(img1pts, img2pts);
%[~,H2to1] = computeH_norm(img1pts, img2pts);

outSize = [size(img1, 1), 3000];

warpedImg = warpH(img2, H2to1, outSize);

finalImg = warpedImg;
dimen = size(img1);
finalImg(1:dimen(1), 1:dimen(2), :) = img1;

close all
figure;
imshow(warpedImg);
title('warped image');
figure;
imshow(finalImg)
title('panorama image');


