function [Xk]=dft(x,N)
    L=length(x); %length of seq x(n)

    if(N<L)
        error("N must be greater than or equal to L");
    end
    if N>=L   %Error Message
        x1=[x zeros(1,(N-L))];
    end

    xtop=[x1(1) x1(5) x1(3) x1(7)];
    xbottom=[x1(2) x1(6) x1(4) x1(8)];

 %Butterfly stage 1 calculations
    X1=zeros(1,length(xtop));
    X2=zeros(1,length(xbottom));

    for k=1:2
        for n=1:2
            if(mod(n,2)~=0)
                A=Butterfly(xtop(n),xtop(n+1),0);
                B=Butterfly(xbottom(n),xbottom(n+1),0);
                X1(n)=A(n);
                X1(n+1)=A(n+1);
                X2(n)=B(n);
                X2(n+1)=B(n+1);
            else
                A=Butterfly(xtop(n+1),xtop(n+2),0);
                B=Butterfly(xbottom(n+1),xbottom(n+2),0);
                X1(n+1)=A(n-1);
                X1(n+2)=A(n);
                X2(n+1)=B(n-1);
                X2(n+2)=B(n);
            end
        end
    end

%ButterrFly Stage2 calculations
 X11=zeros(1,length(xtop));
 X22=zeros(1,length(xbottom));
 
 for k=1:2
     for n=1:2
         if(mod(n,2)~=0)
             A=Butterfly(X1(n),X1(n+2),0);
             B=Butterfly(X2(n),X2(n+2),0);
             X11(n)=A(n);
             X11(n+2)=A(n+1);
             X22(n)=B(n);
             X22(n+2)=B(n+1);
         else
             A=Butterfly(X1(n),X1(n+2),2);
             B=Butterfly(X2(n),X2(n+2),2);
             X11(n)=A(n-1);
             X11(n+2)=A(n);
             X22(n)=B(n-1);
             X22(n+2)=B(n);
         end
     end
 end

 %ButterrFly Stage3 calculations
 Xk=zeros(1,8);
 for n=1:4
     A=Butterfly(X11(n),X22(n),n-1);
     Xk(n)=A(1);
     Xk(n+4)=A(2);
 end
end





