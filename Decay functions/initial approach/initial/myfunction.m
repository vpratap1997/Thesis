function [A,C]=myfunction(lambda,x,F)
n=length(lambda);
n1=length(x);
C=zeros(n1,n);
for i=1:n1
    for j=1:n
        C(i,j)=exp(-1*lambda(j)*x(i));
    end
end
%disp(cond(C))
A=F\C;
end