Ac=10;
Am=2;
fc=200;
fm=25;
ts=0.001;
t=[0:ts:0.5];
Ka=0.35;

%low pass filter
Nlp=50;
bw=150;

sgtitle('Manoj Kumar.CM ');
%Message Signal
m=zeros(1,length(t));
m=Am.*cos(2*pi*fm*t);
%plotting
subplot(2,2,1);
plot(t,m,'r');
title('Message Signal');
xlabel('t');
ylabel('m(t)');

%AM signal
s=zeros(1,length(t));
s=(1+Ka*m).*(Ac*cos(2*pi*fc*t));
%plotting
subplot(2,2,2);
plot(t,s,'b');
title('AM Signal');
xlabel('t');
ylabel('s(t)');

% To get Spectrum
Nfft=length(t);
Nfft=2^(ceil(log2(Nfft)));
f=((-Nfft/2*tr):(Nfft/2)-1)/(Nfft*ts);

%to plot spectrum of m(t)
M=fft(m,Nfft); %computes DFt
M=fftshift(M); %to show values symmetric about zero
subplot(2,2,3);
plot(f,abs(M));
title("spectrum of m(t)")
xlabel('f');
ylabel('|M(f)|');

%to plot spectrum of s(t)
S=fft(s,Nfft);%computes DFT
S=fftshift(S);%to show values symmetric about zero
subplot(2,2,4);
plot(f,abs(S));
title("spectrum of s(t)")
xlabel('f');
ylabel('|S(f)|');

%coherent demodulation
v=s.*cos(2*pi*fc*t);

%lowpass filter
h=fir1(Nlp,2*bw*ts);
m1=filter(h,1,v);
figure(2);
sgtitle('Manoj Kumar.CM');
subplot(2,2,1);
plot(t,m1);
title('Demodulated signal: Coherent Detection');
xlabel('t');
ylabel('m1(t)');

%spectrum of m1(t)
M1=fft(m1,Nfft); %computes DFt
M1=fftshift(M1); %to show values symmetric about zero
figure(2);
subplot(2,2,2);
plot(f,abs(M1));
title("spectrum of m1(t)")
xlabel('f');
ylabel('|M1(f)|');

%Envelope Detection
mh=hilbert(s);
m2=abs(mh);
figure(2);
subplot(2,2,3);
plot(t,[-1;1]*m2,'k');
title('Demodulated Signal:Envelope Detection')
xlabel('t');
ylabel('m2(t)');

%plotting spectrum of m2(t)
M2=fft(m2,Nfft);
M2=fftshift(M2);
figure(2);
subplot(2,2,4);
plot(f,abs(M2));
title("spectrum of m2(t)")
xlabel('f');
ylabel('|M2(f)|');

