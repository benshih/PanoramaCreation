% Benjamin Shih
% Section 5.1: Sensitivity to Normalization

tic

close all
clear all

p = 100 * [-2 -1 0 1 2; 10 2 1 2 10];
p = [p; ones(1, length(p))];
ptest = [0; 300; 1];
    

pSize = size(p);

% Parameters for the normal distribution.
mu = 0;
sigma = 1;

numTrials = 1000;
noNormed = zeros(3, numTrials);
normed = zeros(3, numTrials);

for i=1:numTrials
    % Introduce Gaussian noise to the data.
    noise = mu + sigma .* randn(pSize);
    p_corrupt = p + noise;

    % Generate the homographies between the original and corrupted data.
    % The homographies produce 3x3 transformation matrices. 
    H2to1 = computeH(p, p_corrupt);
    H2to1norm = computeH_norm(p, p_corrupt);
    
    
    noNormed(:,i) = H2to1*ptest;
    %noNormed(:,i) = noNormed(:,i)./noNormed(3,i); % normalize
    %normed(:,i) = inv(sim)*Hnorm*ptest;
    normed(:,i) = H2to1norm*ptest;
    %normed(:,i) = normed(:,i)./normed(3,i); % normalize

    
end




noNormed(1,1:end) = noNormed(1,1:end)./noNormed(3,1:end);
noNormed(2,1:end) = noNormed(2,1:end)./noNormed(3,1:end);
noNormed(3,1:end) = noNormed(3,1:end)./noNormed(3,1:end);

normed(1,1:end) = normed(1,1:end)./normed(3,1:end);
normed(2,1:end) = normed(2,1:end)./normed(3,1:end);
normed(3,1:end) = normed(3,1:end)./normed(3,1:end);

% % % Translate the centroid of the points to the origin.
% % % p1
% % mu1x = mean(noNormed(1,:));
% % mu1y = mean(noNormed(2,:));
% % p1trans(1,:) = noNormed(1,:) - mu1x;
% % p1trans(2,:) = noNormed(2,:) - mu1y;
% % % p2
% % mu2x = mean(normed(1,:));
% % mu2y = mean(normed(2,:));
% % p2trans(1,:) = normed(1,:) - mu2x;
% % p2trans(2,:) = normed(2,:) - mu2y;
% % 
% % % Scale the points so that the average distance from the origin is sqrt(2).
% % % p1
% % xvec1 = p1trans(1,:);
% % yvec1 = p1trans(2,:);
% % avgDist1 = mean(sqrt(xvec1.^2 + yvec1.^2));
% % scale1 = sqrt(2)/avgDist1;
% % sim1 = [scale1  0       -scale1*mu1x;
% %         0       scale1  -scale1*mu1y;
% %         0       0       1];
% % p1norm = sim1*noNormed;
% % %p2
% % xvec2 = p2trans(1,:);
% % yvec2 = p2trans(2,:);
% % avgDist2 = mean(sqrt(xvec2.^2 + yvec2.^2));
% % scale2 = sqrt(2)/avgDist2;
% % sim2 = [scale2  0       -scale2*mu2x;
% %         0       scale2  -scale2*mu2y;
% %         0       0       1];
% % p2norm = sim2*normed;



%% Plot Results
% Plot the resulting point sets in a single plot in order to compare the
% normalized and un-normalized results. 

% noNormed = normBS(noNormed);
% normed = normBS(normed);

figure;
hold on;
plot(noNormed(1,1:end), noNormed(2,1:end), 'rx');
plot(normed(1,1:end), normed(2,1:end), 'bo');


%% Covariance Comparison
% Covariance of the transformed test point for both the normalized and
% un-normalized solution. 

% Remove the 3rd row from the point matrices such that we just have the 2xN
% matrices of points.
% Input: 3x1000
% Output 2x1000
normed = normed(1:2,:);
noNormed = noNormed(1:2,:);

% Find the covariance of the test points.
% Input: 2x1000
% Output: 1000x1000
covNormed = cov(normed);
covNoNormed = cov(noNormed);

% Find the standard deviations of the test points.
% Input: 1000x1000
% Output: 1000x1
stdevNormed = sqrt(diag(covNormed));
stdevNoNormed = sqrt(diag(covNoNormed));

% Find the radio of the stdev between the unnormalized and normalized
% points.
ratio = stdevNoNormed ./ stdevNormed;




toc