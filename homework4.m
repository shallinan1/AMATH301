clc; clear all; close all

%Problem 1
    
V(1:100) = 2;
A(1:99)=-1;

a100 = diag(V,0) + diag(A,1) + diag(A,-1);

p = zeros(100,1);
for j=1:100
    p(j) = 2 * (1-cos((56*pi)/(101))) * sin((56*pi*j)/(101));
end

%Part A1
% x_k = -P^(-1)Tx_(k-1) + P^(-1)b

P=diag(diag(a100));
T=a100-P;
M=-P\T;
maxval = max(abs(eig(M)));
save("A1.dat", "maxval", "-ascii");

%Part A2
%n the homework you are solving A*phi = rho (Ax=b)

tolerance = 10^(-4);
subtract=0;
error=1;
guess = zeros(100,1);
guess(1:100) = 1;
k=0;

while error > tolerance
k=k+1;
temp = (-P\((T * guess) + p ));
subtract= abs(guess - temp);
guess = temp;
error = norm(subtract,Inf);
end
    

save("A2.dat", "k","-ascii");

truesol = -a100\p;
lengtherror = norm(abs(truesol-guess),Inf);
save("A3.dat", "lengtherror", "-ascii");

%Part A4
P = diag(V,0) + diag(A,-1);
T= a100 - P;
M= -P\T;
maxvalue = max(abs(eig(M)));

save("A4.dat", "maxvalue", "-ascii");

tolerance = 10^(-4);
subtract=0;
error=1;
guess = zeros(100,1);
guess(1:100) = 1;
k=0;

while error > tolerance

temp = (-P\((T * guess) + p ));
subtract= abs(guess - temp);
guess = temp;
error = norm(subtract,Inf);
k=k+1;
end
k=k+1;
save("A5.dat", "k", "-ascii");

truesol = -a100\p;
lengtherror = norm(abs(truesol-guess),Inf);
save("A6.dat", "lengtherror", "-ascii");

%Problem 2 A7
D = diag(V,0);
U = diag(A,1);
L = diag(A,-1);
w=1.5;
P= 1/w*D + L;
T = ((w-1)/w)*D + U;
M = -P\T;
maxvalue = max(abs(eig(M)));

save("A7.dat", "maxvalue", "-ascii");

currentmax= 100;
wloc = 0;
for w = 1:0.01:1.99
P= 1/w*D + L;
T = ((w-1)/w)*D + U;
M = -P\T;
if max(abs(eig(M))) < currentmax
    currentmax = max(abs(eig(M)));
    wloc = w;
end
end
w =wloc;
save("A8.dat", "wloc", "-ascii");

%Part A9

tolerance = 10^(-4);
subtract=0;
error=1;
guess = zeros(100,1);
guess(1:100) = 1;
k=1;
P= (((1/w)*D)+L);
T = ((((w-1)/w)*D)+U);

while error > tolerance

temp = (-P\((T * guess) + p ));
subtract= abs(guess - temp);
guess = temp;
error = norm(subtract,Inf);
k=k+1;
end
k=k+2;
save("A9.dat", "k", "-ascii");


truesol = -a100\p;
lengtherror = norm(abs(truesol-guess),Inf);
save("A10.dat", "lengtherror", "-ascii");
