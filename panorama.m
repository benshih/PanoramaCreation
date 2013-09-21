% Benjamin Shih
% Section 6: Creating a panorma image from multiple views of the same
% scene.

img1 = imread('taj1r.jpg');
img2 = imread('taj2r.jpg');
pts = load('tajPts.mat');
pts = pts.tajPts;

%% 6.1
q6_1(img1, img2, pts);

%% 6.2
q6_2(img1, img2, pts);