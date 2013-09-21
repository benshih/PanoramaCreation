% Benjamin Shih
% Section 6.1: Creating a panorma image from multiple views of the same
% scene.

function [ H2to1 ] = q6_1( img1, img2, pts)

    % Generate the 3xN matrices that represent the points.
    % Input: 4x1048
    % Output: 3x1048
    img1pts = pts(1:2,:);
    img1pts = [pts(1:2,:); ones(1,length(img1pts))];
    img2pts = pts(3:4,:);
    img2pts = [pts(3:4,:); ones(1,length(img2pts))];

    % Compute the homographies between the matching feature points. 
    [H2to1] = computeH(img1pts, img2pts);
    [H2to1norm] = computeH_norm(img1pts, img2pts);

    % Warp the second image based on the homography. 
    outSize = [size(img1, 1), 3000];
    warp2 = warpH(img2, H2to1norm, outSize);

    % Combine img1 and the warped image in order to generate the partial
    % panorama.
    finalImg = warp2;
    dimen = size(img1);
    finalImg(1:dimen(1), 1:dimen(2), :) = img1;

    % Display and label the images. 
    close all
    figure;
    subplot(1,3,1); imshow(img1); title('original img');
    subplot(1,3,2); imshow(warp2); title('warped image');
    subplot(1,3,3); imshow(finalImg); title('panorama image');

end

