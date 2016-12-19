image_location = input('Image: ', 's');
image = imread(image_location);

if size(image,3)==3
    fprintf('RGB Image\n\n')
else
    fprintf('Grayscale Image\n\n')
end