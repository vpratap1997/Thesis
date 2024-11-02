function x=newton(fun,x)

ep=1e-7;
n=length(x);

e=eye(n)*ep;

f0=feval(fun,x);
tol=1e-8;

iter=0;
while (iter < 60)*(norm(f0)>tol)
    iter=iter+1;
    
    D=zeros(n);
    for k=1:n
        D(:,k)=(feval(fun,x+e(:,k))-f0)/ep;
    end
    
    x=x-D\f0;
    f0=feval(fun,x);
end

if iter==60
    disp('did not converge')
end
