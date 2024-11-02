function S=fitLLe(q,pp)
t1=1;
num=length(q)/2;
for t=1:num
    theta(t)=q(t1); phi(t)=q(t1+1);
    t1=t1+1;
end
%disp([theta,phi]);
load con4
t1=1;
for t=1:num
    e=[sin(theta(t))*cos(phi(t)); sin(theta(t))*sin(phi(t)); cos(theta(t))];
    m(:,t)=abs(n*e);
end
%disp(m)
%m=abs(n*e); mm=abs(n*e1); mm1=abs(n*e2); mm2=abs(n*e3);
[m1,m2]=size(n);

n0=n;
for t=1:num
    for k=1:m1
        n(k,3*t+1:3*t+3)=[m(k,t)*n(k,1:3)];
    end
end


Abar=n\F;
S=n*Abar;
P=zeros(m1,1);
for k=1:m1
    P(k)=[S(k,:)-F(k,:)]*n0(k,:)';
end
S=norm(P);

if nargin == 2
    clf
    plot3(F(:,1),F(:,2),F(:,3),'.')
    hold on
    F=n*Abar;
    plot3(F(:,1),F(:,2),F(:,3),'r.')
    axis('image')
    hold off
end

