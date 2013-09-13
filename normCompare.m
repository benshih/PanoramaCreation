% Benjamin Shih
% Section 5: Sensitivity to Normalization

tic

close all
clear all

p = 100 * [-2 -1 0 1 2; 10 2 1 2 10];
ptest = 100 * [0; 3];

pSize = size(p);

% Parameters for the normal distribution.
mu = 0;
sigma = 1;

numTrials = 1000;

for i=1:numTrials
    % Introduce Gaussian noise to the data.
    noise = mu + sigma .* randn(pSize);
    p_corrupt = p + noise;

    % Generate the homographies between the original and corrupted data.
    % The homographies produce 3x3 transformation matrices. 
    H = computeH(p, p_corrupt);
    Hnorm = computeH_norm(p, p_corrupt);
    
    % Apply the homographies to the test point.
    % q: dimension mismatch?
    
end



toc