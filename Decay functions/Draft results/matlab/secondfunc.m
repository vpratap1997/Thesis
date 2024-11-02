%% different function
%% generating f 
t=linspace(0,6,2000)';
x=formfunction(t);
%plot(t,x);
f=findf(t,x);
t1=linspace(0,6,1000)';
x1=formfunction(t1);
f1=findf(t1,x1);
%% plotting generated f
figure(1)
subplot(3,2,1)
plot(t1,f1,'c','LineWidth',3)
hold on
plot(t,f,'r')
legend('1000 points','2000 points')
axis([-.05,7,-400,300])
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
axis([.98,1.02,-300,0])
%legend('1000 points','2000 points')
title('(c) zoomed near t=1')
xlabel('time t')
ylabel('f(t)')

subplot(3,2,4)
plot(t1,f1,'c','LineWidth',3)
hold on
plot(t,f,'r')
axis([-.03,6,-4,3])
%legend('1000 points','2000 points')
title('(d) Nonsingular detail')
xlabel('time t')
ylabel('f(t)')

subplot(3,2,5)
plot(t1,f1,'c','LineWidth',3)
hold on
plot(t,f,'r')
axis([2,5,-3,2])
%legend('1000 points','2000 points')
title('(e) Nonsingular detail beyond t=2')
xlabel('time t')
ylabel('f(t)')

subplot(3,2,6)
plot(t1,f1,'c','LineWidth',3)
hold on
plot(t,f,'r')
axis([3,6,-1,1])
%legend('1000 points','2000 points')
title('(f) Nonsingular detail beyond t=3')
xlabel('time t')
ylabel('f(t)')
%% approximating f as polynomials
figure(2)
subplot(3,4,1)
n1=sum(t<0.495); n=3:n1;
t1=t(n); f1=f(n);
c1=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c1,t1),'--r')
xlabel('time ,t')
ylabel('f(t)')
legend('Actual','fitted poly')

subplot(3,4,2)
n1=sum(t<.51); n2=sum(t<.99); n=n1+1:n2;
t1=t(n); f1=f(n);
c2=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c2,t1),'--r')
xlabel('time, t')
ylabel('f(t)')



subplot(3,4,3)
n1=sum(t<1.01); n2=sum(t<1.49); n=n1+1:n2;
t1=t(n); f1=f(n);
c3=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c3,t1),'--r')
xlabel('time, t')
ylabel('f(t)')



subplot(3,4,4)
n1=sum(t<1.51); n2=sum(t<1.99); n=n1+1:n2;
t1=t(n); f1=f(n);
c4=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c4,t1),'--r')
xlabel('time, t')
ylabel('f(t)')



subplot(3,4,5)
n1=sum(t<2.01); n2=sum(t<2.49); n=n1+1:n2;
t1=t(n); f1=f(n);
c5=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c5,t1),'--r')
xlabel('time, t')
ylabel('f(t)')



subplot(3,4,6)
n1=sum(t<2.51); n2=sum(t<2.99); n=n1+1:n2;
t1=t(n); f1=f(n);
c6=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c6,t1),'--r')
xlabel('time, t')
ylabel('f(t)')

subplot(3,4,7)
n1=sum(t<3.01); n2=sum(t<3.49); n=n1+1:n2;
t1=t(n); f1=f(n);
c7=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c7,t1),'--r')
xlabel('time ,t')
ylabel('f(t)')

subplot(3,4,8)
n1=sum(t<3.51); n2=sum(t<3.99); n=n1+1:n2;
t1=t(n); f1=f(n);
c8=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c8,t1),'--r')
xlabel('time, t')
ylabel('f(t)')



subplot(3,4,9)
n1=sum(t<4.01); n2=sum(t<4.49); n=n1+1:n2;
t1=t(n); f1=f(n);
c9=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c9,t1),'--r')
xlabel('time, t')
ylabel('f(t)')



subplot(3,4,10)
n1=sum(t<4.51); n2=sum(t<4.99); n=n1+1:n2;
t1=t(n); f1=f(n);
c10=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c10,t1),'--r')
xlabel('time, t')
ylabel('f(t)')



subplot(3,4,11)
n1=sum(t<5.01); n2=sum(t<5.49); n=n1+1:n2;
t1=t(n); f1=f(n);
c11=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c11,t1),'--r')
xlabel('time, t')
ylabel('f(t)')

subplot(3,4,12)
n1=sum(t<5.51); n=n1:2000;
t1=t(n); f1=f(n);
c12=polyfit(t1,f1,5);
plot(t1,f1,'c.',t1,polyval(c12,t1),'--r')
xlabel('time, t')
ylabel('f(t)')
c=[c1;c2;c3;c4;c5;c6;c7;c8;c9;c10;c11;c12];
%% solutions for lambdas imported from maple
%cg = [(-0.158859470832459637e1+0.450428132978017004e2*i) (-0.178587099396581372e1+0.669786843839296466e2*i) (-0.167481169643971173e1+0.502393758740438159e2*i) (-0.171805938322608709e1+0.513223128439901330e2*i) (-0.167888988134314698e1+0.523886944109328070e2*i) (-0.164408295231442581e1+0.492231875568869413e2*i) (-0.169702029208750038e1+0.471053563809362927e2*i) (-0.166646009198188594e1+0.482060279488578942e2*i) (-0.161399284547087474e1+0.440502471231389023e2*i) (-0.162240218629094701e1+0.460421131973929079e2*i) (-0.158375458634594368e1+0.398263110246725347e2*i) (-0.154105544754557400e1+0.366586912108640917e2*i) (-0.156356665087563296e1+0.356461534535459137e2*i) (-0.157691317237699935e1+0.376708813620252059e2*i) (-0.162820330250535061e1+0.387595424445193686e2*i) (-0.157567717121088746e1+0.408290987845299753e2*i) (-0.170833726376871775e1+0.429850001573276188e2*i) (-0.163052119002103257e1+0.418345834377132633e2*i) (-0.172287591319558486e1+0.617885095341481403e2*i) (-0.167701098228251499e1+0.576068279823817164e2*i) (-0.174461179972983516e1+0.607682154407342239e2*i) (-0.177196664397607817e1+0.596740150863996064e2*i) (-0.170718564329678069e1+0.586105406400430908e2*i) (-0.166937706000644326e1+0.533963679082340406e2*i) (-0.171742993981709802e1+0.544076473386993840e2*i) (-0.170278223013822205e1+0.566083207297586881e2*i) (-0.178220951233228830e1+0.555374340263863076e2*i) (-0.175280338537798563e1+0.649523083562289116e2*i) (-0.174263377522529517e1+0.659634997748296712e2*i) (-0.178816907608909559e1+0.638866128596196674e2*i) (-0.175024343500734636e1+0.628075227027139533e2*i) (-0.177290604106338301e1+0.691686726044822535e2*i) (-0.184187634731602046e1+0.680958847057238188e2*i) (-0.122530844655477988e1+0.156914013977663771e2*i) (-0.144514428639015868e1+0.282616044401126913e2*i) (-0.150189050946507008e1+0.262006396601207427e2*i) (-0.144971092268206236e1+0.272663650146271159e2*i) (-0.160911090928054357e1+0.304481906389572892e2*i) (-0.151056647940382449e1+0.292571363074234512e2*i) (-0.146966379862902352e1+0.324805798467562639e2*i) (-0.150914998521345911e1+0.334736849366978504e2*i) (-0.159888820908437501e1+0.345357874310797115e2*i) (-0.149321065081032489e1+0.314965283570098435e2*i) (-0.145495930853399980e1+0.219650792594229216e2*i) (-0.139140820367551710e1+0.240964339797298059e2*i) (-0.143659166219929468e1+0.251022296977826116e2*i) (-0.141174998864332313e1+0.230916907549718147e2*i) (-0.128767326381113834e1+0.199244805591565566e2*i) (-0.133799597258883729e1+0.209071797694271027e2*i) (-0.143659326295762724e1+0.179659206462642373e2*i) (-0.130460234367240790e1+0.189558552534588145e2*i) (-0.721634735604355759e0+0.550392948605729870e1*i) -0.677739830224393103e0 (-0.666994800971303592e0+0.271865708027273101e1*i) (-0.671757889511889861e0+0.364179637906440590e1*i) (-0.670510017582604645e0+0.180465885183392882e1*i) (-0.674623341463378656e0+0.897710945150358652e0*i) (-0.770213944714981058e0+0.645044421691836689e1*i) (-0.836285715779540029e0+0.739309347996301813e1*i) (-0.114403151912513956e1+0.939245972888675951e1*i) (-0.946572246308498233e0+0.835364208854734969e1*i) (-0.110458406230873707e1+0.115405480853077300e2*i) (-0.110351750233609525e1+0.105504789642719423e2*i) (-0.117769278044460801e1+0.125337987780915405e2*i) (-0.131119514417943916e1+0.166634018587092925e2*i) (-0.121735814764963468e1+0.147105091268429469e2*i) (-0.127744850533501575e1+0.136531500818183780e2*i)];
load 'roots'; % using the roots found in maple
load 'roots of charac'
load 'simpleroots'
load 'incr'
Roots3=fliplr(sortrows(incr.','ComparisonMethod','real').');%increase decrease roots
Roots2=fliplr(sortrows(cg.','ComparisonMethod','real').');%constant decrease roots
Roots1=fliplr(sortrows(cg3.','ComparisonMethod','real').');% HS basis
Roots0=fliplr(sortrows(no.','ComparisonMethod','real').'); % simple basis
%% n roots
roots=67;
n1=sum(t<6);
fit=1:n1;
root=Roots1(1:roots);
re=real(root);
im=imag(root);
sinpart=sin(im.*t);
cospart=cos(im.*t);
expopart=exp(re.*t);
A=buildA(sinpart,cospart,expopart,roots);
% root1=oldRoots(1:roots);
% re1=real(root1);
% im1=imag(root1);
% sinpart=sin(im1.*t);
% cospart=cos(im1.*t);
% expopart=exp(re1.*t);
% A1=buildA(sinpart,cospart,expopart,roots);
coef=inf_norm_sol(A(fit,:),x(fit,1));
% coef1=inf_norm_sol(A1(fit,:),x(fit,1));
%coef1=A1\x;
%coef=A\x;
app=A*coef;
% oldapp=A1*coef1;
sinpart=expopart(:,1:roots).*sinpart(:,1:roots);
cospart=expopart(:,1:roots).*cospart(:,1:roots);
figure (3)
subplot(2,2,1)
plot(t,x,'-k',t,app,'-b');
axis([0,19,-.2,1.2]);
title('function, actual and approximations')
legend('original','HS basis')

subplot(2,2,2)
plot(t,x-app,'-b');
title('approximation error')
%legend('new basis','old basis')

subplot(2,2,3)
plot(re(1:roots),im(1:roots),'xb');
title('roots of the characteristic equation used')
%legend('Function specific roots','old roots')

subplot(2,2,4)
plot(t,x,'-k',t,app,'-b');
axis([5,20,-.1,.1]);
title('Transition zoomed in')
%% plot different functions
% figure(4)
% subplot(1,3,1)
% plot(t,function3)
% title('function 1')
% xlabel('t')
% ylabel('f1(t)')
% 
% subplot(1,3,2)
% plot(t,function2)
% title('function 2')
% xlabel('t')
% ylabel('f2(t)')
% 
% subplot(1,3,3)
% plot(t,function1)
% title('function 3')
% xlabel('t')
% ylabel('f3(t)')
