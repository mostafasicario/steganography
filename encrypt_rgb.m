function encrypt_rgb(image, plaintext_size, cipher_binary, cipher_binary_size)

    % Extract the BLUE from the Image:
    original_blue = image(:,:,3);
    % imshow(original_blue);

    % Extract Image Information:
    original_blue_size = size(original_blue);
    total_blue_size = original_blue_size(1)*original_blue_size(2);

    plaintext_totalsize = (plaintext_size*8) +1;

    % Plaintext Can't be Saved into Smaller Image:
    if plaintext_totalsize > total_blue_size
        warning('The image is too small, Choose a larger image.');
        return
    end

    % Matrix to Vector:
    original_blue(1,1) = plaintext_size;
    reshaping_image = reshape(original_blue', 1, total_blue_size);

    % Processing:
    reshaping_image = de2bi(reshaping_image);

    % Insert the Crypt into Last Bit of Every Pixel:
    processing_image = reshaping_image;
    for ii=2 : cipher_binary_size+1
        processing_image(ii,8) = cipher_binary(ii-1);
    end

    processing_image = bi2de(processing_image);

    % Vector to Matrix:
    processing_image = vec2mat(processing_image, original_blue_size(2));

    % Output the Cipher Image:
    ciphered_image_location = input('Secret message (bmp) image: ', 's');
    ciphered_image_location = strcat(ciphered_image_location, '.bmp');

    image(:,:,3) = processing_image;
    imwrite(image, ciphered_image_location, 'bmp');

    % Output Message to the User:
    fprintf('\nImage saved successfully.')
    
    fprintf('\n\n***********************************************************')
    
end