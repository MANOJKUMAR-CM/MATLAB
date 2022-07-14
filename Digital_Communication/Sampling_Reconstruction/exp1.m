tr=0.001;
ts=0.02;
t=[0:tr:1];
N=ts/tr;
%x[t] signal
x=zeros(1,length(t));

x=cos(2*pi*t)+2.*sin(4*pi*t);
subplot(2,2,1);
plot(t,x,'r');
title('Message Signal');
xlabel('time');
ylabel('x[t]');

%Sampling 

n=[0:N:1];
g=zeros(1,length(t));
g(1:N:end)=1;
s=x.*g;
subplot(2,2,2);
stem(t,s,'b');
title('Sampled Signal');
xlabel('n');
ylabel('s[n]');

%Spectrum

%To get spectrum
Nfft=(length(t));
Nfft=2^(ceil(log2(Nfft)));
f=linspace(-1/(2.*tr),1/(2.*tr),Nfft);
%Dft of Message Signal
X=fft(x,Nfft);
X=fftshift(X);
%Dft of Sampled Signal
S=fft(s,Nfft);
S=fftshift(S);


subplot(2,2,3);
plot(f,abs(X));
title("spectrum of x(t)");
xlabel('f');
ylabel('|X(f)|');

subplot(2,2,4);
plot(f,abs(S));
title("spectrum of s(n)");
xlabel('f');
ylabel('|S(f)|');

%low pass filter
bw=10;
lp=zeros(1,Nfft);
lp(Nfft/2-bw:Nfft/2+bw)=1;

%reconstruction
R=N*lp.*S;
r=ifft(fftshift(R));
r=r(1:length(x));

figure(2);
subplot(1,2,1);
plot(t,x,'r');
title('Message Signal');
xlabel('time');
ylabel('x[t]');

subplot(1,2,2);
plot(t,r,'r');
title('Reconstructed Signal');
xlabel('time');
ylabel('r[t]');



