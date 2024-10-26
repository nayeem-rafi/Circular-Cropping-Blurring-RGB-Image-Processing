clc; clear all; close all;

% Read and display the original image
image = imread('davis_hall_building.jpeg');
imshow(image);
title('Original Image');

% Get center and edge of the circular region
disp('Click to select the center of the circular crop area.');
[x_center, y_center] = ginput(1); 
disp('Click on the edge of the desired circular crop area.');
[x_edge, y_edge] = ginput(1); 

radius = round(sqrt((x_edge - x_center)^2 + (y_edge - y_center)^2));

[height, width, ~] = size(image);
[X, Y] = meshgrid(1:width, 1:height);

circularMask = (X - x_center).^2 + (Y - y_center).^2 <= radius^2;

% Create a Gaussian filter
hsize = 21; % Size of the Gaussian kernel
sigma = 10;  % Standard deviation for the Gaussian kernel
h = fspecial('gaussian', hsize, sigma);


im_blur = zeros(size(image), 'uint8');

% Apply the Gaussian filter to each color channel
for channel = 1:size(image, 3)
    im_blur(:, :, channel) = uint8(imfilter(double(image(:, :, channel)), h, 'replicate')); % Filter each channel
end

% Initialize the final output image to the original image
Final_image = image;

% Replace the area of the original image with the blurred area using the circular mask
for channel = 1:size(image, 3)
    % Get the current channel of the Final image and the blurred image
    temp_channel = Final_image(:, :, channel); 
    blurred_channel = im_blur(:, :, channel);
    
    % Apply the blur where the mask is true for this channel
    temp_channel(circularMask) = blurred_channel(circularMask); 
    
    % Update the final image with the modified channel
    Final_image(:, :, channel) = temp_channel; 
end


figure;
imshow(Final_image);
title('Modified Image with Circular Blurred Region');
