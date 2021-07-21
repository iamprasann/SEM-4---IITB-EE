%% Data initialization
clear;
load('../data/assignmentSegmentBrain.mat');

%% Parameter initialization
 % We need to initialise parameter q, bias field, class means, class membership values and a
 % neighborhood mask
 
 B = ones(256);    %Since bias field should be constant initially
 actualData = imageData.*imageMask;
 
 % (i) q will be chosen by iterating from 2 - 3.5 in steps of 0.25 
 % ref - https://link.springer.com/article/10.1007/s11432-014-5146-0
 
 % (ii) neighborhood mask
 
 filter_size = 9;   %Tunable parameters
 sigma = 1;
 
 centre = imageData(128, 128);
 W = gaussianMask(filter_size, centre, sigma);
 figure, imshow(W);
 % (iii) Initial estimate for class means
 % Ref - https://www.mathworks.com/help/stats/kmeans.html
 
 imageVector = reshape(actualData, [], 1);
 [idx, class_means] = kmeans(imageVector, 4);
 
 % class_means is 4X1 matrix with 4 centroid values. These serve as a good starting
 % estimate of c1, c2, c3, c4 [One will be corresponding to intensity = 0]
 % (due to mask)
 class_means = class_means(2:4);
 
 % (iv) Initializing [u_{jk}]
 
 U = zeros([256, 256, 3]);
 d_matrix = zeros([256, 256, 3]);
 d_matrix(:, :, 1) = (imageData-class_means(1)).^2;
 d_matrix(:, :, 2) = (imageData-class_means(2)).^2;
 d_matrix(:, :, 3) = (imageData-class_means(3)).^2;
 
 % choosing arbitrary q 
 
 q = 2.48;
     
 d_matrix = d_matrix.^(1/1-q);
 normalization_d = sum(d_matrix, 3);
 U_start = d_matrix./normalization_d;
 U_start = U_start.*imageMask;
 
 figure, imshow(U_start.*imageMask);
 figure, imshow(U_start(:, :, 1).*imageMask);
 figure, imshow(U_start(:, :, 2).*imageMask);
 figure, imshow(U_start(:, :, 3).*imageMask);
 
 % (v) Objective function of the modified fuzzy means algorithm
 J = objectiveFunction(imageData, W, U, B, class_means, q, imageMask);
 display(J);
 C = class_means;
 U = U_start;
 
 J = 100;
 
 J_set = [];
 %% (vi) Actual Modified FCM update:
 iterations = 50;
 for i = 1:iterations
     B_new = updateB(imageData, W, U, C, q);   
     C_new = updateC(imageData, W, U, B_new, q);
     U_new = updateU(imageData, W, C_new, B_new, q);
     
     J_new = objectiveFunction(imageData, W, U_new, B_new, C_new, q, imageMask);
     display(J_new);
     if(J_new < J)
         J = J_new;
         B = B_new;
         C = C_new;
         U = U_new;
         J_set = horzcat(J_set, J);
     else
         break;
     end
 end
 

 % This is the minimum cost
 display(J_set);
 
 % q corresponding to min cost
 display(q);
 
 % figure, imshow(B.*imageMask);
 
 An = U(:, :, 1)*C(1)+U(:, :, 2)*C(2)+U(:, :, 3)*C(3);
 An = An.*imageMask;
 
 Rn = (imageData-An.*B).*imageMask;
 
 % Corrupted Image
 figure, imshow(imageData.*imageMask);
 
 % Class estimates optimal
 figure, imshow(C(1)*U(:, :, 1).*imageMask);
 figure, imshow(C(2)*U(:, :, 2).*imageMask);
 figure, imshow(C(3)*U(:, :, 3).*imageMask);
 
 % Optimal Bias field
 figure, imshow(B.*imageMask);
 
 % Bias removed image
 figure, imshow(An);
 
 % Residual image
 figure, imshow(Rn);
 
 % Optimal class means
 display(C);
 