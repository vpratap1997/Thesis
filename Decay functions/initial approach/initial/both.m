clc
clear all
n1=20;
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
lambda_a=ones(1,n1);
solbeta=[];
soldelta=[];
for iter=1:100000
    g=lambdaanda(lambda_a,x);
    beta = F-g;
    solbeta=[solbeta,norm(beta)];
    deri= myderivative(lambda_a,x);
    delta=(beta\deri);
    soldelta=[soldelta,norm(delta)];
    if norm(delta)< 10^(-3)
        break
    end
    lambda_a=lambda_a+delta;
end
% for iter=1:10000
% G=
% beta=(F-C*A.');
% deri= myderi(lambda,x,A);
% %disp(cond(((deri.')*deri)))
% deltalambda=((deri.')*beta)\((deri.')*deri);
% if norm(deltalambda)<10^(-2)
%     ans1=iter;
%     break
% end
% soldeltalambda=[soldeltalambda;deltalambda];
% solbeta=[solbeta,norm(beta)];
% lambda=deltalambda+lambda;
% sollambda=[sollambda;lambda];
% solA=[solA;A];
% end
% [A,C]= myfunction(sollambda(ans1,:),x,F);
% %plot(solbeta)
plot(x,F,'r--',x,g,'b-','LineWidth',1.5)
xlabel 'x'
ylabel 'f(x)'
legend('Original Function','Approximation')
title('Using real values for n=5')