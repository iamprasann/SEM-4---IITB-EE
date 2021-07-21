function [U_new] = updateU(Y, W, C, B, q)
    CB = zeros([256, 256, 3]);
    CB(:, :, 1) = C(1)*B;
    CB(:, :, 2) = C(2)*B;
    CB(:, :, 3) = C(3)*B;
    
    term_1 = (Y-CB).^2;
    
    D = zeros([256, 256, 3]);
    
    D(:, :, 1) = conv2(term_1(:, :, 1), W, 'same');
    D(:, :, 2) = conv2(term_1(:, :, 2), W, 'same');
    D(:, :, 3) = conv2(term_1(:, :, 3), W, 'same');
    
    D = D.^(1/1-q);
    norm_D = sum(D, 3);
    
    U_new = D./norm_D;
end