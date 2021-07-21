function variation(z_mean,z_set)
size_zset=size(z_set);
x_rv=ones(size_zset(2),size_zset(3));
y_rv=ones(size_zset(2),size_zset(3));
x_rv(:,:)=z_set(1,:,:);
y_rv(:,:)=z_set(2,:,:);
x_rv=x_rv.';
y_rv=y_rv.';

rv=[x_rv y_rv]; 
mu=[z_mean(1,:) z_mean(2,:)];
covar=zeros(2*size_zset(2),2*size_zset(2));
for i=1:size_zset(3)
    covar(:,:)=covar(:,:)+((rv(i,:)-mu).')*(rv(i,:)-mu);
end
covar(:,:)=(1/size_zset(3))*covar(:,:);
[V,D]=eig(covar);
d_size=size(D);
eig_values=ones(d_size(1));
for lv=1:d_size(1)
    eig_values(lv)=D(lv,lv);
end
[eig_values_sorted,index_vec]=sort(eig_values,'descend');
% disp(eig_values_sorted(1));
% disp(eig_values_sorted(2));
% disp(eig_values_sorted(3));
figure();
plot(eig_values_sorted);
for modes=1:3
    figure();
    hold on;
    for i=1:size_zset(3)
        z1=[z_set(1,:,i);z_set(2,:,i)];
        scatter(z1(1,:,:),z1(2,:,:),[],1/255*[255 255 0],'filled')
    end
    plot(z_mean(1,:,:),z_mean(2,:,:),'-x','LineWidth',1,'Color','g');
    mode_max=mu+3*sqrt(eig_values_sorted(modes))*(V(:,index_vec(modes)).');
    plot(mode_max(1,1:size_zset(2)),mode_max(1,size_zset(2)+1:2*size_zset(2)),'-x','LineWidth',1,'Color','b');
    mode_min=mu-3*sqrt(eig_values_sorted(modes))*(V(:,index_vec(modes)).');
    plot(mode_min(1,1:size_zset(2)),mode_min(1,size_zset(2)+1:2*size_zset(2)),'-x','LineWidth',1,'Color','r');
    hold off;
end

return

