% Load and display the original image
img = imread('rick.jpg'); % Replace 'example.jpg' with your image file
figure;
imshow(img);
title('Original Image');

% Zoom factor
scale_factor = 15; % Zoom in by a factor of 2

% Apply the bilinear interpolation and display the zoomed image
zoomed_img = bilinear_interpolation(img, scale_factor);
figure;
imshow(zoomed_img);
title(['Zoomed Image by a factor of ', num2str(scale_factor)]);

% Comparison with MATLAB's built-in function
zoomed_img_builtin = imresize(img, scale_factor, 'bilinear');
figure;
imshow(zoomed_img_builtin);
title('Zoomed Image using MATLAB built-in function');

% Bilinear Interpolation Function
function zoomed_img = bilinear_interpolation(img, scale)
    [rows, cols, channels] = size(img);
    new_rows = round(scale * rows);
    new_cols = round(scale * cols);
    zoomed_img = zeros(new_rows, new_cols, channels, 'uint8');
    
    for c = 1:channels
        for i = 1:new_rows
            for j = 1:new_cols
                x = i / scale;
                y = j / scale;
                
                x1 = floor(x);
                y1 = floor(y);
                x2 = min(x1 + 1, rows);
                y2 = min(y1 + 1, cols);
                
                % Handling boundary conditions
                if x1 < 1, x1 = 1; end
                if y1 < 1, y1 = 1; end
                if x2 > rows, x2 = rows; end
                if y2 > cols, y2 = cols; end
                
                R1 = (x2 - x) * double(img(x1, y1, c)) + (x - x1) * double(img(x2, y1, c));
                R2 = (x2 - x) * double(img(x1, y2, c)) + (x - x1) * double(img(x2, y2, c));
                P = (y2 - y) * R1 + (y - y1) * R2;
                
                zoomed_img(i, j, c) = uint8(P);
            end
        end
    end
end