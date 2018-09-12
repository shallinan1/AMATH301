clc; clear all; close all;

%Problem 1
A = [ 65 -15 -20; -15 39 -18; -20 -18 63];
[L,U,P] = lu(A);

ans1 = U*P*L;
save("A1.dat", "ans1", "-ascii");

matrix1 = zeros(1,100);
[L,U,P] = lu(A);
for k= 1:100
   b= [50; k; 75];
   y=L\(P*b);
   x=U\y;
   matrix1(k) = x(2);
end
save("A2.dat", "matrix1", "-ascii");

matrix2 = zeros(1,100);
for k= 1:100
   b= [50; k; 75];
   I= inv(A) * b;  
   
   matrix2(k) = I(1);
end
save("A3.dat", "matrix2", "-ascii");
%Problem 2
s= sqrt(2)/2;
m=4;
b=[0; 0; 0; 0; 0; 0; 0; 0;m;0;10;0;5];
A=[-s 1 0 0 0 0 0 0 0 s 0 0 0; -s 0 0 0 0 0 0 0 -1 -s 0 0 0;0 -1 1 0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 -1 0 0;0 0 -1 s 0 0 0 0 0 0 0 -s 0; 0 0 0 -s 0 0 0 0 0 0 0 -s -1;0 0 0 -s -1 0 0 0 0 0 0 0 0;0 0 0 0 1 -1 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 1; 0 0 0 0 0 1 -1 0 0 -s 0 s 0; 0 0 0 0 0 0 0 0 0 s 1 s 0; 0 0 0 0 0 0 1 -1 0 0 0 0 0; 0 0 0 0 0 0 0 0 1 0 0 0 0];
[L,U,P] = lu(A);

y = L\(P*b);
x = U\y;  
save("A4.dat", "y", "-ascii");
save("A5.dat", "x", "-ascii");

x= A\b;
save("A6.dat", "x", "-ascii");

m=4;
while max(abs(x)) < 30
m=m+0.01;
b(9) = m;
x=A\b;
b8val=b(9,1);
end


save("A7.dat", "b8val", "-ascii");
%Problem 3

A = [ 10^-20 1 ; 1 1];
ans8 = cond(A);
save("A8.dat", "ans8", "-ascii");


L = [1 0; 10^20 1];
U = [10^-20 1; 0 (1-10^20)];

ans9 = L*U;

save("A9.dat" ,"ans9", "-ascii");

L= [ 1 0; 10^-20 1];
U = [1 1; 0 (1-10^-20)];

ans10 = L*U;

save("A10.dat", "ans10", "-ascii");

