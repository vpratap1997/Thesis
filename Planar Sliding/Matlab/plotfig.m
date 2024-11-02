figure(1)

subplot(3,3,1)
load squareapp1
plot3(F(:,1),F(:,2),F(:,3),'.b');
axis('image')
xlabel('F_x');
ylabel('F_y');
zlabel('M');
hold on
plot3(F1(:,1),F1(:,2),F1(:,3),'.r');
title('Square surface');


subplot(3,3,2)
load triangleapp1
plot3(F(:,1),F(:,2),F(:,3),'.b');
axis('image')
xlabel('F_x');
ylabel('F_y');
zlabel('M');
hold on
plot3(F1(:,1),F1(:,2),F1(:,3),'.r');
title('triangular surface');

subplot(3,3,3)
load ellipseapp1
plot3(F(:,1),F(:,2),F(:,3),'.b');
axis('image')
xlabel('F_x');
ylabel('F_y');
zlabel('M');
hold on
plot3(F1(:,1),F1(:,2),F1(:,3),'.r');
title('elliptical surface');

subplot(3,3,4)
load squareapp2
plot3(F(:,1),F(:,2),F(:,3),'.b');
axis('image')
xlabel('F_x');
ylabel('F_y');
zlabel('M');
hold on
plot3(F1(:,1),F1(:,2),F1(:,3),'.r');

subplot(3,3,5)
load triangleapp2
plot3(F(:,1),F(:,2),F(:,3),'.b');
axis('image')
xlabel('F_x');
ylabel('F_y');
zlabel('M');
hold on
plot3(F1(:,1),F1(:,2),F1(:,3),'.r');

subplot(3,3,6)
load ellipseapp2
plot3(F(:,1),F(:,2),F(:,3),'.b');
axis('image')
xlabel('F_x');
ylabel('F_y');
zlabel('M');
hold on
plot3(F1(:,1),F1(:,2),F1(:,3),'.r');

subplot(3,3,7)
load squareapp3
plot3(F(:,1),F(:,2),F(:,3),'.b');
axis('image')
xlabel('F_x');
ylabel('F_y');
zlabel('M');
hold on
plot3(F1(:,1),F1(:,2),F1(:,3),'.r');

subplot(3,3,8)
load triangleapp3
plot3(F(:,1),F(:,2),F(:,3),'.b');
axis('image')
xlabel('F_x');
ylabel('F_y');
zlabel('M');
hold on
plot3(F1(:,1),F1(:,2),F1(:,3),'.r');

subplot(3,3,9)
load ellipseapp3
plot3(F(:,1),F(:,2),F(:,3),'.b');
axis('image')
xlabel('F_x');
ylabel('F_y');
zlabel('M');
hold on
plot3(F1(:,1),F1(:,2),F1(:,3),'.r');

% 
% subplot(4,3,10)
% load squareapp0
% plot3(F(:,1),F(:,2),F(:,3),'.b');
% axis('image')
% xlabel('x');
% ylabel('y');
% zlabel('z');
% hold on
% plot3(F1(:,1),F1(:,2),F1(:,3),'.r');
% 
% subplot(4,3,11)
% load triangleapp0
% plot3(F(:,1),F(:,2),F(:,3),'.b');
% axis('image')
% xlabel('x');
% ylabel('y');
% zlabel('z');
% hold on
% plot3(F1(:,1),F1(:,2),F1(:,3),'.r');
% 
% subplot(4,3,12)
% load ellipseapp0
% plot3(F(:,1),F(:,2),F(:,3),'.b');
% axis('image')
% xlabel('x');
% ylabel('y');
% zlabel('z');
% hold on
% plot3(F1(:,1),F1(:,2),F1(:,3),'.r');
% 
% 
