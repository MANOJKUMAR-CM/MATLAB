Xk=input("Enter the DFT seq");
x=calcidft(Xk);
N=length(x);
disp("The Sequence x[n]:");
disp(x);

%plots
n=0:N-1;
stem(n,x);
xlabel('time');
ylabel('Amp');
title('i/p sequence');

