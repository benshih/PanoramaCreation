% Benjamin Shih
% Section 5.1: Sensitivity to Normalization

tic

close all
clear all

p = 100 * [-2 -1 0 1 2; 10 2 1 2 10; 1 1 1 1 1];
ptest = 100 * [0; 3; 1];
    

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
    H = computeH(p, p_corrupt);
    [sim, Hnorm] = computeH_norm(p, p_corrupt);
    
    
    noNormed(:,i) = H*ptest;
    %noNormed(:,i) = noNormed(:,i)./noNormed(3,i); % normalize
    normed(:,i) = inv(sim)*Hnorm*ptest;
    %normed(:,i) = normed(:,i)./normed(3,i); % normalize

    
end

%% Plot Results
% Plot the resulting point sets in a single plot in order to compare the
% normalized and un-normalized results. 

% noNormed = normBS(noNormed);
% normed = normBS(normed);

figure;
hold on;
plot(noNormed(1,1:end), noNormed(2,1:end), 'rx');
plot(normed(1,1:end), normed(2,1:end), 'bo');

toc