x=input("Enter the sequence x[n]");
N=input("Enter the Number of points of DFT");

Xk=dft(x,N);

disp('DFT X(k)=');
disp(Xk)

%magnitude of DFT
magxk=abs(Xk);

%phase of DFT
phasexk=angle(Xk);

%plots
k=0:N-1;

subplot(2,1,1);
stem(k,magxk);
xlabel('k');
ylabel('|X[k]|');
title('Magnitude Spectrum');

subplot(2,1,2);
stem(k,phasexk);
xlabel('k');
ylabel('<X[k]');
title('Phase Spectrum');
