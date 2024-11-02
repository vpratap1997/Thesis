function E=getappa(q)
t=q(1:6);
B=[[t(1);0;0],[t(2:3);0],[t(4:6)]];
B=B'*B;
E=0;
load rt_2000_F_b
[n1,n2]=size(F);
g=[];
F1=[];
for k=1:n1
    f=F(k,:);
    m=0.5;
    g(k,:)=1-(f*B*f')^m;
    R(k,:)=[f(1)^2;2*f(1)*f(2);2*f(1)*f(3);f(2)^2;2*f(2)*f(3);f(3)^2];
end
a=R\g;
a=a';
A=[[a(1),a(2),a(3)];[a(2),a(4),a(5)];[a(3),a(5),a(6)]];
Alpha=[];
for k=1:n1
    f=F(k,:);
    m=0.5;
    E=E+(f*A*f'+(f*B*f')^m -1)^2;
    r1=f*A*f';
    r2=(f*B*f')^m;
    alpha=(-r2+sqrt(r2^2+4*r1))/(2*r1);
    Alpha=[Alpha,alpha];
    F1=[F1;alpha*f];
end
%save Alpha Alpha
plot3(F(:,1),F(:,2),F(:,3),'.b');
hold on 
axis('equal')
plot3(F1(:,1),F1(:,2),F1(:,3),'.r');
%save fea F1 F
end