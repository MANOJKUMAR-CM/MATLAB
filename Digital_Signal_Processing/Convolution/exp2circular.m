x=input('Enter x[n]');
h=input('Enter h[n]');
l1=length(x);
l2=length(h);
N=max(l1,l2);
X=[x zeros(1,(N-l1))];
H=[h zeros(1,(N-l2))];

%using Inbuilt Function
Z=cconv(X,H,N);
disp(Z);

%using the formula
for n=1:N
    y(n)=0;
    for k=1:N
        y(n)=y(n)+X(k).*H(mod((n-k),N)+1);
    end
end

%plots
n=0:(N-1);

subplot(3,1,1);
stem(n,X);
xlabel('time');
ylabel('Amp');
title('X[n]');

subplot(3,1,2);
stem(n,H);
xlabel('time');
ylabel('Amp');
title('H[n]');

subplot(3,1,3);
stem(n,y);
xlabel('time');
ylabel('Amp');
title('Y[n] convolved sequence');

