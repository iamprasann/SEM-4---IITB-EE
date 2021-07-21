data1 = load('../data/assignmentImageDenoisingPhantom.mat');
Noisy = data1.imageNoisy;
Original = data1.imageNoiseless;
Phantom_Noisy=Noisy;
Phantom_Original=Original;
figure(1), imshow(Original);
colormap('jet')
figure(2), imshow(Noisy);
colormap('jet')

%% Quadratic Function
[alpha, gamma, best,rrmse_array] = Rician(Noisy, Noisy, 'Quadratic', Original);
disp("Rician Quadratic Phantom");
disp("Optimum value of alpha = "+alpha);
disp("Best RRMSE value = "+RRMSE(Original, best));
disp("RRMSE value for 0.8*alpha = "+optimality(Noisy, Noisy, 'Quadratic', Original,0.8*alpha,0));
disp("RRMSE value for 1.2*alpha = "+optimality(Noisy, Noisy, 'Quadratic', Original,1.2*alpha,0));
quadratic_phantom_rrmse=rrmse_array;
best_quadratic_phantom=best;
figure(3), imshow(best)
colormap('jet')

%% Discontinuity-adaptive Huber function
[alpha, gamma, best,rrmse_array] = Rician(Noisy, Noisy, 'Huber', Original);
disp("Rician Huber Phantom");
disp("Optimum value of alpha = "+alpha);
disp("Optimum value of gamma = "+gamma);
disp("Best RRMSE value = "+RRMSE(Original, best));
disp("RRMSE value for 0.8*alpha and gamma = "+optimality(Noisy, Noisy, 'Huber', Original,0.8*alpha,gamma));
disp("RRMSE value for 1.2*alpha and gamma = "+optimality(Noisy, Noisy, 'Huber', Original,1.2*alpha,gamma));
disp("RRMSE value for alpha and 0.8*gamma = "+optimality(Noisy, Noisy, 'Huber', Original,alpha,0.8*gamma));
disp("RRMSE value for alpha and 1.2*gamma = "+optimality(Noisy, Noisy, 'Huber', Original,alpha,1.2*gamma));
huber_phantom_rrmse=rrmse_array;
best_huber_phantom=best;
figure(4), imshow(best)
colormap('jet')

%% Discontinuity-adaptive function
[alpha, gamma, best,rrmse_array] = Rician(Noisy, Noisy, 'prior3', Original);
disp("Rician Prior 3 Phantom");
disp("Optimum value of alpha = "+alpha);
disp("Optimum value of gamma = "+gamma);
disp("Best RRMSE value = "+RRMSE(Original, best));
disp("RRMSE value for 0.8*alpha and gamma = "+optimality(Noisy, Noisy, 'prior3', Original,0.8*alpha,gamma));
disp("RRMSE value for 1.2*alpha and gamma = "+optimality(Noisy, Noisy, 'prior3', Original,1.2*alpha,gamma));
disp("RRMSE value for alpha and 0.8*gamma = "+optimality(Noisy, Noisy, 'prior3', Original,alpha,0.8*gamma));
disp("RRMSE value for alpha and 1.2*gamma = "+optimality(Noisy, Noisy, 'prior3', Original,alpha,1.2*gamma));
prior3_phantom_rrmse=rrmse_array;
best_prior3_phantom=best;
figure(5), imshow(best)
colormap('jet')

%% Loading Brain MRI image data
data2 = load('../data/brainMRIslice.mat');
Noisy = data2.brainMRIsliceNoisy;
Original = data2.brainMRIsliceOrig;
BrainMRI_Noisy=Noisy;
BrainMRI_Original=Original;
figure(6), imshow(Original);
colormap('jet')
figure(7), imshow(Noisy);
colormap('jet')


%% Quadratic Function
[alpha, gamma, best,rrmse_array] = Rician(Noisy, Noisy, 'Quadratic', Original);
disp("Rician Quadratic Brain MRI");
disp("Optimum value of alpha = "+alpha);
disp("Best RRMSE value = "+RRMSE(Original, best));
disp("RRMSE value for 0.8*alpha = "+optimality(Noisy, Noisy, 'Quadratic', Original,0.8*alpha,0));
disp("RRMSE value for 1.2*alpha = "+optimality(Noisy, Noisy, 'Quadratic', Original,1.2*alpha,0));
quadratic_brainMRI_rrmse=rrmse_array;
best_quadratic_brainMRI=best;
figure(8), imshow(best)
colormap('jet')

%% Discontinuity-adaptive Huber function
[alpha, gamma, best,rrmse_array] = Rician(Noisy, Noisy, 'Huber', Original);
disp("Rician Huber Brain MRI");
disp("Optimum value of alpha = "+alpha);
disp("Optimum value of gamma = "+gamma);
disp("Best RRMSE value = "+RRMSE(Original, best));
disp("RRMSE value for 0.8*alpha and gamma = "+optimality(Noisy, Noisy, 'Huber', Original,0.8*alpha,gamma));
disp("RRMSE value for 1.2*alpha and gamma = "+optimality(Noisy, Noisy, 'Huber', Original,1.2*alpha,gamma));
disp("RRMSE value for alpha and 0.8*gamma = "+optimality(Noisy, Noisy, 'Huber', Original,alpha,0.8*gamma));
disp("RRMSE value for alpha and 1.2*gamma = "+optimality(Noisy, Noisy, 'Huber', Original,alpha,1.2*gamma));
huber_brainMRI_rrmse=rrmse_array;
best_huber_brainMRI=best;
figure(9), imshow(best)
colormap('jet')

%% Discontinuity-adaptive function
[alpha, gamma, best,rrmse_array] = Rician(Noisy, Noisy, 'prior3', Original);
disp("Rician Prior 3 Brain MRI");
disp("Optimum value of alpha = "+alpha);
disp("Optimum value of gamma = "+gamma);
disp("Best RRMSE value = "+RRMSE(Original, best));
disp("RRMSE value for 0.8*alpha and gamma = "+optimality(Noisy, Noisy, 'prior3', Original,0.8*alpha,gamma));
disp("RRMSE value for 1.2*alpha and gamma = "+optimality(Noisy, Noisy, 'prior3', Original,1.2*alpha,gamma));
disp("RRMSE value for alpha and 0.8*gamma = "+optimality(Noisy, Noisy, 'prior3', Original,alpha,0.8*gamma));
disp("RRMSE value for alpha and 1.2*gamma = "+optimality(Noisy, Noisy, 'prior3', Original,alpha,1.2*gamma));
prior3_brainMRI_rrmse=rrmse_array;
best_prior3_brainMRI=best;
figure(10), imshow(best)
colormap('jet')