## Overview
`ApplyChromakey` is a function designed to process images by replacing the green pixels of the foreground image with the corresponding background pixels, effectively creating a "green screen" effect. It was initially developed for a university project focused on image processing techniques. The function allows the combination of a foreground and a background image, where the foreground contains green pixels to be replaced with the corresponding areas of the background.

## Function Signature
```function [processed] = ApplyChromaKey(foreground, background, vector) ```

## Description
The function ApplyChromakey takes three inputs:
1. foreground: The foreground image, which is an m-by-n-by-3 uint8 array.
2. background: The background image, which is a p-by-q-by-3 uint8 array.
3. vector: A 1-by-2 row vector representing the (x, y) position where the foreground image should be placed on the background image.

The function processes the images to replace the green pixels in the foreground with the corresponding background pixels. Non-green pixels from the foreground remain visible.

The result is a new image, `processed`, which is a p-by-q-by-3 uint8 array that combines the foreground and background based on chroma keying principles.

## Inputs
1. foreground (m-by-n-by-3 uint8 array):
 - This is the image that will be placed on top of the background. It is assumed to contain a green screen, where pixels with green color will be replaced.
2. background (p-by-q-by-3 uint8 array):
- This is the background image. It will be used to replace the green parts of the foreground image.
3. vector (1-by-2 row vector):
- This specifies the position where the foreground image should be placed relative to the background image. The first element corresponds to the x-coordinate (horizontal shift), and the second element corresponds to the y-coordinate (vertical shift).

## Output
1. processed (p-by-q-by-3 uint8 array):
- The final image that results from combining the foreground and background based on chroma keying. Non-green pixels from the foreground remain in place, while green pixels are replaced by the corresponding pixels from the background.

Example Usage
```% Load foreground and background images
foreground = imread('foreground.png');
background = imread('background.jpg');

% Define the position to place the foreground image on the background
vector = [50, 100]; % (x, y) position

% Apply the chroma key
processed_image = ApplyChromaKey(foreground, background, vector);

% Display the processed image
imshow(processed_image);
```

## Function Details
1. Foreground and Background Sizes:
- The foreground image's size is defined by m and n (height and width).
- The background image's size is defined by p and q (height and width).
- The foreground image is placed at the location (x, y) specified by the vector parameter, and its size should be smaller or equal to the background in order to fit within the boundaries.

2. Chroma Keying Process:
The function checks each pixel in the foreground image. If the pixel is not considered "green" (based on the IsPixelGreen function), it is copied to the processed image at the appropriate position. If the pixel is green, it is replaced with the corresponding background pixel.

3. Green Pixel Detection:
The function relies on the helper function IsPixelGreen, which detects green pixels in the foreground image. This function is critical in identifying which pixels to replace with the background image.

4. Positioning:
The foreground is placed on the background based on the specified (x, y) position. The function ensures that the foreground is positioned correctly by adjusting the pixel indexing when copying from the foreground to the background.

5. Handling Image Boundaries:
The function ensures that the background pixels replace the green pixels only within the valid bounds of the background image.

## Author
Julia Jung

## Notes
The `IsPixelGreen` function used in this implementation should check if a pixel is "green enough" to be replaced. Ensure that this function is defined in the same directory or workspace for the function to work correctly.
This function assumes that both images (foreground and background) are in `uint8` format, and the input images must be properly preprocessed for best results (e.g., ensuring the foreground is placed correctly on the background).

## License
This code is for educational and academic purposes. Redistribution and modification of this function are allowed, but proper attribution should be given to the author.
