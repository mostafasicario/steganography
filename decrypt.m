fprintf('\n\n')
fprintf('Decrypt a Secret Message From an Image:\n')
fprintf('***************************************\n\n')

% Get the key from the user
the_key = input('Enter the key: ', 's');

% Get the Image From the User:
image = input('Image: ', 's');
image = imread(image);

% Check if the image is RGB or Grayscale:
if size(image,3)==3
    decrypt_rgb(the_key, image)
else
    decrypt_grayscale(the_key, image)
end