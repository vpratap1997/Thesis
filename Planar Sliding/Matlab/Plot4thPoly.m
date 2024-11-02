function [h] = Plotsurface(q,X,b,v)
maxd = max(abs(X)) * 5;
step = maxd / 100;
[n1,n2]=size(X);
x = X(:,1);
y = X(:,2);
z = X(:,3);
t=q(1:6);
A=[[t(1);0;0],[t(2:3);0],[t(4:6)]];
A=A'*A;
if length(q)>6
    t=q(7:12);
end
B=[[t(1);0;0],[t(2:3);0],[t(4:6)]];
B=B'*B;
if length(q)>12
    t=q(13:18);
end
C=[[t(1);0;0],[t(2:3);0],[t(4:6)]];
C=C'*C;
if length(q)>18
    t=q(19:24);
end
D=[[t(1);0;0],[t(2:3);0],[t(4:6)]];
D=D'*D;
[ xx, yy, zz ] = meshgrid( -maxd:step:maxd, -maxd:step:maxd, -maxd:step:maxd);
grad=[];
if length(q)==6
    shape=A(1,1) * xx.^2 + A(2,2) * yy.^2 + A(3,3) * zz.^2 + A(1,2)*2*xx.*yy + A(1,3)*2*xx.*zz + A(2,3)*2*yy.*zz-1;
    for i=1:n1
        f=X(i,:);
        g=2*A*f;
        grad=[grad;g];
    end
elseif length(q)==12
    shape = A(1,1) * xx.^2 + A(2,2) * yy.^2 + A(3,3) * zz.^2 + A(1,2)*2*xx.*yy + A(1,3)*2*xx.*zz + A(2,3)*2*yy.*zz+...
        (B(1,1) * xx.^2 + B(2,2) * yy.^2 + B(3,3) * zz.^2 + B(1,2)*2*xx.*yy + B(1,3)*2*xx.*zz + B(2,3)*2*yy.*zz).^(1/2)-1;
    for i=1:n1
        f=X(i,:);
        g=2*f*A+(1/2)*((f*B*f')^(-1/2))*(2*f*B);
        grad=[grad;g];
    end
elseif length(q)==18
    shape = A(1,1) * xx.^2 + A(2,2) * yy.^2 + A(3,3) * zz.^2 + A(1,2)*2*xx.*yy + A(1,3)*2*xx.*zz + A(2,3)*2*yy.*zz+...
        (B(1,1) * xx.^2 + B(2,2) * yy.^2 + B(3,3) * zz.^2 + B(1,2)*2*xx.*yy + B(1,3)*2*xx.*zz + B(2,3)*2*yy.*zz).^(1/3)+...
        (C(1,1) * xx.^2 + C(2,2) * yy.^2 + C(3,3) * zz.^2 + C(1,2)*2*xx.*yy + C(1,3)*2*xx.*zz + C(2,3)*2*yy.*zz).^(2/3)-1;
    for i=1:n1
        f=X(i,:);
        g=2*f*A+(1/3)*((f*B*f')^(-2/3))*(2*f*B)+(2/3)*((f*C*f')^(-1/3))*(2*f*C);
        grad=[grad;g];
    end
elseif length(q)==24
shape = A(1,1) * xx.^2 + A(2,2) * yy.^2 + A(3,3) * zz.^2 + A(1,2)*2*xx.*yy + A(1,3)*2*xx.*zz + A(2,3)*2*yy.*zz+...
        (B(1,1) * xx.^2 + B(2,2) * yy.^2 + B(3,3) * zz.^2 + B(1,2)*2*xx.*yy + B(1,3)*2*xx.*zz + B(2,3)*2*yy.*zz).^(1/4)+...
        (C(1,1) * xx.^2 + C(2,2) * yy.^2 + C(3,3) * zz.^2 + C(1,2)*2*xx.*yy + C(1,3)*2*xx.*zz + C(2,3)*2*yy.*zz).^(2/4)-1+...
        (D(1,1) * xx.^2 + D(2,2) * yy.^2 + D(3,3) * zz.^2 + D(1,2)*2*xx.*yy + D(1,3)*2*xx.*zz + D(2,3)*2*yy.*zz).^(3/4);
    for i=1:n1
        f=X(i,:);
        g=2*f*A+(1/4)*((f*B*f')^(-3/4))*(2*f*B)+(2/4)*((f*C*f')^(-2/4))*(2*f*C)+(3/4)*((f*D*f')^(-1/4))*(2*f*D);
        grad=[grad;g];
    end
end
% shape = r(1) * xx.^4 + r(2) * yy.^4 + r(3) * zz.^4 + ...
%         r(4) *  xx.^3 .* yy + r(5) * xx.^3 .* zz + r(6) * yy.^3 .* xx + ...
%         r(7) * yy.^3 .* zz + r(8) * zz.^3 .* xx + r(9) * zz.^3 .* yy + ...
%         r(10) *(xx.^2).* (yy.^2) + r(11) *(xx.^2) .* (zz.^2) + r(12) * (yy.^2) .* (zz.^2) + ...      
%         r(13) * (xx.^2) .* yy .* zz + r(14) * (yy.^2) .* xx .* zz + r(15) *  (zz.^2) .* xx .* yy;
% save shape shape
h = figure;
plot3(x,y,z, 'b.');
hold on
plot3(b(:,1),b(:,2),b(:,3), 'r.');
for i = 1:1:n1
    quiver3(X(i,1), X(i,2), X(i,3), v(i,1), v(i,2), v(i,3), 0.1,'r-', 'LineWidth', 1.5);
    %quiver3(X(i,1), X(i,2), X(i,3), vo(i,1), vo(i,2), vo(i,3), 0.25,'r-', 'LineWidth', 1.5);
end

p = patch(isosurface(xx,yy,zz,shape,0));
set( p, 'FaceColor', 'g','FaceAlpha', 0.5, 'EdgeColor', 'none' );
view(45, 20);
%view(3);
grid on;
camlight
axis equal;
xlabel('F_x', 'FontSize', 12);
ylabel('F_y', 'FontSize', 12);
zlabel('F_z', 'FontSize', 12);
end
