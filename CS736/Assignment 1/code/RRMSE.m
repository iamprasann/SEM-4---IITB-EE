function [error] = RRMSE(A, B)
    error = (sqrt(sum((A-B).*(A-B), 'all')))/(sqrt(sum(A.*A, 'all')));
end