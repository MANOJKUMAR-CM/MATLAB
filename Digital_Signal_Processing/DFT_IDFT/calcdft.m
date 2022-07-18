function [Xk]=calcdft(x,N)
    L=length(x); %length of seq x(n)

    if(N<L)
        error("N must be greater than or equal to L");
    end
    if N>=L   %Error Message
        x1=[x zeros(1,(N-L))];
    end

    %construct the Matrix
    
    for k=0:N-1
        for n=0:N-1
            p=exp(-i*2*pi*k*n/N);   %fiddle factor
            T(k+1,n+1)=p;
        end
    end
    disp("Transformation matrix for dft");
    disp(T);
    Xk=T*x1';
end





        
