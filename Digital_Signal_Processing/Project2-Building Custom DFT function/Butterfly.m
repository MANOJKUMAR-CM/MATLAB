function [Z]=Butterfly(x,y,n)
    N=8;
    theta=(2*pi/N)*n;
    Z(1)=x+(exp(-1j*theta))*y;
    Z(2)=x-(exp(-1j*theta))*y;
end