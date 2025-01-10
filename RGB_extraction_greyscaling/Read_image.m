% Reading and then displaying the image
% imread keyword to read, imshow to display
% Owner : Mann Manohar

clc 
clear all
close all

I = imread("image.jpg");
subplot(1,1,1);
imshow(I);
title("Original Image");