n1=100;
tdata=linspace(0,7,n1);
ydata=[];
for i=1:n1
    if tdata(i)<1
        ydata=[ydata,1-tdata(i)];
    else
        ydata=[ydata,0];
    end
end
A = optimvar('A',10);
r = optimvar('r',10);
fun=@(A,r) A(1)*exp(-r(1)*tdata)+A(2)*exp(-r(2)*tdata)+A(3)*exp(-r(3)*tdata)+A(4)*exp(-r(4)*tdata)+A(5)*exp(-r(5)*tdata)+A(6)*exp(-r(6)*tdata)+A(7)*exp(-r(7)*tdata)+A(8)*exp(-r(8)*tdata)+A(9)*exp(-r(9)*tdata)+A(10)*exp(-r(10)*tdata);
response = fcn2optimexpr(fun,A,r);
obj = sum((response - ydata).^2);
lsqproblem = optimproblem("Objective",obj);
x0.A = [.1,.2,.3,.4,.5,.6,.7,.8,.9,.1];
x0.r = [.1,.2,.3,.4,.5,.6,.7,.8,.9,.1];
show(lsqproblem)
[sol,fval] = solve(lsqproblem,x0)
responsedata = evaluate(response,sol);
plot(tdata,ydata,'r--',tdata,responsedata,'b-','LineWidth',1.5)
legend('Original Data','Fitted Curve')
xlabel 'x'
ylabel 'f(x)'
title("for n=5")
disp(sol.A)
disp(sol.r) 