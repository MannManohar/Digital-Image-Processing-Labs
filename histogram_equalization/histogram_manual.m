%Histogram equalization with manual method
%Author : Mann Manohar
clc
clear all
close all

% Open a dialog box for selecting an image file
[filename, pathname] = uigetfile({'*.jpg;*.jpeg;*.png;*.bmp', 'Image Files (*.jpg,*.jpeg,*.png,*.bmp)';
                                '*.*', 'All Files (*.*)'}, ...
                                'Select an Image File');
                            
% Error handling
if isequal(filename,0) || isequal(pathname,0)
    disp('User canceled file selection');
    return;
else
    fullpath = fullfile(pathname, filename);
    img = imread(fullpath);
end

% Convert to grayscale
gray_img = rgb2gray(img);

% Calculate histogram of original image
[counts, bins] = histcounts(gray_img, 256, 'Normalization', 'probability');
cdf = cumsum(counts);

% Manual Histogram Equalization
% Step 1: Get image dimensions
[M, N] = size(gray_img);
total_pixels = M * N;

% Step 2: Calculate frequency of each intensity level (0-255)
freq = zeros(256, 1);
for i = 1:M
    for j = 1:N
        value = gray_img(i,j);
        freq(value + 1) = freq(value + 1) + 1;
    end
end

% Step 3: Calculate probability distribution
pdf = freq / total_pixels;

% Step 4: Calculate cumulative distribution function
cdf = zeros(256, 1);
cdf(1) = pdf(1);
for i = 2:256
    cdf(i) = cdf(i-1) + pdf(i);
end

% Step 5: Scale CDF to 0-255 range and create mapping
mapping = round(cdf * 255);

% Step 6: Apply mapping to create equalized image
eq_img = zeros(M, N, 'uint8');
for i = 1:M
    for j = 1:N
        eq_img(i,j) = mapping(gray_img(i,j) + 1);
    end
end

% Calculate histogram of equalized image
[eq_counts, eq_bins] = histcounts(eq_img, 256, 'Normalization', 'probability');
eq_cdf = cumsum(eq_counts);

% Create visualization
figure('Position', [100 100 1200 800]);

% First row - Original image and its histograms
subplot(2,3,1);
imshow(gray_img);
title('Original Grayscale Image');

subplot(2,3,2);
bar(bins(1:end-1), counts, 'b');
title('Original Histogram');
xlabel('Pixel Value');
ylabel('Probability');
grid on;

subplot(2,3,3);
plot(bins(1:end-1), cdf, 'r', 'LineWidth', 1.5);
title('Original Cumulative Histogram');
xlabel('Pixel Value');
ylabel('Cumulative Probability');
grid on;

% Second row - Equalized image and its histograms
subplot(2,3,4);
imshow(eq_img);
title('Manually Equalized Image');

subplot(2,3,5);
bar(eq_bins(1:end-1), eq_counts, 'b');
title('Equalized Histogram');
xlabel('Pixel Value');
ylabel('Probability');
grid on;

subplot(2,3,6);
plot(eq_bins(1:end-1), eq_cdf, 'r', 'LineWidth', 1.5);
title('Equalized Cumulative Histogram');
xlabel('Pixel Value');
ylabel('Cumulative Probability');
grid on;

% Add main title to the figure
sgtitle(['Manual Image Histogram Equalization Analysis: ' filename]);