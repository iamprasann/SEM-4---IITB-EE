function [DA_prior] = prior3(x,gamma)
    d_down=(circshift(x,1,1)-x)./(gamma+abs(circshift(x,1,1)-x));
    d_up=(circshift(x,-1,1)-x)./(gamma+abs(circshift(x,-1,1)-x));
    d_right=(circshift(x,1,2)-x)./(gamma+abs(circshift(x,1,2)-x));
    d_left=(circshift(x,-1,2)-x)./(gamma+abs(circshift(x,-1,2)-x));
    DA_prior=gamma*(d_down+d_up+d_right+d_left);
end