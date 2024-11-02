function x=formfunction(t,p)
%% increase decrese
%     n=length(t);
%     x=zeros(1,n)';
%     i=1;
%     while t(i)<1
%         x(i)= 1-t(i);
%         i=i+1;
%     end
%     while t(i)<1.5
%         x(i)= t(i)-1;
%         i=i+1;
%     end
%     while t(i)<2
%         x(i)= 2-t(i);
%         i=i+1;
%     end
if p==2
    %% second function
    n=length(t);
    x=zeros(1,n)';
    i=1;
    while t(i)<=.5
        x(i)=1-t(i);
        i=i+1; 
    end
    while t(i)<=1
        x(i)=.5;
        i=i+1; 
    end
    while t(i)<=1.5
        x(i)=1.5-t(i);
        i=i+1; 
    end
elseif p==1
%% HS function
    n=length(t);
    x=zeros(1,n)';
    i=1;
    while t(i)<=1
        x(i)=1-t(i);
        i=i+1; 
    end
elseif p==3
 %% arbitrary
    n=length(t);
    x=zeros(1,n)';
    i=1;
    while t(i)<.5
        x(i)= 1-t(i);
        i=i+1;
    end
    while t(i)<1.5
        x(i)= .75-.5*t(i);
        i=i+1;
    end
end
end