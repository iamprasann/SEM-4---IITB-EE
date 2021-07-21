function [B_new] = updateB(Y, W, U, C, q)
    U_squashed = zeros([256, 256]);
    U_squashed = U_squashed + (U(:, :, 1).^q)*C(1);
    U_squashed = U_squashed + (U(:, :, 2).^q)*C(2);
    U_squashed = U_squashed + (U(:, :, 3).^q)*C(3);
    
    YU = Y.*U_squashed;
    
    B_new_num = conv2(YU, W, 'same');
    
    U_squashed_den = zeros([256, 256]);
    U_squashed_den = U_squashed_den + (U(:, :, 1).^q)*(C(1)^2);
    U_squashed_den = U_squashed_den + (U(:, :, 2).^q)*(C(2)^2);
    U_squashed_den = U_squashed_den + (U(:, :, 3).^q)*(C(3)^2);
    
    B_new_den = conv2(U_squashed_den, W, 'same');
    
    B_new_den = (B_new_den == 0) + B_new_den; 
    B_new = B_new_num./B_new_den;
end