x=input("Enter the input sequence x[n]");
nx=input("Enter the input indices");

y=input("Enter the input sequence y[n]");
ny=input("Enter the input indices");

[rxy,nrxy]=findconv(x,nx,flip(y),-flip(ny));
disp("rxy")
disp(rxy)
disp(nrxy)

[ryx,nryx]=findconv(y,ny,flip(x),-flip(nx));
disp("ryx")
disp(ryx)
disp(nryx)

%property1
if(rxy==flip(ryx))
    disp("Rxy(l)==Ryx(-l)")
else
    disp("Not Satisfied")
end

%property2
if(rxy(ceil(length(rxy)/2)==0))
    disp("Sequence Orthogonal")
else
    disp("Sequence Not orthogonal")
end

%plots
subplot(2,2,1);
stem(nx,x);
xlabel('n');
ylabel('x[n]');

subplot(2,2,2);
stem(ny,y);
xlabel('n');
ylabel('y[n]');

subplot(2,2,3);
stem(nrxy,rxy);
xlabel('n');
ylabel('rxy[n]');

subplot(2,2,4);
stem(nryx,ryx);
xlabel('n');
ylabel('ryx[n]');
