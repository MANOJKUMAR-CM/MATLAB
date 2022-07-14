Ac=10;                      %carrier amplitude
fc=200;                     %carrier frequency
ts=0.001;                   %sampling time

%low pass filter
Nlp=50;
bw=150;

%Message Signal
t=[-0.05:ts:0.25];
m=zeros(1,length(t));

%to update matrices based on condition
m(t>=0 & t<0.1)=10*t(t>=0 & t<0.1);
m(t>=0.1 & t<=0.2)=10*(0.2-t(t>=0.1 & t<=0.2));
sgtitle('Name:Manoj Kumar.CM');
%plotting message
subplot(3,2,1);
plot(t,m,'r');
title('Message Signal');
xlabel('t');
ylabel('m(t)');


%DSBSC Signal
s=m.*(Ac*cos(2*pi*fc*t));
subplot(3,2,2)
plot(t,s,'b');
title("DSBSC signal");
xlabel('t');
ylabel('s(t)');

% To get Spectrum
Nfft=length(t);
Nfft=2^(ceil(log2(Nfft)));
f=((-Nfft/2):(Nfft/2)-1)/(Nfft*ts);

%plot spectrum of m(t)
M=fft(m,Nfft); %computes DFt
M=fftshift(M); %to show values symmetric about zero
subplot(3,2,3);
plot(f,abs(M));
title("spectrum of m(t)")
xlabel('f');
ylabel('|M(f)|');


%Plot of spectrum of s(t)
S=fft(s,Nfft);
S=fftshift(S);
subplot(3,2,4);
plot(f,abs(S));
title("spectrum of s(t)")
xlabel('f');
ylabel('|S(f)|');
%Demodulation
v=s.*cos(2*pi*fc*t);

%lowpass filter
h=fir1(Nlp,2*bw*ts);
m1=filter(h,1,v);
subplot(3,2,[5,6]);
plot(t,m1);
title("Demodulated Signal")
xlabel('t');
ylabel('m1(t)');