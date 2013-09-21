% Benjamin Shih
% Section 6.2: Creating a transformation to fit the entire image in the
% panorama.

function [ H2to1 ] = q6_2( img1, img2, pts)

    close all
    
    % Generate the 3xN matrices that represent the points.
    % Input: 4x1048
    % Output: 3x1048
    img1pts = pts(1:2,:);
    img1pts = [pts(1:2,:); ones(1,length(img1pts))];
    img2pts = pts(3:4,:);
    img2pts = [pts(3:4,:); ones(1,length(img2pts))];

    [H2to1norm] = computeH_norm(img1pts, img2pts);
    
    %transImg = H2to1norm * 
    
    % find a matrix M and out_size in terms of H2to1 
    % and size(im1), size(im2) such that:
    firstPix = find(img1, 1, 'first');
    lastPix = find(img2, 1, 'last');
    
    im1size = size(img1);
    im2size = size(img2);
    
    % Unwarped boundaries.
    topleft = [1; 1; 1];
    topright = [im1size(2); 1; 1];
    botleft = [1; im1size(1); 1];
    botright = [im1size(2); im1size(1); 1];
    
    % Warped boundaries, plus normalizing the scaling.
    warpTL = H2to1norm*topleft;
    warpTR = H2to1norm*topright;
    warpBL = H2to1norm*botleft;
    warpBR = H2to1norm*botright;
    warpTL(1:3) = warpTL(1:3)./warpTL(3);
    warpTR(1:3) = warpTR(1:3)./warpTR(3);
    warpBL(1:3) = warpBL(1:3)./warpBL(3);
    warpBR(1:3) = warpBR(1:3)./warpBR(3);

    
    
    
    
    xLimit = 1608;
    
    scx = xLimit/(size(img1,2)+size(img2,2));
    scx = 1;
    scy = 1;
    mux = 0;
    muy = 0;
    M = [scx 0 mux ; 0 scy muy; 0 0 1];
    out_size = [size(img1, 1)+size(img2, 1), xLimit];

    warp_im1 = warpH(img1, M, out_size);
    warp_im2 = warpH(img2, M*H2to1norm, out_size);
    
    % Index into matrix images using 'logical' data type to skip for loop
    % usage. 
    finalImg = warp_im1 + warp_im2;
    overlap = warp_im1 & warp_im2;
    finalImg(overlap) = warp_im1(overlap);

    close all
    figure;
    subplot(1,3,1); imshow(warp_im1); title('warped image 1');
    hold on
    plot(topleft(1), topleft(2), 'ro');
    plot(topright(1), topright(2), 'ro');
    plot(botleft(1), botleft(2), 'ro');
    plot(botright(1), botright(2), 'ro');
    hold off
    
    subplot(1,3,2); imshow(warp_im2); title('warped image 2');
    hold on
    plot(warpTL(1), warpTL(2), 'ro');
    plot(warpTR(1), warpTR(2), 'ro');
    plot(warpBL(1), warpBL(2), 'ro');
    plot(warpBR(1), warpBR(2), 'ro');    
    hold off
    
    subplot(1,3,3); imshow(finalImg); title('panorama image');

    


end