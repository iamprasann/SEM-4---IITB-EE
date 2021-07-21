function[M2,T]=code2(z1,z2)
theta2=2;
l=1;
s=0.01;
size_pset=size(z1);
numOfPoints=size_pset(2);
T=zeros(2,numOfPoints);
tx=0;
ty=0;
a=s*cos(theta2);
b=s*sin(theta2);
M=[a -b; b a];
z2_new=z2;
z2_new(1,:)=z2(2,:);
z2_new(2,:)=-z2(1,:);
while l>0.000001
    cost=sum((z1-M*z2-T).^2,'all');
    bw1=(z1-M*z2-T)*(z2.');
    bw2=(z1-M*z2-T)*(z2_new.');
    a_temp=a+2*l*(bw1(1,1)+bw1(2,2));
    b_temp=b-2*l*(bw2(1,1)+bw2(2,2));
    tx_temp=tx+2*l*(sum(z1(1,:)-M(1,:)*z2-T(1,:),'all'));
    ty_temp=ty+2*l*(sum(z1(2,:)-M(2,:)*z2-T(2,:),'all'));
    a=a_temp;
    b=b_temp;
    T(1,:)=tx_temp*ones(1,numOfPoints);
    T(2,:)=ty_temp*ones(1,numOfPoints);
    tx=tx_temp;
    ty=ty_temp;
    M=[a -b;b a];
    cost_new=sum((z1-M*z2-T).^2,'all');
    if cost_new < cost
        l=1.1*l;
    else
        l=0.5*l;
    end
end
M2=[a -b;b a];
tx=tx_temp;
ty=ty_temp;
T(1,:)=tx*ones(1,numOfPoints);
T(2,:)=ty*ones(1,numOfPoints);
return
    