Type= 'Bipolar NRZ';
Rb = 100; % bit rate
Tr= 0.001;
Tb = 1/ Rb;% Bit duration
Ttotal = 1000;
NcX = 100;
NcA= 10;
Nfft = 512;
 
t=[0:Tr:Ttotal];
t=t(1:end-1);
Ns = length(t);
 
Nf = Tb/Tr; 
Nb = Ttotal*Rb;
A= double(randn(1,Nb) > 0); 
SxA = [-200 200 0 60];

switch Type

case 'Unipolar RZ'
ps = [ones(l,Nf/2) zeros(l,Nf/2)];
SxA = [-250 250 0 20];
 
case 'Unipolar NRZ'
ps = ones(l,Nf); 
SxA = [-200 200 0 60];
 
case 'Polar RZ' 
A=2*A-1;
ps = [ones(l,Nf/2) zeros(l,Nf/2)] ;
SxA = [-250 250 0 10];
 
case 'Polar NRZ' 
A=2*A-1;
ps = ones(l,Nf); 
SxA = [-200 200 0 20];
 
case 'Bipolar NRZ' 
Ai = find(A);
Ai = downsample(Ai,2,1); 
A(Ai) = -1;
ps = ones(1,Nf);
SxA = [-200 200 0 10];

 
 
otherwise
 A=2*A-1;
 ps = [ones(l,Nf/2) -ones(l,Nf/2)];
 SxA = [-250 250 0 10];
end
X = kron(A,ps);
 
%Graphs

% Plot of X(t) 

subplot(2,2,1) 
plot(t(1:250),X(1:250))
grid on
axis([0 0.25 -2 21]);
title('X(t)')
 
% Plot of RA(n)
 
rAt = xcorr(A,NcA)./Nb; 
subplot(2,2,2)
stem([-NcA:NcA],rAt); 
grid on;
title('RA(n)')
 
% Plot of Rx(tau)
 
rxt = xcorr(X,NcX)./Ns; 
subplot(2,2,3)
plot([-NcX*Tr:Tr:NcX*Tr],rxt);
grid on; 
title('R_X(\tau)')
 
% Plot of Sx(f)
 
f = ((-Nfft/2):(Nfft/2)-1)/(Nfft*Tr);
Sxf = abs(fftshift(fft(rxt,Nfft)));
subplot(2,2,4)
plot(f,Sxf) 
grid on;
axis(SxA)
 
title('Sx(f)')
 
