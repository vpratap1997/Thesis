clc
clear all
n1=10;
x=linspace(0,3,n1);
x=x.';
F=[];
for i=1:n1
    if x(i)<1
        F=[F;1-x(i)];
    else
        F=[F;0];
    end
end
sollambda=[];
solbeta=[];
n=5;
lambda=[.1,.2,.3,.4,.5,.6,.7,.8,.9,.1];
sollambda=[lambda];
solA=[];
soldeltalambda=[];
for iter=1:10000
[A,C]= myfunction(lambda,x,F);
beta=(F-C*A.');
deri= myderi(lambda,x,A);
%disp(cond(((deri.')*deri)))
deltalambda=((deri.')*beta)\((deri.')*deri);
if norm(deltalambda)<10^(-2)
    ans1=iter;
    break
end
soldeltalambda=[soldeltalambda;deltalambda];
solbeta=[solbeta,norm(beta)];
lambda=deltalambda+lambda;
sollambda=[sollambda;lambda];
solA=[solA;A];
end
[A,C]= myfunction(sollambda(ans1,:),x,F);
%plot(solbeta)
plot(x,F,'r--',x,C*A.','b-','LineWidth',1.5)
T=C*A.';
xlabel 'x'
ylabel 'f(x)'
legend('Original Function','Approximation')
title('Using real values for n=5')