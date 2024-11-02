clc
clear all
n1=10;
x=linspace(0,7,n1);
x=x.';
F=[];
for i=1:n1
    if x(i)<1
        F=[F;1-x(i)];
    else
        F=[F;0];
    end
end
lambda=[1,2,3,4,5,6,7,8,9,10];
n=length(lambda);
C=zeros(n1,n);
for i=1:n1
    for j=1:n
        C(i,j)=exp(-1*lambda(j)*x(i));
    end
end
disp(cond(C))
A=F\C;
plot(x,C*A.')
T=C*A.';
