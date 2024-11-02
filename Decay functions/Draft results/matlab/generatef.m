%% generating f 
t=linspace(0,6,2000)';
n=length(t);
x=zeros(1,n)';
i=1;
while t(i)<=1
    x(i)=1-t(i);
    i=i+1; 
end
f=findf(t,x);
t1=linspace(0,6,1000)';
n1=length(t1);
x1=zeros(1,n1)';
i=1;
while t1(i)<=1
    x1(i)=1-t1(i);
    i=i+1; 
end
f1=findf(t1,x1);
%% plotting generated f
figure(1)
subplot(3,2,1)
plot(t1,f1,'c','LineWidth',3)
hold on
plot(t,f,'r')
legend('1000 points','2000 points')
axis([-.05,6,-400,300])
title('(a) Full view')
xlabel('time t')
ylabel('f(t)')

subplot(3,2,2)
plot(t1,f1,'c','LineWidth',3)
hold on
plot(t,f,'r')
%legend('1000 points','2000 points')
axis([-.005,0.1,-400,50])
title('(b) zoomed near t=0')
xlabel('time t')
ylabel('f(t)')

subplot(3,2,3)
plot(t1,f1,'c','LineWidth',3)
hold on
plot(t,f,'r')
axis([.98,1.02,0,300])
%legend('1000 points','2000 points')
title('(c) zoomed near t=1')
xlabel('time t')
ylabel('f(t)')

subplot(3,2,4)
plot(t1,f1,'c','LineWidth',3)
hold on
plot(t,f,'r')
axis([-.03,4,-3.2,1.5])
%legend('1000 points','2000 points')
title('(d) Nonsingular detail')
xlabel('time t')
ylabel('f(t)')

subplot(3,2,5)
plot(t1,f1,'c','LineWidth',3)
hold on
plot(t,f,'r')
axis([2,5,-.22,.08])
%legend('1000 points','2000 points')
title('(e) Nonsingular detail beyond t=2')
xlabel('time t')
ylabel('f(t)')

subplot(3,2,6)
plot(t1,f1,'c','LineWidth',3)
hold on
plot(t,f,'r')
axis([3,6,-.04,.012])
%legend('1000 points','2000 points')
title('(f) Nonsingular detail beyond t=3')
xlabel('time t')
ylabel('f(t)')
%% approximating f as polynomials
figure(2)
subplot(3,2,1)
n1=sum(t<0.995); n=3:n1;
t1=t(n); f1=f(n);
c1=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c1,t1),'--r')
xlabel('time ,t')
ylabel('f(t)')
legend('Actual','fitted poly')

subplot(3,2,2)
n1=sum(t<1.01); n2=sum(t<1.99); n=n1+1:n2;
t1=t(n); f1=f(n);
c2=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c2,t1),'--r')
xlabel('time, t')
ylabel('f(t)')



subplot(3,2,3)
n1=sum(t<2.01); n2=sum(t<2.99); n=n1+1:n2;
t1=t(n); f1=f(n);
c3=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c3,t1),'--r')
xlabel('time, t')
ylabel('f(t)')



subplot(3,2,4)
n1=sum(t<3.01); n2=sum(t<3.99); n=n1+1:n2;
t1=t(n); f1=f(n);
c4=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c4,t1),'--r')
xlabel('time, t')
ylabel('f(t)')



subplot(3,2,5)
n1=sum(t<4.01); n2=sum(t<4.99); n=n1+1:n2;
t1=t(n); f1=f(n);
c5=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c5,t1),'--r')
xlabel('time, t')
ylabel('f(t)')



subplot(3,2,6)
n1=sum(t<5.01); n=n1:2000;
t1=t(n); f1=f(n);
c6=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c6,t1),'--r')
xlabel('time, t')
ylabel('f(t)')
c=[c1;c2;c3;c4;c5;c6];
%% solutions for lambdas imported from maple
load 'roots of charac.mat'; % using the roots found in maple
Roots=fliplr(sortrows(cg3.','ComparisonMethod','real').');
%% 5 roots
%cg0=[-0.750302861811865 + 4.224166355844135i, -0.579698341965464 + 2.023245042666713i,-0.633584094639981 + 3.137134969533289i, -0.642009516167870 + 0.908376719874470i ,-0.781468413392564 + 0.000000000000000i];
root=Roots(1:5);
re=real(root);
im=imag(root);
sinpart=sin(im.*t);
cospart=cos(im.*t);
expopart=exp(re.*t);
roots=5;
A=buildA(sinpart,cospart,expopart,roots);
coef=inf_norm_sol(A,x);
%coef=A\x;
app=A*coef;
sinpart=expopart(:,1:roots).*sinpart(:,1:roots);
cospart=expopart(:,1:roots).*cospart(:,1:roots);
figure (3)
subplot(2,2,1)
plot(t,app,t,x);
axis([0,6,-.2,1.2]);
title('Hockey stick function, actual and approximation')
xlabel('t');
ylabel('x(t)');
legend('approximation','actual')

subplot(2,2,2)
plot(t,x-app);
title('approximation error')
xlabel('t');
ylabel('error');

subplot(2,2,3)
plot(re(1:roots),im(1:roots),'xb');
title('roots of the characteristic equation used')
xlabel('real part');
ylabel('imaginary part');

subplot(2,2,4)
plot(t,sinpart,t,cospart);
title('Decaying sin and cosine part')
xlabel('t');
ylabel('exponential functions');
%% 8 roots
root=Roots(1:8);
re=real(root);
im=imag(root);
sinpart=sin(im.*t);
cospart=cos(im.*t);
expopart=exp(re.*t);
roots=8;
A=buildA(sinpart,cospart,expopart,roots);
coef=inf_norm_sol(A,x);
%coef=A\x;
app=A*coef;
sinpart=expopart(:,1:roots).*sinpart(:,1:roots);
cospart=expopart(:,1:roots).*cospart(:,1:roots);
figure (4)
subplot(2,2,1)
plot(t,app,t,x);
axis([0,6,-.2,1.2]);
title('Hockey stick function, actual and approximation')
xlabel('t');
ylabel('x(t)');
legend('approximation','actual')


subplot(2,2,2)
plot(t,x-app);
title('approximation error')
xlabel('t');
ylabel('error');

subplot(2,2,3)
plot(re(1:roots),im(1:roots),'xb');
title('roots of the characteristic equation used')
xlabel('real part');
ylabel('imaginary part');

subplot(2,2,4)
plot(t,sinpart,t,cospart);
title('Decaying sin and cosine part')
xlabel('t');
ylabel('exponential functions');
%% 62 roots
root=Roots(1:62);
re=real(root);
im=imag(root);
sinpart=sin(im.*t);
cospart=cos(im.*t);
expopart=exp(re.*t);
roots=62;
A=buildA(sinpart,cospart,expopart,roots);
coef=inf_norm_sol(A,x);
%coef=A\x;
app=A*coef;
sinpart=expopart(:,1:roots).*sinpart(:,1:roots);
cospart=expopart(:,1:roots).*cospart(:,1:roots);
figure (5)
subplot(2,2,1)
plot(t,app,t,x);
axis([0,6,-.2,1.2]);
title('Hockey stick function, actual and approximation')
xlabel('t');
ylabel('x(t)');
legend('approximation','actual')


subplot(2,2,2)
plot(t,x-app);
title('approximation error')
xlabel('t');
ylabel('error');

subplot(2,2,3)
plot(re(1:roots),im(1:roots),'xb');
title('roots of the characteristic equation used')
xlabel('real part');
ylabel('imaginary part');

subplot(2,2,4)
plot(t,sinpart,t,cospart);
title('Decaying sin and cosine part')
xlabel('t');
ylabel('exponential functions');