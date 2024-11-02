%% normal generated
clc;clear all;
num=20000;
n=randn(num,3);
for i=1:num
    n(i,:)=n(i,:)/norm(n(i,:));
end
%plot3(n(:,1),n(:,2),n(:,3),'.');
%% forces generated
%r=[[0,1,0];[cosd(30),-sind(30),0];[-cosd(30),-sind(30),0]];
r=[[1,1,0];[1,-1,0];[-1,-1,0];[-1,1,0]];
[m1,m2]=size(r);
mu=(0.5)*ones(size(r));
for j=1:num
    for i=1:length(r(:,1))
        vk(i,:)=n(j,:)+cross(r(i,:),[0,0,n(j,3)]);
        f(i,:)=-mu(i)*vk(i,1:2)/norm(vk(i,1:2));
        mk(i,:)=cross(r(i,:),[f(i,:),0]);
    end
    F(j,:)=[sum(f(1:end,:)),sum(mk(1:end,end))];
end
%% fit
global theta
global phi
l=10;
theta=linspace(0,2*pi,l);
phi=linspace(0,pi,l);
for x=1:l
    for y=1:l
        theta1=theta(x);
        phi1=phi(y);
        e=[sin(phi1)*cos(theta1),sin(phi1)*sin(theta1),cos(phi1)];
        p=F';
        for i=1:num
            m(:,i)=abs(n(i,:)*e').*n(i,:)';
        end
        q=[n';m];
        Abar=p'\q';
        fa=q'*Abar';
        E=F-fa;
        for i=1:num
            ee(i)=norm(E(i,:));
        end
        avge(x,y)=mean(ee);
    end
end
minMatrix = min(avge(:));
[row,col] = find(avge==minMatrix);
theta1=theta(row);
phi1=phi(col);
e=[sin(phi1)*cos(theta1),sin(phi1)*sin(theta1),cos(phi1)];
p=F';
for i=1:num
    m(:,i)=abs(n(i,:)*e').*n(i,:)';
end
q=[n';m];
Abar=p'\q';
fa=q'*Abar';
E=F-fa;
for i=1:num
    ee(i)=norm(E(i,:));
end
avg=mean(ee);










