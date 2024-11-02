function g=lambdaanda(lambda_a,x)
n=length(x);
a=lambda_a(1:n/2);
lambda=lambda_a(n/2+1:n);
G=ones(n,n/2);
for i=1:n
    for j=1:length(lambda)
        G(i,j)=exp(-lambda(j)*x(i));
    end
end
g=G*a.';
end