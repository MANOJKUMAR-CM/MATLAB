%chebyshev filter lowpass-->highpass

fpb=input("passBand freq:");
fsb=input("Stopband freq:");
pb=input("Enter the passband ripple:");
sa=input("Enter the stopband attenuation:");

opb=2*pi*fpb;
osb=2*pi*fsb;

%stopband freq
or=opb/osb;
disp("Stopband freq--normalized LPF")
disp(or)

%order of filter
eps=sqrt((10^(-pb/10))-1);
a=10^(-sa/20);
g=sqrt(((a^2)-1)/(eps^2));
N=log10(g+sqrt((g^2)-1))/(log10(or+sqrt((or^2)-1)));
N=ceil(N);
disp("order")
disp(N)

%to suppress warning on terminal
warning("off","all");

s=tf('s');
hsde=1;
%to find the poles

theta=(1/N)*asinh(1/eps);
a=sinh(theta);
b=cosh(theta);

for k=1:N
    sigma(k)=-a*sin(((2*k-1)*pi)/(2*N));
    omega(k)=b*cos(((2*k-1)*pi)/(2*N));

    sk(k)=sigma(k)+1i*omega(k);
    hsde=hsde+(s-sk(k));
end

disp('poles')
disp(sk)

den=real(poly(sk));
b0=den(N+1);
if(mod(N,2)==0)
    k0=(b0/sqrt(1+(eps^2)));
else
    k0=b0;
end

num=k0;
HaSN=tf(num,den)

[b,a]=lp2hp(num,den,opb);
hshighpass=tf(b,a)

