%% Ellipse Code
load('../data/ellipses2D.mat')
x=pointSets(1,:,:);
y=pointSets(2,:,:);
size_x=size(x);
figure();
hold on;
for i = 1:size_x(3)
    scatter(x(1,:,i),y(1,:,i),[],[rand rand rand],'filled')
end
hold off;
figure();
hold on;
%mean shape using code11
[z_mean_c1,z_set_c1]=code11(x,y);
plot(z_mean_c1(1,:,:),z_mean_c1(2,:,:),'-x','LineWidth',1,'Color','black');
hold off;
%variation in shape using code11
variation(z_mean_c1,z_set_c1);

figure();
hold on;
%mean shape using code22
[z_mean_c2,z_set_c2]=code22(x,y);
plot(z_mean_c2(1,:,:),z_mean_c2(2,:,:),'-x','LineWidth',1,'Color','black');
hold off;
%variation in shape using code22
variation(z_mean_c2,z_set_c2);

   
%% Hands Code
load('../data/hands2D.mat')
x=shapes(1,:,:);
y=shapes(2,:,:);
size_x=size(x);
figure();
hold on;
%plotting all datapoints
for i = 1:size_x(3)
    scatter(x(1,:,i),y(1,:,i),[],[rand rand rand],'filled')
end
hold off;
figure();
hold on;
%mean shape using code11
[z_mean_c1,z_set_c1]=code11(x,y);
plot(z_mean_c1(1,:,:),z_mean_c1(2,:,:),'-x','LineWidth',1,'Color','black');
hold off;
%variation in shape using code11
variation(z_mean_c1,z_set_c1);

figure();
hold on;
%mean shape using code22
[z_mean_c2,z_set_c2]=code22(x,y);
plot(z_mean_c2(1,:,:),z_mean_c2(2,:,:),'-x','LineWidth',1,'Color','black');
hold off;
%variation in shape using code22
variation(z_mean_c2,z_set_c2);
