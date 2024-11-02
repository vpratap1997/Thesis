function S=fitLL(q,pp)
theta=q(1); phi=q(2);
theta1=q(3); phi1=q(4);
theta2=q(5); phi2=q(6);
theta3=q(7); phi3=q(8);

load datagenerated

e=[sin(theta)*cos(phi); sin(theta)*sin(phi); cos(theta)];
e1=[sin(theta1)*cos(phi1); sin(theta1)*sin(phi1); cos(theta1)];
e2=[sin(theta2)*cos(phi2); sin(theta2)*sin(phi2); cos(theta2)];
e3=[sin(theta3)*cos(phi3); sin(theta3)*sin(phi3); cos(theta3)];

m=abs(n*e); mm=abs(n*e1); mm1=abs(n*e2); mm2=abs(n*e3);
[m1,m2]=size(n);

n0=n;
for k=1:m1
    n(k,4:15)=[m(k)*n(k,1:3),mm(k)*n(k,1:3),mm1(k)*n(k,1:3),mm2(k)*n(k,1:3)];
end

Abar=n\F;
S=n*Abar;
P=zeros(m1,1);
for k=1:m1
    P(k)=[S(k,:)-F(k,:)]*n0(k,:)';
end
S=norm(P);

if nargin == 2
    clf
    plot3(F(:,1),F(:,2),F(:,3),'.')
    hold on
    F=n*Abar;
    plot3(F(:,1),F(:,2),F(:,3),'r.')
    axis('image')
    hold off
end

