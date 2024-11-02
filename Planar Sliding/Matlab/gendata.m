function [F,n]=gendata(num,r,mu)
n=randn(num,3);
for i=1:num
    n(i,:)=n(i,:)/norm(n(i,:));
end
%plot3(n(:,1),n(:,2),n(:,3),'.');
%% forces generated
%r=[[0,1,0];[cosd(30),-sind(30),0];[-cosd(30),-sind(30),0]];
%r=[[1,1,0];[1,-1,0];[-1,-1,0];[-1,1,0]];
load squarer
[m1,m2]=size(r);
if nargin~=3
    mu=(0.5)*ones(size(r));
end
for j=1:num
    for i=1:m1
        vk(i,:)=n(j,:)+cross(r(i,:),[0,0,n(j,3)]);
        f(i,:)=-mu(i)*vk(i,1:2)/norm(vk(i,1:2));
        mk(i,:)=cross(r(i,:),[f(i,:),0]);
        disp(f(i,:));
        disp(mk(i,end));
    end
    F(j,:)=[f(i,:),mk(i,end)];
end
end
