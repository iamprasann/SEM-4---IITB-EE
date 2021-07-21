function [quad_prior] = Quadratic(X)
    quad_prior = 2*((X-circshift(X, 1, 1))+(X-circshift(X, -1, 1))+(X-circshift(X, 1, 2))+(X-circshift(X, -1, 2)));
end