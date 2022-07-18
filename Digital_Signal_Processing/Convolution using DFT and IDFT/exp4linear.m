%linear convolution using DFT and IDFT

x=input('Enter the seq x[n]');
h=input('Enter the seq h[n]');
l1=length(x);
l2=length(h);

N=l1+l2-1; %length of linearly convolved output

%calculate N point DFT seq
X=fft(x,N);
H=fft(h,N);

Y=X.*H;
y=round(ifft(Y))

%plots
n1=0:l1-1;
subplot(2,2,1);
stem(n1,x);
xlabel('n');
ylabel('x[n]');
title("i/p signal");

n2=0:l2-1;
subplot(2,2,2);
stem(n2,h);
xlabel('n');
ylabel('h[n]');
title("impulse signal");

n3=0:length(y)-1;
subplot(2,2,[3,4]);
stem(n3,y);
xlabel('n');
ylabel('y[n]');
title("output signal");
