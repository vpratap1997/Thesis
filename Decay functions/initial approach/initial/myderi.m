function [C]=myderi(lambda,x,A)
A=A;
n=length(lambda);
n1=length(x);
for i=1:n1
    for j=1:n
        C(i,j)=-A(j)*x(i)*exp(-1*lambda(j)*x(i));
    end
end
disp(cond(C))
end