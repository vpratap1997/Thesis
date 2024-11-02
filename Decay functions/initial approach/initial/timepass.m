function y=timepass(A,r,n,tdata)
A = optimvar('A',2*n);
r = optimvar('r',n);
y=zeros(1,length(tdata));
for i=1:n
    y=y+(A(i*2)*cos(-r(i)*tdata)+A(2*i+1)*sin(-r(i)*tdata)).*exp(-r(i)*tdata);
end
end