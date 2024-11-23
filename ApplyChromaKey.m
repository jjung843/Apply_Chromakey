function [processed] = ApplyChromaKey(foreground,background,vector)
% APPLYCHROMAKEY replaces the appropriate background image pixels with the
% corresponding non-green pixels of the foreground image.

% Input:
% foreground: A m-by-n-by-3 uint8 array representing the foreground image
% background: A p-by-q-by-3 uint8 array representing the bacground image
% vector: A 1-by-2 row vector representing the (x,y) location of the foreground
% image relative to the background image's origin
% Output:
% processed: a p-by-q-by-3 uint8 array representing the processed image

% Author: Julia Jung

% Define array of the foreground image
[m, n, ~] = size(foreground); % foreground image array

processed = background; % Preallocating the processed image size

% Set up the vector array with x and y 
x = vector(1);
y = vector(2);

[p, ~, ~] = size(background); % background image array
z = p-m-y;

% Apply ISPIXELGREEN and apply chroma keying
% The for loop goes through the foreground image; green pixels will be removed
% If the pixel is not green, it will be kept 
for i = 1:m
    for j = 1:n
        a = foreground(i, j, 1);
        b = foreground(i, j, 2);
        c = foreground(i, j, 3);
        if IsPixelGreen(a, b, c) == false
            processed((z+i), (x+j), :) = foreground(i,j,:);
        end
    end
end

end