% Benjamin Shih
% Section 4.1: Implementation of non-normalized planar homography in 2D.

function [ H2to1 ] = computeH( p1, p2)
% p1 and p2 are 2xN matrices of corresponding (x,y)' coordinates between
% two images
    N = size(p2, 2);
    
    p1x = p1(1,:); 
    p1y = p1(2,:); 
    p2x = p2(1,:); 
    p2y = p2(2,:);
    
    % Generate the A matrix based on pairing all the matching feature
    % points and then minimizing the distance between the two point clouds
    % in order to obtain the homography. 
    zeroT = zeros(3, N);
    rowsXY = [p2x; p2y; ones(1,N)];
    A = [rowsXY zeroT; zeroT rowsXY; -p1x.*p2x -p1y.*p2x; -p1x.*p2y -p1y.*p2y; -p1x -p1y]';
    
    % Find the vector corresponding to the minimum eigenvector in the
    % matrix using SVD. In this case, it is equivalent to using eig in this
    % case because this matrix is positive semidefinite, so the minimum
    % eigenvalue is guaranteed to be positive
    [U,~,~] = svd(A'*A);
    H2to1 = (reshape(U(:,9), 3, 3))';
    
    % It's okay that the resulting H2to1 matrix is scaled because a homography
    % is only determined up to scale. 
end

