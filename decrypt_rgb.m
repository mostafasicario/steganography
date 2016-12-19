function decrypt_rgb(the_key, image)

    % Extract the Blue Channel from the Image:
    original_blue = image(:,:,3);

    % Extract Image Information:
    blue_size = size(original_blue);
    blue_size_conv = blue_size(1) * blue_size(2);

    % Getting the Plaintext Length:
    plaintext_size = original_blue(1,1);
    cipher_size = double(plaintext_size) * 8;

    original_blue = reshape(original_blue', 1, blue_size_conv);
    original_blue = de2bi(original_blue);

    % Extracting the Cipher from the Image:
    the_cipher = original_blue(:,8);
    
    the_cipher(1,:) = [];
    the_cipher = the_cipher(1:cipher_size);

    the_cipher = vec2mat(the_cipher, 8);
    the_cipher = num2str(the_cipher);
    
    the_cipher_size = size(the_cipher);
    the_cipher_rows = the_cipher_size(1);

    cipher = [];
    for ii=1 : the_cipher_rows
        code = bin2dec(the_cipher(ii,:));
        cipher = [cipher code];
    end

    % Get the Key to be the Same Length as the Cipher:
    original_key = the_key;
    key_size = length(the_key);
    while key_size ~= plaintext_size
        the_key = strcat(the_key, original_key);
        key_size = length(the_key);
    end

    key_uint8 = uint8(the_key);
    cipher = uint8(cipher);
    cipher2text = bitxor(cipher, key_uint8);
    cipher2text = char(cipher2text);

    disp(['The Secret Message: ' cipher2text])
    
    fprintf('\n\n***********************************************************')
    
end