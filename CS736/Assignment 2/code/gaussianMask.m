% Ref - https://stackoverflow.com/questions/27499057/how-do-i-create-and-apply-a-gaussian-filter-in-matlab-without-using-fspecial-im/27500953#:~:text=I%3Dimread(image)%3B%20h,%2Ccolormap('gray')%3B
function [W] = gaussianMask(filter_size, centre, sigma)
%// Generate Gaussian mask (Filter size should be odd ideally)
ind = -floor(filter_size/2) : floor(filter_size/2);
[X Y] = meshgrid(ind, ind);
W = exp(-(X.^2 + Y.^2) / (2*sigma*sigma));
W = W / sum(W(:));
end
