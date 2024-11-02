x=linspace(0,1,5);
phi=ones(5,5);
for i=1:5
    for j=2:5
        phi(i,j)=x(i)^(j-1);
    end
end
A=phi.'*phi
