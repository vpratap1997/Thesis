clc;clear all;
load fv2000
% plot3(F(:,1),F(:,2),F(:,3),'.b');
% axis('equal')
% xlabel('x');
% ylabel('y');
% zlabel('z');
% hold on
r=[[-40,-40,0];[-40,80,0];[80,-40,0]];
r=r/150;
%r=[[1,1,0];[1,-1,0];[-1,-1,0];[-1,1,0]];
%r=[[0,1,0];[cosd(30),-sind(30),0];[-cosd(30),-sind(30),0]];
%r=[[0,1,0];[0,-1,0]];
%X=[[0,1,0];[cosd(30),-sind(30),0];[-cosd(30),-sind(30),0];[0,1,0]];
% X=[[1,1,0];[1,-1,0];[-1,-1,0];[-1,1,0];[1,1,0]];
% idx = inpolygon(r(:,1), r(:,2), X(:,1), X(:,2));
% r = r(idx, :);
[m1,m2]=size(r);
mu=(0.5)*ones(size(r));
v1=[];
for j=1:m1
    rc=r(j,:);
    omega=1;
    n1=-cross(rc,[0,0,omega]);
    n1(3)=omega;
    n1=n1/norm(n1);
    for i=1:length(r(:,1))
        vk(i,:)=-cross(r(i,:)-rc,[0,0,omega]);
        if rc==r(i,:)
            f(i,:)=[0,0];
            mk(i,:)=cross(r(i,:),[f(i,:),0]);
        else
            f(i,:)=-mu(i)*vk(i,1:2)/norm(vk(i,1:2));
            mk(i,:)=cross(r(i,:),[f(i,:),0]);
        end
    end
    F1(j,:)=[sum(f(1:end,:)),sum(mk(1:end,end))];
    v1=[v1;n1];
end
F2=-F1;
v2=-v1;
ff=[];
vv=[];
cnt=150;
theta=linspace(0,2*pi,cnt);
for i=1:m1
    for j=1:cnt
        t=rand/2;
        f1=t*[sin(theta(j)),cos(theta(j))];
        mk(i,:)=cross(r(i,:),[f1,0]);
        f=[f1,mk(i,3)]+F1(i,:);
        ff=[ff;f];
        plot3(f(1,1),f(1,2),f(1,3),'.r')
        vv=[vv;v1(i,:)];
    end
    for j=1:cnt
        t=rand/2;
        f1=t*[sin(theta(j)),cos(theta(j))];
        mk(i,:)=cross(r(i,:),[f1,0]);
        f=[f1,mk(i,3)]+F2(i,:);
        ff=[ff;f];
        plot3(f(1,1),f(1,2),f(1,3),'.r')
        vv=[vv;v2(i,:)];
    end
end
% F(:,3)=F(:,3)/150;
% ff(:,3)=ff(:,3)/150;
subplot(3,2,1)
plot3(F(:,1),F(:,2),F(:,3),'.b');
axis('image')
xlabel('x');
ylabel('y');
zlabel('z');
hold on
plot3(ff(:,1),ff(:,2),ff(:,3),'.r');
view(3);

subplot(3,2,2)
plot3(F(:,1),F(:,2),F(:,3),'.b');
axis('image')
xlabel('x');
ylabel('y');
zlabel('z');
hold on
plot3(ff(:,1),ff(:,2),ff(:,3),'.r');
view([10,60]);

subplot(3,2,3)
plot3(F(:,1),F(:,2),F(:,3),'.b');
axis('image')
xlabel('x');
ylabel('y');
zlabel('z');
hold on
plot3(ff(:,1),ff(:,2),ff(:,3),'.r');
view([45,45]);

subplot(3,2,4)
plot(F(:,1),F(:,2),'.b');
axis('image')
xlabel('x');
ylabel('y');
hold on
plot(ff(:,1),ff(:,2),'.r');

subplot(3,2,5)
plot(F(:,2),F(:,3),'.b');
axis('image')
xlabel('y');
ylabel('z');
hold on
plot(ff(:,2),ff(:,3),'.r');

subplot(3,2,6)
plot(F(:,1),F(:,3),'.b');
axis('image')
xlabel('x');
ylabel('z');
hold on
plot(ff(:,1),ff(:,3),'.r');


