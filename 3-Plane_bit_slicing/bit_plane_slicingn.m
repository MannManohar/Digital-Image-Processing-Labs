%Converting an image into its constituent bits and displaying each image
%author : Mann Manohar
clc
clear all
close all

[file, path] = uigetfile({'*.*', 'All Files'; '*.jpg;*.jpeg;*.png;*.bmp', 'Image Files (*.jpg, *.png, *.bmp)'}, 'Select an Image');
if isequal(file, 0)
    disp('No file selected. Exiting.');
    return;
end

% Read the selected image
imagePath = fullfile(path, file);
originalImage = imread(imagePath);

% Convert to grayscale if the image is RGB
if size(originalImage, 3) == 3
    grayscaleImage = rgb2gray(originalImage);
else
    grayscaleImage = originalImage;
end

% Display the input image in the first figure
figure;
imshow(grayscaleImage, []);
title('Grayscale Input Image');

% Get the size of the image
[rows, cols] = size(grayscaleImage);

% Initialize a cell array to store bit planes
bitPlanes = cell(1, 8);

% Extract each bit plane
for i = 1:8
    bitPlanes{i} = bitget(grayscaleImage, i) * 2^(i-1); % Scale the bits for better visibility
end

% Display the 8 bit planes in the second figure
figure;
for i = 1:8
    subplot(4, 4, i); % Subplots for bit planes
    imshow(bitPlanes{i}, []);
    title(['Bit Plane ', num2str(i)]);
end

% Fill the remaining slots in the 4x4 subplot layout with blank subplots
for i = 1:4
    subplot(4, 4, i);
    axis off; % Turn off the axis for blank slots
end
