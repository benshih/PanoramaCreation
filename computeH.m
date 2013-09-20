% Benjamin Shih
% Section 4.1: Implementation of non-normalized planar homography in 2D.

function [ H2to1 ] = computeH( p1, p2)
% p1 and p2 are 2xN matrices of corresponding (x,y)' coordinates between
% two images

    N = length(p1);
    
    A = zeros(2*N, 9);
    zerot = [0 0 0];
    
    % Construct the A matrix.
    for i=1:2:2*N
       %A(1, :) = [p1(:,1)' zerot -p1(:,1)'*p2(1,1)];
       %A(2, :) = [zerot p1(:,1)' -p1(:,1)'*p2(2,1)];
       n = (i+1)/2;
       A(i, :) = [p1(:,n)' zerot -p1(:,n)'*p2(1,n)];
       A(i+1, :) = [zerot p1(:,n)' -p1(:,n)'*p2(2,n)];
    end
    
    % In order to minimize the homography, we take the eigendecomposition
    % of A'*A, in order to find the eigenvector that corresponds to the
    % smallest eigenvalue. 
    [V,D] = eig(A'*A);
    [~, index] = min(diag(D));
    minEvec = V(:,index);
    
    % Output the homography matrix.
    H2to1 = reshape(minEvec, 3,3);
end

% It's okay that the resulting H2to1 matrix is scaled because a homography
% is only determined up to scale. 