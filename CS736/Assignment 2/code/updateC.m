function [C_new] = updateC(Y, W, U, B, q)  
    WB = conv2(B, W, 'same');
    WB2 = conv2(B.^2, W, 'same');
    
    YWB = Y.*WB;
    YWB = repmat(YWB, 1, 1, 3);
    WB2 = repmat(WB2, 1, 1, 3);
    
    UYWB = (U.^q).*(YWB);
    UWB2 = (U.^q).*(WB2);
    
    UYWB = sum(UYWB, [1, 2]);
    UWB2 = sum(UWB2, [1, 2]);
    
    C_new = UYWB./UWB2;
    C_new = reshape(C_new, [3, 1]);
end