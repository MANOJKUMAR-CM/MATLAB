function [y]=calcconv(x,h)
    l1=length(x);
    l2=length(h);
    N=l1+l2-1;
    for n=1:N
        y(n)=0
        for k=1:l1
            if(n-k+1>=1 && n-k+1<=l2)
                y(n)=y(n)+x(k).*h(n-k+1)
            end
        end
    end
end
