pts=20;
% [x,y]=meshgrid(linspace(-1,1,pts),linspace(-1,1,pts));
% r=[];
% for i=1:pts
%     for j=1:pts
%         k=[x(i,j),y(i,j),0];
%         r=[r;k];
%     end
% end
X=[[0,1,0];[cosd(30),-sind(30),0];[-cosd(30),-sind(30),0];[0,1,0]];
r=rescale(rand(400,2),[-1,-1],[1,1]);
r(:,3)=0*r(:,1);
%X=[[1,1,0];[1,-1,0];[-1,-1,0];[-1,1,0];[1,1,0]]
idx = inpolygon(r(:,1), r(:,2), X(:,1), X(:,2));
r = r(idx, :);
%%
t=q(1:6);
A=[[t(1);0;0],[t(2:3);0],[t(4:6)]];
A=A'*A;
if length(q)>6
    t=q(7:12);
end
B=[[t(1);0;0],[t(2:3);0],[t(4:6)]];
B=B'*B;
E=0;
load Fdata
[n1,n2]=size(F);
F1=[];
for k=1:n1
    f=F(k,:);
    if length(q)==6
        m=0;
        E=E+(f*A*f'-1)^2;
        r1=f*A*f';
        r2=(f*B*f')^m;
        alpha=(-r2+sqrt(r2^2+4*r1))/(2*r1);
        F1=[F1;alpha*f];
        
    elseif length(q)==12
        m=0.5;
        E=E+(f*A*f'+(f*B*f')^m -1)^2;
        r1=f*A*f';
        r2=(f*B*f')^m;
        alpha=(-r2+sqrt(r2^2+4*r1))/(2*r1);
        F1=[F1;alpha*f];
    end
    
end
plot3(F(:,1),F(:,2),F(:,3),'.b');
hold on 
axis('equal')
plot3(F1(:,1),F1(:,2),F1(:,3),'.r');
