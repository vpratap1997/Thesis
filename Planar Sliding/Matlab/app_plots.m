clc;clear all;
load 3pointsapp200

subplot(3,2,1)
plot3(F(:,1),F(:,2),F(:,3),'.b');
axis('image')
xlabel('x');
ylabel('y');
zlabel('z');
hold on
plot3(F1(:,1),F1(:,2),F1(:,3),'.r');
legend('data','app')
view(3);

subplot(3,2,2)
plot3(F(:,1),F(:,2),F(:,3),'.b');
axis('image')
xlabel('x');
ylabel('y');
zlabel('z');
hold on
plot3(F1(:,1),F1(:,2),F1(:,3),'.r');
view([10,60]);

subplot(3,2,3)
plot3(F(:,1),F(:,2),F(:,3),'.b');
axis('image')
xlabel('x');
ylabel('y');
zlabel('z');
hold on
plot3(F1(:,1),F1(:,2),F1(:,3),'.r');
view([45,45]);

subplot(3,2,4)
plot(F(:,1),F(:,2),'.b');
axis('image')
xlabel('x');
ylabel('y');
hold on
plot(F1(:,1),F1(:,2),'.r');

subplot(3,2,5)
plot(F1(:,2),F1(:,3),'.b');
axis('image')
xlabel('y');
ylabel('z');
hold on
plot(F(:,2),F(:,3),'.r');

subplot(3,2,6)
plot(F(:,1),F(:,3),'.b');
axis('image')
xlabel('x');
ylabel('z');
hold on
plot(F1(:,1),F1(:,3),'.r');


