%% Clear command window, workspace and close all windows
clc; % Clear the command window.
close all; % Close all figures (except those of imtool.)
imtool close all; % Close all imtool figures.
clear; % Erase all existing variables.
workspace; % Make sure the workspace panel is showing.

%% Reading image file
IMG = imread('IMG.png');
s = size(IMG);

%% Região infartada
% Change contrast
RGB = imadjust(IMG,[.53 .53 .53; .58 .63 .58],[]); %.53 = 135 // .58 = 148 // .63 = 161

% Split into RGB Channels
Red = RGB(:,:,1); % Red channel
Green = RGB(:,:,2); % Green channel
Blue = RGB(:,:,3); % Blue channel

% Set all elements from blue matrix to 255
Blue(:,:) = 255;

% Join all components to get back the original image
ROI = cat(3, Red, Green, Blue);
clearvars Red Green Blue;

% Thresholding
BI = zeros(s(1),s(2),'uint8');
index = ROI(:,:,2) > 240;
BI(index) = 255;
pixels = length(find(BI(:) == 0));

BI = ~BI;
BI = im2uint8(BI);
B = cat(3,BI,BI,BI);
A = imsubtract(IMG,B);

BI = ~BI;
BI = im2uint8(BI);
BI = cat(3,BI,BI,BI);
I = [IMG BI A];
figure,imshow(I);

clearvars ROI;

%% Região total
% Change contrast
NRGB = imadjust(IMG,[.1 .1 .1; .831 .831 .831],[]);

% Split into RGB Channels
Red = NRGB(:,:,1); % Red channel
Green = NRGB(:,:,2); % Green channel
Blue = NRGB(:,:,3); % Blue channel
clearvars NRGB;

% Max red and green
Red(:,:) = 255;
Green(:,:) = 255;

% Join components
CRGB = cat(3, Red, Green, Blue); 
clearvars Red Green Blue;

% Posterizing original image
PI = posterize(CRGB,3,3,3);
clearvars CRGB;

% Thresholding
BI2 = ones(s(1),s(2),'logical');
index = find((PI(:,:,1) < 255) | (PI(:,:,2) < 255) | (PI(:,:,3) < 255));
BI2(index) = 0;

% AND com a região infartada
BI3 = and(BI,BI2);
pixels2 = length(find(BI3(:) == 0));
%     
BI3 = ~BI3;
BI3 = im2uint8(BI3);
A = imsubtract(IMG,BI3);

BI3 = ~BI3;
BI3 = im2uint8(BI3);
I2 = [IMG BI3 A];
figure,imshow(I2)
imwrite(I2,'img_compare.png');

%% Percentage from area of interest
percentage = (pixels/pixels2)*100;

%% Printing results
result = ['Region of interest: ', num2str(pixels), ' pixels.'];
disp(result);
result = ['Heart: ', num2str(pixels2), ' pixels.'];
disp(result);
result = ['Percentage: ', num2str(percentage), '%.'];
disp(result);