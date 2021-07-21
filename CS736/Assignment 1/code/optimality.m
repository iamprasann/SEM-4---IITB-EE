function [rrmse_value] = optimality(X,Y,Theta,OG,temp_alpha,temp_gamma)
    x=X;
    y=Y;
    if(strcmp(Theta, 'Quadratic'))
        s=1;
        while(s>1e-6)
            d_prior = Quadratic(x);
            update = (1-temp_alpha)*x-(1-temp_alpha)*(besseli(1,(1-temp_alpha)*x.*y)./besseli(0,(1-temp_alpha)*x.*y)).*y+(temp_alpha)*d_prior;
            temp = x-s*update;
            if(quick_error(OG, temp)<quick_error(OG, x))
                x = temp;
                s = 1.1*s;
            else
                s = 0.5*s;
            end
        end
        rrmse_value=RRMSE(OG,x);
    elseif(strcmp(Theta, 'Huber'))
        s=1;
        while(s>1e-6)
            d_prior = Huber(x, temp_gamma);
            update =(1-temp_alpha)*x-(1-temp_alpha)*(besseli(1,(1-temp_alpha)*x.*y)./besseli(0,(1-temp_alpha)*x.*y)).*y+(temp_alpha)*d_prior;
            temp = x-s*update;
            if(quick_error(OG, temp)<quick_error(OG, x))
                x = temp;
                s = 1.1*s;
            else
                s = 0.5*s;
            end
        end
        rrmse_value=RRMSE(OG,x);
    elseif(strcmp(Theta, 'prior3'))
        s=1;
        while(s>1e-6)
            d_prior = prior3(x, temp_gamma);
            update = (1-temp_alpha)*x-(1-temp_alpha)*(besseli(1,(1-temp_alpha)*x.*y)./besseli(0,(1-temp_alpha)*x.*y)).*y+(temp_alpha)*d_prior;
            temp = x-s*update;
            if(quick_error(OG, temp)<quick_error(OG, x))
                x = temp;
                s = 1.1*s;
            else
                s = 0.5*s;
            end
        end
        rrmse_value=RRMSE(OG,x);
    end
            
end