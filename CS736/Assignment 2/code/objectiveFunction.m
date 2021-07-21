function [J] = objectiveFunction(Y, W, U, B, C, q, imageMask)
    CB = zeros([256, 256, 3]);
    CB(:, :, 1) = C(1)*B;
    CB(:, :, 2) = C(2)*B;
    CB(:, :, 3) = C(3)*B;
    
    E1 = sum(((U.^q).*((Y-CB).^2)).*imageMask, 3);
    
    WE1 = conv2(E1, W, 'same');
    
    J = sum(WE1, 'all');    
end