function [F,v]=datagen
%% normal generated
num=10000;
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
load cont
[m1,m2]=size(r);
mu=(0.5)*ones(m1);
for j=1:num
    for i=1:m1
        vk(i,:)=n(j,:)+cross([0,0,n(j,3)],r(i,:));
        f(i,:)=mu(i)*vk(i,1:2)/norm(vk(i,1:2));
        mk(i,:)=cross(r(i,:),[f(i,:),0]);
    end
    F(j,:)=[sum(f(1:end,:)),sum(mk(1:end,end))];
end
% v1=[];
% for j=1:m1
%     rc=r(j,:);
%     omega=1;
%     n1=cross([0,0,omega],-rc);
%     n1(3)=omega;
%     n1=n1/norm(n1);
%     for i=1:length(r(:,1))
%         vk(i,:)=-cross(r(i,:)-rc,[0,0,omega]);
%         if rc==r(i,:)
%             f(i,:)=[0,0];
%             mk(i,:)=cross(r(i,:),[f(i,:),0]);
%         else
%             f(i,:)=mu(i)*vk(i,1:2)/norm(vk(i,1:2));
%             mk(i,:)=cross(r(i,:),[f(i,:),0]);
%         end
%     end
%     F1(j,:)=[sum(f(1:end,:)),sum(mk(1:end,end))];
%     v1=[v1;n1];
% end
% F2=-F1;
% v2=-v1;
% ff=[];
% vv=[];
% cnt=150;
% theta=linspace(0,2*pi,cnt);
% for i=1:m1
%     for j=1:cnt
%         t=rand/2;
%         f1=t*[sin(theta(j)),cos(theta(j))];
%         mk(i,:)=cross(r(i,:),[f1,0]);
%         f=[f1,mk(i,3)]+F1(i,:);
%         ff=[ff;f];
%         plot3(f(1,1),f(1,2),f(1,3),'.r')
%         vv=[vv;v1(i,:)];
%     end
%     for j=1:cnt
%         t=rand/2;
%         f1=t*[sin(theta(j)),cos(theta(j))];
%         mk(i,:)=cross(r(i,:),[f1,0]);
%         f=[f1,mk(i,3)]+F2(i,:);
%         ff=[ff;f];
%         plot3(f(1,1),f(1,2),f(1,3),'.r')
%         vv=[vv;v2(i,:)];
%     end
% end
% v=[v;vv];
% F=[F;ff];
v=n;
%% plot F and v
% plot3(F(:,1),F(:,2),F(:,3),'.b');
% hold on
% for i = 1:1:num
% quiver3(F(i,1), F(i,2), F(i,3), F(i,1), v(i,2), v(i,3), 0.2,'r-', 'LineWidth', 1.5);
% quiver3(X(i,1), X(i,2), X(i,3), vo(i,1), vo(i,2), vo(i,3), 0.25,'r-', 'LineWidth', 1.5);
% end
end