function A=myderivative(lambda_a,x)
n=length(x);
a=lambda_a(1:n/2);
lambda=lambda_a(n/2+1:n);
A=ones(n,n);
for i=1:n
    for j=1:n
        if i<=n/2
            A(i,j)=a(i)*x(j)*exp(-lambda(i)*x(j));
        else
            A(i,j)=exp(-lambda(i-n/2)*x(j));
        end
    end
end
disp(cond(A))
disp(size(A))
end