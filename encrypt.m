fprintf('\n\n')
fprintf('Encrypt a Secret Message inside an Image.\n')
fprintf('*****************************************\n\n')

% Get the Secret Message from the User:
plaintext = input('Enter the secret message: ', 's');
plaintext_size = length(plaintext);

% Check the plaintext if > 248
while plaintext_size > 248
    warning('The message must not exceed 248 numbers/chars.')
    plaintext = input('Enter the secret message: ', 's');
    plaintext_size = length(plaintext);
end

% Get the Secret Key from the User:
key = input('Enter the secret key: ', 's');
key_size = length(key);

% Check the key if not between 4 and 8
while (key_size < 4) | (key_size > 8) | (key_size > plaintext_size)
    warning('The key must between 4 and 8 numbers/chars and equal to/smaller than the message.')
    key = input('Enter the secret key: ', 's');
    key_size = length(key);
end

% Check that the plaintext_size is Divisible by key_size, if not, Concatinate '.'
while mod(plaintext_size, key_size)
    mod(plaintext_size, key_size);
    plaintext = strcat(plaintext, '.');
    plaintext_size = length(plaintext);
end

% Get the Key to be the Same Length as the Plaintext
original_key = key;
while key_size ~= plaintext_size
    key = strcat(key, original_key);
    key_size = length(key);
end

% Start Ciphering:
plaintext_uint8 = uint8(plaintext);
key_uint8 = uint8(key);
cipher = bitxor(plaintext_uint8, key_uint8);

% Cipher to Binary:
cipher_binary = dec2bin(cipher,8);
cipher_binary = cipher_binary-'0';
cipher_binary_size = size(cipher_binary);
cipher_binary_size = cipher_binary_size(1)*cipher_binary_size(2);
cipher_binary = reshape(cipher_binary', cipher_binary_size, 1);

% Image Input:
image_location = input('Image: ', 's');
image = imread(image_location);

% Check if the image is RGB or Grayscale:
if size(image,3)==3
    encrypt_rgb(image, plaintext_size, cipher_binary, cipher_binary_size)
else
    encrypt_grayscale(image, plaintext_size, cipher_binary, cipher_binary_size)
end