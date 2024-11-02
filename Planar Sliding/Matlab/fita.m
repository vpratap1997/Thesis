function E=fita(q)
t=q;
B=[[t(1);0;0],[t(2:3);0],[t(4:6)]];
B=B'*B;
E=0;
load newper2000
[n1,n2]=size(F);
g=[];
for k=1:n1
    f=F(k,:);
    m=0.5;
    g(k,:)=1-(f*B*f')^m;
    R(k,:)=[f(1)^2;2*f(1)*f(2);2*f(1)*f(3);f(2)^2;2*f(2)*f(3);f(3)^2];
end
a=R\g;
a=a';
A=[[a(1),a(2),a(3)];[a(2),a(4),a(5)];[a(3),a(5),a(6)]];
for k=1:n1
    f=F(k,:);
    m=0.5;
    E=E+(f*A*f'+(f*B*f')^m -1)^2;
end
end