function A=buildA(sinpart,cospart,expopart,roots)
sinpart=expopart(:,1:roots).*sinpart(:,1:roots);
cospart=expopart(:,1:roots).*cospart(:,1:roots);
A=[];
for i=1:roots
    A=[A,sinpart(:,i),cospart(:,i)];
end
end