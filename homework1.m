clc; clear all; close all;

%Problem 2
A = [ 1 2; -3 1];
B = [5 3; -1 3];
C = [1 2 3; -9 2 4];
D = [ 1 -2; -1 3; 2 3;];
x = [-2;0];
y =[0;3];
z = [2;-3;1];

parta = B-A;
save('A1.dat', 'parta', '-ascii')

partb = (-2*x) + (4*y);
save('A2.dat', 'partb', '-ascii')

partc = B*x;
save('A3.dat', 'partc', '-ascii')

partd = A*(x-y);
save('A4.dat', 'partd', '-ascii')

parte = C*z;
save('A5.dat', 'parte', '-ascii')

partf = A * B;
save('A6.dat', 'partf', '-ascii')

partg = B * A;
save('A7.dat', 'partg', '-ascii')

parth = A * C;
save('A8.dat', 'parth', '-ascii')

parti = C * D;
save('A9.dat', 'parti', '-ascii')

partj = D(1:2,:);
save('A10.dat', 'partj', '-ascii')

partk = C(:,2);
save('A11.dat', 'partk', '-ascii')

partl = C(1, 2:end);
save('A12.dat', 'partl', '-ascii')


%Problem 2
n=0;
for k=1:800000
    n = n+0.1;
end
x1 = abs(80000-n);
save('A13.dat', 'x1', '-ascii')

n=0;
for k=1:640000
    n = n+0.125;
end
x2 = abs(80000-n);
save('A14.dat', 'x2', '-ascii')

n=0;
for k=1:400000
    n=n+0.2;
end
x3 = abs(80000-n);
save('A15.dat', 'x3', '-ascii')

n=0;
for k=1:320000
    n=n+0.25;
end
x4 = abs(80000-n);
save('A16.dat', 'x4', '-ascii')

%Problem 3
r=3;
K=20;
P=10;
b= zeros(1,100);
b(1) = P;
for k=1:99
    P = r*P*(1-P/K);
    b(k+1) = P;
end

save('A17.dat', 'P', '-ascii')

plot(1:100, b)







 