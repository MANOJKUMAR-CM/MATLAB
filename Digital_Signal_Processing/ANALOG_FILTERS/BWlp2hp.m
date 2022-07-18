%ButterWorth lowpass ---> highpass

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

%cutoff frequency
ocn=1/(((10^(-pb/10))-1)^(1/(2*N)));
ocp=(opb/ocn);
[b,a]=lp2hp(num,den,ocp);
hslowpass=tf(b,a)


