function [x]=calcidft(Xk)
    N=length(Xk);
    for k=0:N-1
        for n=0:N-1
             p=exp(i*2*pi*k*n/N);   %fiddle factor
             IT(k+1,n+1)=p;
        end
    end
    disp('Transformation Matrix is');
    disp(IT);
    x=(IT*(Xk).')./N;
end


