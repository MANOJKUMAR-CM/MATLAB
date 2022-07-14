Rb=100;
Tb=1/Rb;
Tmax=3*Tb; %Tmax = 10*Tb / 3*Tb
alpha=0; %alpha =0.5 / 0 / 1
tr=0.001;
t=(-Tmax:tr:Tmax);

%p[t] signal
p=zeros(1,length(t));
num=sinc(Rb*t).*cos(pi*alpha*Rb*t);
den=1-(4*(alpha^2)*(Rb^2)*(t.^2));
p=num./den;

%plotting
subplot(2,1,1);
plot(t,p,'r');
title('Message Signal');
xlabel('time');
ylabel('p[t]');

% To get Spectrum
Nfft=length(t);
Nfft=2^(ceil(log2(Nfft)));
f=((-Nfft/2):(Nfft/2)-1)/(Nfft*tr);

%plot spectrum of m(t)
P=fft(p,Nfft); %computes DFt
P=fftshift(P); %to show values symmetric about zero
subplot(2,1,2);
plot(f,abs(P));
title("spectrum of p(t)")
xlabel('f');
ylabel('|P(f)|');

