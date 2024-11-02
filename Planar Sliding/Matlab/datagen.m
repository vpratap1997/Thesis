function [F,v]=datagen
%% normal generated
num=20000;
n=randn(num,3);
for i=1:num
    n(i,:)=n(i,:)/norm(n(i,:));
end
%% forces generated
%r=[[0,1,0];[cosd(30),-sind(30),0];[-cosd(30),-sind(30),0]];
% r=[[-40,-40,0];[-40,80,0];[80,-40,0]];
% r=r/150;
%r=[[1,1,0];[1,-1,0];[-1,-1,0];[-1,1,0]];
%r=[[0,1,0];[0,-1,0]];
%X=[[0,1,0];[cosd(30),-sind(30),0];[-cosd(30),-sind(30),0];[0,1,0]];
%X=[[-40,-40,0];[-40,80,0];[80,-40,0];[-40,-40,0]];
%X=[[1,1,0];[1,-1,0];[-1,-1,0];[-1,1,0];[1,1,0]];
%load ellipse
% X=[[-40,-40,0];[-40,80,0];[80,-40,0];[-40,-40,0]];
% X=X/150;
% r=rescale(rand(1000,2),[-1,-1],[1,1]);
% r(:,3)=0*r(:,1);
% idx = inpolygon(r(:,1), r(:,2), X(:,1), X(:,2));
% r = r(idx, :);
% load cont
%r=[[1,0,0]];
load squarer
[m1,m2]=size(r);
mu=(0.5)*ones(m1);
for j=1:num
    for i=1:m1
        vk(i,:)=n(j,:)+cross([0,0,n(j,3)],r(i,:));
        v_xy=vk(i,1:2)/norm(vk(i,1:2));
        f(i,:)=mu(i)*[v_xy,0];
        f(i,3)=r(i,1)*f(i,2)-r(i,2)*f(i,1);
    end
    F(j,:)=[sum(f(1:end,:))];
end
v=n;
%% plot F and v
%plot3(F(:,1),F(:,2),F(:,3),'.b');
% hold on
% for i = 1:1:num
% quiver3(F(i,1), F(i,2), F(i,3), F(i,1), v(i,2), v(i,3), 0.2,'r-', 'LineWidth', 1.5);
% %quiver3(X(i,1), X(i,2), X(i,3), vo(i,1), vo(i,2), vo(i,3), 0.25,'r-', 'LineWidth', 1.5);
% end
end