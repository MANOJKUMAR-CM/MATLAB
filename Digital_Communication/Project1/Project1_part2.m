Rb=100;
Tb=1/Rb;
Tmax=3*Tb; %Tmax = 10*Tb / 3*Tb
tr=0.001;
t=(-Tmax:tr:Tmax);

%p[t] signal
p=zeros(1,length(t));
p=sinc(Rb*t).*sinc(Rb*t);

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