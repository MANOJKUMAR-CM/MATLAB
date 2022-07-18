x=input('Enter x[n]:');
nx=input('Enter x[n] time indices :');
h=input('Enter h[n]:');
nh=input("Enter h[n] time indices:");

[y,ny]=findconv(x,nx,h,nh); %findconv function present in findconv.m

subplot(3,1,1);
stem(nx,x);
xlabel('time');
ylabel('Amp');
title('X[n]');

subplot(3,1,2);
stem(nh,h);
xlabel('time');
ylabel('Amp');
title('H[n]');

subplot(3,1,3);
stem(ny,y);
xlabel('time');
ylabel('Amp');
title('Y[n]');

disp(y);
disp(ny);

