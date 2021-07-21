function[M]=code1(z1,z2)
s=1;
theta=3;
M=[cos(theta) -sin(theta); sin(theta) cos(theta)];
M_diff=[sin(theta) cos(theta);-cos(theta) sin(theta)];
while (s>0.00001)
    cost=sum((z1-M*z2).^2,'all');
    diff=((z1-M*z2)*((M_diff*z2).'));
    theta=theta-s*2*(diff(1,1)+diff(2,2));
    M=[cos(theta) -sin(theta); sin(theta) cos(theta)];
    M_diff=[sin(theta) cos(theta);-cos(theta) sin(theta)];
    cost_new=sum((z1-M*z2).^2,'all');
    if cost_new < cost
        s=1.1*s;
    else
        s=0.5*s;
    end
end
M=[cos(theta) -sin(theta); sin(theta) cos(theta)];
return
    