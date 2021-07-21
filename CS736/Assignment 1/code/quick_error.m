function [cost] = quick_error(A, B)
    cost = sum((A-B).*(A-B), 'all');
end