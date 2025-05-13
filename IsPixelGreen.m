% Copy and Paste your submission below.
function [L] = IsPixelGreen(r,g,b)
% ISPIXELGREEN recognises if a pixel is green by examining its hue, 
% saturation and value from its red, green and blue pixel intensity values

% Input:
% r: A uint8 red pixel intensity r with interval [0,255]
% g: A uint8 red pixel intensity g with interval [0,255]
% b: A uint8 red pixel intensity b with interval [0,255]
% Output:
% L: a logical true (1) or logical false (0)

% Author: Julia Jung

% scale r,g,b to the interval [0,1]
R = double(r) / 255; 
G = double(g) / 255;
B = double(b) / 255;
RGB = [R,G,B];

V = max(RGB);
C = V - min(RGB);

% Determine the values of H with different input r,g,b
if C == 0
    H = 0;
elseif V == R
    H = 60 * mod(((G - B) / C), 6);
elseif V == G
    H = 60 * ((B-R)/C + 2);
elseif V == B
    H = 60 * ((R-G)/C + 4);
end

% Determine the values of S with different input r,g,b
if V == 0
    S = 0;
else
    S = C/V;
end

% if H,S,V satisfies the values, the pixel is green
if (80 < H && H < 160) && S > 0.4 && V > 0.3
        L = true;
    % otherwise, the pixel is not green
    else
        L = false;
    end
end