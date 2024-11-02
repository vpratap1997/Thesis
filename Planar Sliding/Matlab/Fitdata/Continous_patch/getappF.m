function [Fapp,vapp]=getappF(q)
t=q(1:6);
A=[[t(1);0;0],[t(2:3);0],[t(4:6)]];
A=A'*A;
if length(q)>6
    t=q(7:12);
end
B=[[t(1);0;0],[t(2:3);0],[t(4:6)]];
B=B'*B;
if length(q)>12
    t=q(13:18);
end
C=[[t(1);0;0],[t(2:3);0],[t(4:6)]];
C=C'*C;
if length(q)>18
    t=q(19:24);
end
D=[[t(1);0;0],[t(2:3);0],[t(4:6)]];
D=D'*D;
E=0;
Ev=[];
load Fsphere
[n1,n2]=size(F);
Fapp=[];
vapp=[];
for k=1:n1
    f=F(k,:);
    if length(q)==6
        m=0;
        E=E+(f*A*f'-1)^2;
        alpha=(1/(f*A*f'))^1/2;
        if any(imag(alpha))
            disp(alpha);
            error('alpha is imaginary')
        end
        
        Fapp=[Fapp;alpha*f];
        f=alpha*f;
        g=2*f*A;
        g=g/norm(g);
        vapp=[vapp;g];
        
    elseif length(q)==12
        m1=0.5;
        E=E+(f*A*f'+(f*B*f')^m1 -1)^2;
        c=roots([f*A*f',(f*B*f')^m1,-1]);
        cr=c(imag(c)==0);
        cr=cr(real(cr)>=0);
        cc=abs(cr-1);
        [m,n]=min(cr);
        alpha=cr(n);
        if any(imag(alpha))
            disp(alpha);
            disp(cr(n));
            disp(cr);
            error('alpha is imaginary')
        end
        Fapp=[Fapp;alpha*f];
        
        f=alpha*f;
        g=2*f*A+(1/2)*((f*B*f')^(-1/2))*(2*f*B);
        g=g/norm(g);
        vapp=[vapp;g];
        
        
    elseif length(q)==18
        m1=1/3; m2=2/3;
        E=E+(f*A*f'+(f*B*f')^m1+(f*C*f')^m2 -1)^2;
        c=roots([f*A*f',(f*C*f')^m2,(f*B*f')^m1,-1]);
        cr=c(imag(c)==0);
        cr=cr(real(cr)>=0);
        cc=abs(cr-1);
        [m,n]=min(cr);
        alpha=(cr(n))^(3/2);
        if any(imag(alpha))
            disp(alpha);
            disp(cr(n));
            disp(cr);
            error('alpha is imaginary')
        end
        Fapp=[Fapp;alpha*f];
        
        f=alpha*f;
        g=2*f*A+(1/3)*((f*B*f')^(-2/3))*(2*f*B)+(2/3)*((f*C*f')^(-1/3))*(2*f*C);
        g=g/norm(g);
        vapp=[vapp;g];
        
        
    elseif length(q)==24
        m1=1/4; m2=2/4; m3=3/4; 
        E=E+(f*A*f'+(f*B*f')^m1+(f*C*f')^m2 +(f*D*f')^m3 -1)^2;
        c=roots([f*A*f',(f*D*f')^m3,(f*C*f')^m2,(f*B*f')^m1,-1]);
        cr=c(imag(c)==0);
        cr=cr(real(cr)>=0);
        cc=abs(cr-1);
        [m,n]=min(cr);
        alpha=(cr(n))^(2);
        if any(imag(alpha))
            disp(alpha);
            disp(cr(n));
            disp(cr);
            error('alpha is imaginary')
        end
        Fapp=[Fapp;alpha*f];
        
        f=alpha*f;
        g=2*f*A+(1/4)*((f*B*f')^(-3/4))*(2*f*B)+(2/4)*((f*C*f')^(-2/4))*(2*f*C)+(3/4)*((f*D*f')^(-1/4))*(2*f*D);
        g=g/norm(g);
        vapp=[vapp;g];
    end
    
end
% plot3(F(:,1),F(:,2),F(:,3),'.b');
% hold on 
% axis('equal')
% plot3(Fapp(:,1),Fapp(:,2),Fapp(:,3),'.r');
% quiver3(F(:,1), F(:,2), F(:,3), vapp(:,1), vapp(:,2), vapp(:,3),'r-', 'LineWidth', 1.5);
%save vel_error_3term Ev
% plot3(v(:,1),v(:,2),v(:,3),'.b');
% hold on
% disp(size(vapp));
% disp(Ev);
% plot3(vapp(:,1),vapp(:,2),vapp(:,3),'.r');
% axis image
 
end