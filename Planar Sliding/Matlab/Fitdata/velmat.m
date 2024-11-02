function [ev]=velmat(q)
load FV_rtri
[m,n]=size(F);
ev=[];
vapp=[];
for i=1:m
    x=F(i,1);
    y=F(i,2);
    z=F(i,3);
    g(i,1)=4*q(1)*x^3 + 3*q(4)*x^2*y + 3*q(5)*x^2*z + q(6)*y^3 + q(8)*z^3 + 2*q(10)*x*y*z + q(11)*y^2*z + q(12)*z^2*y + 2*q(13)*x*y^2 + 2*q(15)*z^2*x;
    g(i,2)=4*q(2)*y^3 + q(4)*x^3 + 3*q(6)*y^2*x + 3*q(7)*y^2*z + q(9)*z^3 + q(10)*x^2*z + 2*q(11)*y*x*z + q(12)*z^2*x + 2*q(13)*x^2*y + 2*q(14)*y*z^2;
    g(i,3)=4*q(3)*z^3 + q(5)*x^3 + q(7)*y^3 + 3*x*q(8)*z^2 + 3*q(9)*z^2*y + q(10)*x^2*y + q(11)*y^2*x + 2*q(12)*z*y*x + 2*q(14)*y^2*z + 2*q(15)*z*x^2;
    va=g(i,:)/norm(g(i,:));
    vapp=[vapp;va];
    ev=[ev;norm(v(i,:)-va)];
end
ev=sort(ev);
end
