function encrypt_grayscale(image, plaintext_size, cipher_binary, cipher_binary_size)

    % Extract Image Information:
    image_size = size(image);
    total_image_size = image_size(1)*image_size(2);

    plaintext_totalsize = (plaintext_size*8) +1;

    % Plaintext Can't be Saved into Smaller Image:
    if plaintext_totalsize > total_image_size
        return
    end

    % Matrix to Vector:
    image(1,1) = plaintext_size;
    processing_image = reshape(image', 1, total_image_size);

    % Processing:
    processing_image = de2bi(processing_image);

    % Insert the Crypt into Last Bit of Every Pixel:
    processing_image2 = processing_image;
    for ii=2 : cipher_binary_size+1
        processing_image2(ii,8) = cipher_binary(ii-1);
    end

    processing_image2 = bi2de(processing_image2);

    % Vector to Matrix:
    processing_image2 = vec2mat(processing_image2, image_size(2));

    % Output the Cipher Image:
    ciphered_image_location = input('Secret message (bmp) image: ', 's');
    ciphered_image_location = strcat(ciphered_image_location, '.bmp');
    imwrite(processing_image2, ciphered_image_location, 'bmp');

    % Output Message to the User:
    fprintf('\nImage saved successfully.')
    
    fprintf('\n\n***********************************************************')

end