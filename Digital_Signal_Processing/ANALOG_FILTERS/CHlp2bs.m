%chebyshev filter lowpass--->bandstop

f1=input("Enter stopband freq F1:");
f2=input("Enter stopband freq F2:");
fl=input("Enter lower cutoff freq:");
fu=input("Enter upper cutoff freq:");
pb=input("Enter the passband ripple:");
sa=input("Enter the stopband attenuation:");

o1=2*pi*f1;
o2=2*pi*f2;
ol=2*pi*fl;
ou=2*pi*fu;

A=((o1*(ou-ol))/((-(o1^2))+(ol*ou)));
B=((o2*(ou-ol))/((-(o2^2))+(ol*ou)));

%stopband freq
or=min(abs(A),abs(B));
disp("stopband freq --normalized LPF")
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

ocf=sqrt(ou*ol);
obw=ou-ol;
[b,a]=lp2bs(num,den,ocf,obw);
hsbandstop=tf(b,a)
