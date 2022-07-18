%Butterworth lowpass-->Bandstop

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
num=log10(((10^(-pb/10))-1)/((10^(-sa/10))-1));
den=2*log10(1/or);
N=ceil(num/den);
disp("order")
disp(N)

%to suppress warning on terminal
warning("off","all");

s=tf('s');
hsde=1;

%to find poles
for k=0:N-1
    sk(k+1)=exp(1j*pi/2)*exp((1j*(2*k+1)*pi)/(2*N));
    hsde=hsde*(s-sk(k+1));
end

disp('poles')
disp(sk)

%transfer function
num=(1);
den=real(poly(sk));
HaSN=tf(num,den)

ocf=sqrt(ou*ol);
obw=ou-ol;
[b,a]=lp2bs(num,den,ocf,obw);
hsbandstop=tf(b,a)


