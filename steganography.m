clear all; clc
fprintf('Steganography:\n\n')

disp('1. Encrypt a Secret Message inside an Image.')
disp('2. Decrypt a secret Message from an Image.')
disp('3. Quit')
    fprintf('\n')

input_selection = input('Select: ');

while (input_selection ~= 3)
    
    switch input_selection
        case 1
            encrypt
        case 2
            decrypt
        otherwise
            break
    end

    fprintf('\n\n')

    fprintf('Steganography:\n\n')
    
    disp('1. Encrypt a Secret Message inside an Image.')
    disp('2. Decrypt a secret Message from an Image.')
    disp('3. Quit')
        fprintf('\n')

    input_selection = input('Select: ');

end