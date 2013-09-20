% Benjamin Shih
% Section 6: Creating a panorma image from multiple views of the same
% scene.

img1 = imread('taj1r.jpg');
img2 = imread('taj2r.jpg');
pts = load('tajPts.mat');
pts = pts.tajPts;

q6_1(img1, img2, pts);