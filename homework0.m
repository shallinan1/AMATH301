clear all; close all; clc;

%Problem 1
x = 10;
y = -2;
z = pi;

save('A1.dat', 'z', '-ascii')

ans2 = x+y-z;

save('A2.dat', 'ans2', '-ascii')

ans3 = x^3;

save('A3.dat', 'ans3', '-ascii')

ans4 = exp(-y);

save('A4.dat', 'ans4', '-ascii')

ans5 = cos(z*y);

save('A5.dat', 'ans5', '-ascii')

%Problem 2

A = [ -1 2 1; 3 1 -1];
x = [1; 2; -1];
y = [-2; 0; 1];

save('A6.dat', 'x', '-ascii')

row2 = A(2,1:end);

save('A7.dat', 'row2', '-ascii')

subtraction = x-y;

save('A8.dat', 'subtraction', '-ascii')

multiplication = A * y;

save('A9.dat', 'multiplication', '-ascii')

parte = A * (x+y);

save('A10.dat', 'parte', '-ascii')