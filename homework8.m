clc; clear all; close all;

a=5;
dxdt = @(x)(a*sin(x));
x0 = (pi)/4;
sol = @(t)(2*atan(exp(a*t) / (1 + 2^(1/2))));


dt=0.1;
n=11;
%A1 part
x=zeros(1,11);
x(1) = x0;

%Forward Euler
%x_{k+1} = x_k +dt*f(x_k))  

for k = 1: n-1
    x(k + 1) = x(k) + dt*dxdt(x(k));
end 

ans1 = x(11);
save("A1.dat", "ans1", "-ascii")

%Findnig actual solution matrix
solvec = zeros(1,n);
for k= 1:n
   solvec(k) =  sol(k/10 - 0.1);
end
%A2.dat
maxerror = norm(abs(x-solvec),Inf);
save("A2.dat", "maxerror", "-ascii");

%A3.dat
%time stamp of t= 0.01 so n should be 101
x = zeros(1,101);
T=1;
n=101;
dt= 0.01;
x0 = pi/4;
x(1) = x0;
for k= 1:n-1
    x(k+1)= x(k) + (dt * dxdt(x(k)));
end

t = 0:dt:T;
solvec = sol(t);

maxerror2 = norm(abs(x-solvec),Inf);
ans3 = x(101);
save("A3.dat", "ans3", "-ascii");
save("A4.dat", "maxerror2", "-ascii");

%A5.dat
ans5 = maxerror/maxerror2;
save("A5.dat", "ans5", "-ascii");

%A6.dat
n=101;
dt=1;
x = zeros(1,101);
x0 = pi/4;
x(1) = x0;

for k= 1:n-1
    x(k+1)= x(k) + (dt * dxdt(x(k)));
end

ans6 = x(101);
save("A6.dat", "ans6", "-ascii")

%A7.dat

guess = 3;
x = zeros(1,101);
x(1) = guess;
backwards = @(xk1,xk)(xk1 - 5.*sin(xk1) -xk);
for k = 1:100
    backwrap = @(xk1)backwards(xk1, x(k)) ;
    x(k+1)= fzero(backwrap, 3); 
end
ans7 = x(101);
save("A7.dat", "ans7", "-ascii");

%Problem 2
%g= -9.8; L= 2; n=0.5;
%coeff: a_11= 0, a_12 = 1
% a_21= -4.9, a_22 = -0.5

A = [0 1; -4.9 -0.5];
%A8.dat
dt=0.05;
n=200;
x0 = 1;
v0 = 0;
y= [x0; v0];

for k = 1:200;
    y = (eye(2) + dt*A) *y;
end

ans8 = y(1);
save("A8.dat", "ans8", "-ascii");

%A9.dat
dt = 0.05;
n= 200;
x0 = 1;
v0 = 0;
y= [x0; v0];


for k = 1:200
  y = (eye(2)-(dt*A))\y;
end

ans9 = y(1);
save("A9.dat", "ans9", "-ascii");

%A10
v0 = [1;0];
[t_out,y_out] = ode45(@(t,x) A*x, 0:0.05:10, v0);
ans10 = y_out(end,1);
save("A10.dat", "ans10", "-ascii");



