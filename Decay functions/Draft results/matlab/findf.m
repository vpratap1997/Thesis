function f=findf(t,x)
dt=t(2)-t(1);
xd=[x(2:end)-x(1:end-1);0]/dt;
n=length(x);
A=zeros(n);
for k=1:n
    f=zeros(n,1);
    f(k)=1;
    c=conv(x,f);
    A(:,k)=c(1:n)*dt;
end
f=A\xd;
end