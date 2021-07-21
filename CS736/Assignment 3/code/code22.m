function[z_mean,z_set]=code22(x,y)
size_x=size(x);
%initialization for mean shape
z_mean=[x(1,:,20);y(1,:,20)];

M_set=ones(2,2,size_x(3));
T_set=ones(2,size_x(2),size_x(3));
z_set=[x(1,:,:);y(1,:,:)];
z_og=[x(1,:,:);y(1,:,:)];

for pset=1:size_x(3)
    [M_set(:,:,pset),T_set(:,:,pset)]=code2(z_mean,z_og(:,:,pset));
    z_set(:,:,pset)=M_set(:,:,pset)*z_og(:,:,pset)+T_set(:,:,pset);
end

for j=1:size_x(2)
    z_mean(1,j)=mean(z_set(1,j,:));
    z_mean(2,j)=mean(z_set(2,j,:));
end

for i=1:size_x(3)
    z1=[z_set(1,:,i);z_set(2,:,i)];
    scatter(z1(1,:,:),z1(2,:,:),[],1/255*[255 165 0],'filled')
end
return
    