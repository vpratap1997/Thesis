function x=inf_norm_sol(A,b)
% solves Ax=b approximately such that Ax-b is minimized in the
% infinite-norm as opposed to x=A\b, which minimizes Ax-b in the 2-norm.
% It is assumed that A has n rows and m columns, with n >= m,
% and that b has n rows and ONE column
[n,m]=size(A);
f=[1;zeros(n+m,1)];
% op=optimset(’maxiter’,2000); % this is an optional command
AA=[zeros(n,1),-eye(n),A];
B=zeros(2*n+1,n+m+1);
B(:,1)=-ones(2*n+1,1);
B(2:n+1,2:n+1)=eye(n);
B(n+2:2*n+1,2:n+1)=-eye(n);
z=zeros(2*n+1,1);
% x=linprog(f,B,z,AA,b,[],[],[],op); % use this, in place of the
% following line, if options are set above
x=linprog(f,B,z,AA,b);
x=x(n+2:end);
end