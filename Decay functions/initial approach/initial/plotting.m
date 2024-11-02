clc 
clear all
tdata=linspace(0,7,100);
ydata=[];
for i=1:100
    if tdata(i)<1
        ydata=[ydata,1-tdata(i)];
    else
        ydata=[ydata,0];
    end
end
plot(tdata,ydata,'r*')
xlabel 't'
ylabel 'Response'
A = optimvar('A',2);
r = optimvar('r',2);
fun = A(1)*exp(-r(1)*tdata) + A(2)*exp(-r(2)*tdata);
obj = sum((fun - ydata).^2);
lsqproblem = optimproblem("Objective",obj);
x0.A = [1,1];
x0.r = [1,1];
[sol,fval] = solve(lsqproblem,x0);
figure
responsedata = evaluate(fun,sol);
plot(tdata,ydata,'r*',tdata,responsedata,'b-')
legend('Original Data','Fitted Curve')
xlabel 't'
ylabel 'Response'
title("Fitted Response")
disp(sol.A)
disp(sol.r)