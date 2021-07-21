function [DAH_prior] = Huber(X, gamma)
    
    u_matrix = (X-circshift(X, 1, 1));
    less_gamma = abs(u_matrix) < gamma;
    more_gamma = ones(size(X))-less_gamma;
    temp = u_matrix.*more_gamma;
    temp1 = (temp<0);
    temp1 = -gamma*temp1;
    temp2 = (temp>0);
    temp2 = -gamma*temp2;
    temp3 = u_matrix.*less_gamma;
    DAH_prior = temp1+temp2+temp3;
    
    u_matrix = (X-circshift(X, -1, 1));
    less_gamma = abs(u_matrix) < gamma;
    more_gamma = ones(size(X))-less_gamma;
    temp = u_matrix.*more_gamma;
    temp1 = (temp<0);
    temp1 = -gamma*temp1;
    temp2 = gamma*(temp>0);
    temp2 = -gamma*temp2;
    temp3 = u_matrix.*less_gamma;
    DAH_prior = DAH_prior+temp1+temp2+temp3;
    
    u_matrix = (X-circshift(X, 1, 2));
    less_gamma = abs(u_matrix) < gamma;
    more_gamma = ones(size(X))-less_gamma;
    temp = u_matrix.*more_gamma;
    temp1 = -gamma*(temp<0);
    temp1 = -gamma*temp1;
    temp2 = gamma*(temp>0);
    temp2 = -gamma*temp2;
    temp3 = u_matrix.*less_gamma;
    DAH_prior = DAH_prior+temp1+temp2+temp3;
    
    u_matrix = (X-circshift(X, -1, 2));
    less_gamma = abs(u_matrix) < gamma;
    more_gamma = ones(size(X))-less_gamma;
    temp = u_matrix.*more_gamma;
    temp1 = -gamma*(temp<0);
    temp1 = -gamma*temp1;
    temp2 = gamma*(temp>0);
    temp2 = -gamma*temp2;
    temp3 = u_matrix.*less_gamma;
    DAH_prior = DAH_prior+temp1+temp2+temp3;

%     d_matrix_down=zeros(256,256);
%     d_matrix_up=zeros(256,256);
%     d_matrix_right=zeros(256,256);
%     d_matrix_left=zeros(256,256);
%     shift_down=circshift(x,1,1);
%     shift_up=circshift(x,-1,1);
%     shift_right=circshift(x,1,2);
%     shift_left=circshift(x,-1,2);
%     for i = 1:256
%         for j =1:256
%             
%             if (shift_down(i,j)-x(i,j))<= gamma && (shift_down(i,j)-x(i,j))>=(-1*gamma)
%                 d_matrix_down(i,j)=shift_down(i,j)-x(i,j);
%             else
%                 d_matrix_down(i,j)=sign(shift_down(i,j)-x(i,j))*gamma;
%             end
%             
%             if (shift_up(i,j)-x(i,j))<= gamma && (shift_up(i,j)-x(i,j))>=(-1*gamma)
%                 d_matrix_up(i,j)=shift_up(i,j)-x(i,j);
%             else
%                 d_matrix_up(i,j)=sign(shift_up(i,j)-x(i,j))*gamma;
%             end
%             
%             if (shift_right(i,j)-x(i,j))<= gamma && (shift_right(i,j)-x(i,j))>=(-1*gamma)
%                 d_matrix_right(i,j)=shift_right(i,j)-x(i,j);
%             else
%                 d_matrix_right(i,j)=sign(shift_right(i,j)-x(i,j))*gamma;
%             end
%             
%             if (shift_left(i,j)-x(i,j))<= gamma && (shift_left(i,j)-x(i,j))>=(-1*gamma)
%                 d_matrix_left(i,j)=shift_left(i,j)-x(i,j);
%             else
%                 d_matrix_left(i,j)=sign(shift_left(i,j)-x(i,j))*gamma;
%             end
%         end
%     end
%     
%     DAH_prior=(d_matrix_up+d_matrix_down+d_matrix_right+d_matrix_left);
end