f1=input('Enter the 1st Freq:');
f2=input('Enter the 2nd Freq:');
fm=max(f1,f2);
fnyq=2*fm;
%Under sampling
fs=fnyq/2;
ts=1/fs;
tc=0:1e-6:40*ts;
xc=cos(2*pi*f1*tc)+cos(2*pi*f2*tc);
td=0:ts:40*ts;
xd=cos(2*pi*f1*td)+cos(2*pi*f2*td);
%reconstruction of the signal
N=length(td);
xr=zeros(size(tc));
sinc_train=zeros(N,length(tc));
for n=0:N-1
 sinc_train(n+1,:)=sinc((tc-n*ts)/ts);
 current_sinc=xd(n+1)*sinc_train(n+1,:);
 xr=xr+current_sinc;
end
%plotting
figure(1);
hold on;
grid on;
plot(tc,xc,'m','LineWidth',2);
stem(td,xd,'b','LineWidth',2);
plot(tc,xr,'r--','LineWidth',2);
legend('continous time siganl',' sampled signal','reconstructed signal');
xlabel('time');
ylabel('Amplitude');
title('UnderSampling');
