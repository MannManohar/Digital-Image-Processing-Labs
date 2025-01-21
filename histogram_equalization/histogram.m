% Clear workspace, command window, and close all figures for a fresh start
clc
clear all
close all

% Open a dialog box for selecting an image file
[filename, pathname] = uigetfile({'*.jpg;*.jpeg;*.png;*.bmp', 'Image Files (*.jpg,*.jpeg,*.png,*.bmp)';
                                '*.*', 'All Files (*.*)'}, ...
                                'Select an Image File');
                            
% Error handling: Check if user pressed cancel in file dialog
% isequal(filename,0) is true if user cancelled selection
if isequal(filename,0) || isequal(pathname,0)
    disp('User canceled file selection');
    return;
else
    % Combine pathname and filename to get complete file path
    % fullfile ensures correct path separator for the operating system
    fullpath = fullfile(pathname, filename);
    img = imread(fullpath);  % Read the image into MATLAB
end

% Convert color image to grayscale
% If image is already grayscale, this won't affect it
gray_img = rgb2gray(img);

% Calculate histogram of original image
% 'Normalization','probability' makes the histogram sum to 1
[counts, bins] = histcounts(gray_img, 256, 'Normalization', 'probability');
% Calculate cumulative distribution function (CDF)
cdf = cumsum(counts);

% Perform histogram equalization
% histeq spreads out the most frequent intensity values
eq_img = histeq(gray_img);

% Calculate histogram and CDF of equalized image
% This helps us verify the equalization effect
[eq_counts, eq_bins] = histcounts(eq_img, 256, 'Normalization', 'probability');
eq_cdf = cumsum(eq_counts);

% Create a new figure window with specified size
% Position: [left bottom width height]
figure('Position', [100 100 1200 800]);

% Create 2x3 subplot grid for visualizations
% First row shows original image analysis
subplot(2,3,1);
imshow(gray_img);
title('Original Grayscale Image');

subplot(2,3,2);
bar(bins(1:end-1), counts, 'b');  % Blue bars for histogram
title('Original Histogram');
xlabel('Pixel Value');
ylabel('Probability');
grid on;

subplot(2,3,3);
plot(bins(1:end-1), cdf, 'r', 'LineWidth', 1.5);  % Red line for CDF
title('Original Cumulative Histogram');
xlabel('Pixel Value');
ylabel('Cumulative Probability');
grid on;

% Second row shows results after equalization
subplot(2,3,4);
imshow(eq_img);
title('Histogram Equalized Image');

subplot(2,3,5);
bar(eq_bins(1:end-1), eq_counts, 'b');  % Blue bars for equalized histogram
title('Equalized Histogram');
xlabel('Pixel Value');
ylabel('Probability');
grid on;

subplot(2,3,6);
plot(eq_bins(1:end-1), eq_cdf, 'r', 'LineWidth', 1.5);  % Red line for equalized CDF
title('Equalized Cumulative Histogram');
xlabel('Pixel Value');
ylabel('Cumulative Probability');
grid on;

% Add main title to the figure showing the filename
sgtitle(['Image Histogram Equalization Analysis: ' filename]);