x=input("Enter the input sequence x[n]");
nx=input("Enter the input indices");

[rxx,nrxx]=findconv(x,nx,flip(x),-flip(nx));

%property1
if(rxx==flip(rxx))
    disp("Symmetry property satisfied")
end

%property2
if(rxx(ceil(length(rxx)/2))==max(rxx))
    disp("Center value is maximum")
else
    disp("Center value is not maximum")
end

%plots
subplot(2,1,1);
stem(nx,x);
xlabel('n');
ylabel('x[n]');

subplot(2,1,2);
stem(nrxx,rxx);
xlabel('n');
ylabel('rxx[n]');