%Generating random BPSK Symbols.
sp=randi([-1 ,1],10000000,1);
sp(~sp)=-1;

%Generating random BFSK Symbols.
sf=randi([0 1],10000000,1);
sf(~sf)=1i;

Eb=1;
%Eb/No range in dB
EN=(-4:2:10);
n=length(EN);

% BPSK
bit_error_p=zeros(1,n);
bit_error_p=bit_error_p';

Pe_p=zeros(1,n);
Pe_p=Pe_p';

%BFSK
bit_error_f=zeros(1,n);
bit_error_f=bit_error_f';

Pe_f=zeros(1,n);
Pe_f=Pe_f';


for k=1:n
    N0=10^(-EN(k)/10);
    N_var=N0/2;

    %gaussian White Noise.__BPSK
    W_p=sqrt(N_var).*randn(1,10000000);
    W_p=W_p';
    xp=sp+W_p; %x(n)=s(n)+W(n)

    %gaussian White Noise.__BFSK
    %real part

    Wr=sqrt(N_var).*randn(1,10000000);
    Wr=Wr';

    %imaginary part

    Wi=sqrt(N_var).*randn(1,10000000);
    Wi=Wi';

    %Noise
    W=Wr+(Wi*1i);

    xf=sf+W; %x(n)=s(n)+W(n)

    %Recovering the input and calculating error
    %BPSK
    s_new_p=zeros(1,10000000);
    s_new_p=s_new_p';
    error_p=0;
    %BFSK
    s_new_f=zeros(1,10000000);
    s_new_f=s_new_f';
    error_f=0;
    for a=1:10000000
        %BPSK
        if(xp(a)>0)
            s_new_p(a)=1;
        else
            s_new_p(a)=-1;
        end
        if(sp(a)~=s_new_p(a))
            error_p=error_p+1;
        end
        %BFSK
        if(real(xf(a))>imag(xf(a)))
            s_new_f(a)=1;
        else
            s_new_f(a)=1i;
        end
        if(sf(a)~=s_new_f(a))
            error_f=error_f+1;
        end
    end
    %BPSK
    error_rate_p=error_p/10000000;
    bit_error_p(k)=error_rate_p;

    in=sqrt(Eb/N0);
    e=0.5*erfc(in);
    Pe_p(k)=e;
 
    %BFSk
    error_rate_f=error_f/10000000;
    bit_error_f(k)=error_rate_f;

    in=sqrt(Eb/(2*N0));
    e=0.5*erfc(in);
    Pe_f(k)=e;

end

%plotting
subplot(1,2,1);
semilogy(EN,bit_error_p,EN,bit_error_f);
ylabel("BER");
xlabel("Eb/N0");

subplot(1,2,2);
semilogy(EN,Pe_p,EN,Pe_f);
ylabel("Theoretical BER");
xlabel("Eb/N0");



