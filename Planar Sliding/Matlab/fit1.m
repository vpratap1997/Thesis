function E=fit1(q)
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
load fvred
[n1,n2]=size(F);
for k=1:n1
    f=F(k,:);
    va=v(k,:);
    if length(q)==6
        E=E+(f*A*f'-1)^2;
        g=2*f*A;
        g=g/norm(g);
        E=E+norm(va-g);
    elseif length(q)==12
        m=0.5;
        E=E+(f*A*f'+(f*B*f')^m -1)^2;
        g=2*f*A+(1/2)*((f*B*f')^(-1/2))*(2*f*B);
        g=g/norm(g);
        E=E+norm(va-g);
    elseif length(q)==18
        m1=1/3; m2=2/3;
        E=E+(f*A*f'+(f*B*f')^m1 +(f*C*f')^m2 -1)^2;
        g=2*f*A+(1/3)*((f*B*f')^(-2/3))*(2*f*B)+(2/3)*((f*C*f')^(-1/3))*(2*f*C);
        g=g/norm(g);
        E=E+norm(va-g);
    elseif length(q)==24
        m1=1/4; m2=2/4; m3=3/4;
        E=E+(f*A*f'+(f*B*f')^m1 +(f*C*f')^m2 +(f*D*f')^m3 -1)^2;
       
        g=2*f*A+(1/4)*((f*B*f')^(-3/4))*(2*f*B)+(2/4)*((f*C*f')^(-2/4))*(2*f*C)+(3/4)*((f*D*f')^(-1/4))*(2*f*D);
        g=g/norm(g);
        E=E+norm(va-g);
    end
            
end

end