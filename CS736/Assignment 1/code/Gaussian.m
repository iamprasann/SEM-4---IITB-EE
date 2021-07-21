function [alpha, gamma, best] = Gaussian(X, Y, Theta, OG)
    alpha = 100;
    gamma = 100;
    temp_alpha = 0.01;
    temp_gamma = 0.01;
    best = X;
    x = X;
    y = Y;
    
    if(strcmp(Theta, 'Quadratic'))
        while(temp_alpha<1)
            s=1;
            while(s>1e-6)
                d_prior = Quadratic(x);
                update = (1-temp_alpha)*2*(x-y)+(temp_alpha)*d_prior;
                temp = x-s*update;
                if(quick_error(OG, temp)<quick_error(OG, x))
                    x = temp;
                    s = 1.1*s;
                else
                    s = 0.5*s;
                end
            end
            if(quick_error(OG, best) >= quick_error(OG, x))
                best = x;
                alpha = temp_alpha;
            end
            x=X;
            temp_alpha = temp_alpha+0.01;
        end
        
    elseif(strcmp(Theta, 'Huber'))
        while(temp_alpha<1)
            while(temp_gamma<2)
                s=1;
                while(s>1e-6)
                    d_prior = Huber(x, temp_gamma);
                    update = (1-temp_alpha)*2*(x-y)+(temp_alpha)*d_prior;
                    temp = x-s*update;
                    if(quick_error(OG, temp)<quick_error(OG, x))
                        x = temp;
                        s = 1.1*s;
                    else
                        s = 0.5*s;
                    end
                end
                
                if(quick_error(OG, best) > quick_error(OG, x))
                    best = x;
                    alpha = temp_alpha;
                    gamma = temp_gamma;
                end
                x=X;
                temp_gamma = temp_gamma+0.01;
            end
            temp_alpha = temp_alpha+0.01;
        end

    elseif(strcmp(Theta, 'prior3'))
        while(temp_alpha<1)
            while(temp_gamma<2)
                s=1;
                while(s>1e-6)
                    d_prior = prior3(x, temp_gamma);
                    update = (1-temp_alpha)*2*(x-y)+(temp_alpha)*d_prior;
                    temp = x-s*update;
                    if(quick_error(OG, temp)<quick_error(OG, x))
                        x = temp;
                        s = 1.1*s;
                    else
                        s = 0.5*s;
                    end
                end
                
                if(quick_error(OG, best) > quick_error(OG, x))
                    best = x;
                    alpha = temp_alpha;
                    gamma = temp_gamma;
                end
                x=X;
                temp_gamma = temp_gamma+0.01;
            end
            temp_alpha = temp_alpha+0.01;
        end
    end
end