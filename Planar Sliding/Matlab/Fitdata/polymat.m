function q=polymat
load FV_rtri
F=[F;-F];
v=[v;-v];
[m,n]=size(F);
E=[];
for i=1:m
    x=F(i,1);
    y=F(i,2);
    z=F(i,3);
    e=[x^4,y^4,z^4, ...
       (x^3)*y,(x^3)*z,(y^3)*x,(y^3)*z,(z^3)*x,(z^3)*y,...
        (x^2)*y*z,(y^2)*x*z,(z^2)*y*x, ...
        (x^2)*(y*2),(y^2)*(z^2),(z^2)*(x^2)];
    E=[E;e];
end
b=ones(m,1);
q=E\b;
end