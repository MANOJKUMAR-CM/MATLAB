f1=input('Enter the 1st freq');
f2=input('Enter the send freq');
fm=max(f1,f2);
fnyq=2*fm;
%over sampling
fs=8*fnyq;
ts=1/fs;
tc=0:1e-6:(40*ts); %analog time axis
xc=cos(2*pi*f1*tc)+cos(2*pi*f2*tc); %analog signal
td=0:ts:(40*ts); % discrete time axis
xd=cos(2*pi*f1*td)+cos(2*pi*f2*td); %discrete signal
%reconstruction
N=length(td);
%n=0:N-1;
xr=zeros(size(tc));
sinc_train=zeros(N,length(tc));
for n=0:N-1
 sinc_train(n+1,:)=sinc((tc-n*ts)/ts);
 current_sinc=xd(n+1)*sinc_train(n+1,:);
 xr=xr+current_sinc;
end
%plotting
figure(1);
hold on; %plots both graphs in same figure
grid on; %gets grids as background
plot(tc,xc,'b','LineWidth',2);
stem(td,xd,'k','LineWidth',2);
plot(tc,xr,'r--','LineWidth',2);
legend('continous time siganl',' sampled signal','reconstructed signal');
xlabel('time');
ylabel('Amplitude');
title('OverSampling');
