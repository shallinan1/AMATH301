clear all; close all; clc;

%Problem 1:
%vdot = v- 1/3v^3 - w +I(t)
%wdot = (a+v-bw)/tao

%A1.dat

%Initital condition
y0=[1;0];
a = 0.7; b = 0.8; tao = 12.5;

%Paramaters
dt = 0.5;
t= [0:dt:100];
Y= zeros(2,length(t));
Y(:,1) = y0;

%Definining function
It = @(t)(1/10 * (5+sin((pi*t)/10)));
f1 =@(t, y)([y(1)-(1/3)*y(1)^3-y(2) + It(t); (a + y(1) - b*y(2)) / tao]);

for k = 1:length(t)-1
     Y(:, k + 1) = Y(:, k) + dt*f1(t(k)+ dt/2, Y(:, k) + (dt/2) * f1(t(k), Y(:, k)));
end

ans1  = Y(1,201);
save("A1.dat", "ans1", "-ascii");

%A2.dat
[M,I] = max(Y(1,1:21));
t1 = I * dt -0.5;
[M,I] = min(Y(1,21:41));
t2 = I*dt -0.5 +10;
[M,I] = max(Y(1,81:101));
t3= I*dt -0.5 +40;


%A2.dat
ans2 = Y(1,t1*2+1) - Y(1,t2*2+1);
save("A2.dat", "ans2", "-ascii");

%A3.dat
ans3 = t3-t1;
save("A3.dat", "ans3", "-ascii");

%A4.dat

a = 0.7; b = 0.8; r = 12.5; dt = 0.5; T = 100;
t = 0:dt:T;
b0 = [1;0];
B = zeros(2, length(t));
B(:, 1) = b0;
I =@(t)((1/10)*(5 + sin(pi*t/10)));
fnew =@(t, v1)([v1(1) - (1/3) * v1(1)^3 - v1(2) + I(t); (a + v1(1) - b*v1(2)) / r]);
for k = 1: length(t) - 1
    f1 = fnew(t(k), B(:, k));
    f2 = fnew(t(k) + dt/2, B(:, k) + (dt*f1)/2);
    f3 = fnew(t(k) + dt/2, B(:, k) + (dt*f2)/2);
    f4 = fnew(t(k) + dt, B(:, k) + (dt*f3));
    B(:,k + 1) = B(:, k) + (dt/6) * (f1+2*f2+2*f3+f4);
end

ans4 = B(1,end);
save("A4.dat", "ans4", "-ascii");

[M,I1] = max(B(1,1:21));
t1 = I1 * dt -0.5;
[M,I2] = min(B(1,21:41));
t2 = I2*dt -0.5 +10;
[M,I3] =  max(B(1,81:101));
t3= I3*dt -0.5 +40;


%A5.dat
ans5 = B(1,t1*2+1) - B(1,t2*2+1);
save("A5.dat", "ans5", "-ascii")

%A6.dat
ans6 = t3-t1;
save("A6.dat", "ans6", "-ascii");

%Problem 2
%xdoubledot + x=4cos(5t)
%Initital conditons: x(0)=1 and x(6) =2 ;
%dt= 0.01, second order difference scheme

%A7.dat
x0=1;
xT = 2;
T=6;
dt=0.01;
timespan= [0:dt:6];
N = T/dt;

Y = ones(N-2, 1);
v2 = -2*ones(N-1, 1);

A = diag(v2) + diag(Y, 1) + diag(Y, -1);
A = (1/dt^2) * A;
A = A + eye(N-1);

b=zeros(N-1,1);
b= 4*cos(5*[0.01:dt:5.99]);
b=b';
b(1) = b(1) - (x0 / dt^2);
b(end) = b(end) - (xT / dt^2);



ans7 = length(timespan)-2;
save("A7.dat", "ans7", "-ascii");

x = A\b;
ans8=x(300);
save("A8.dat", "ans8", "-ascii");

[M,I] = max(x);
ans9 = I*0.01;
[M,I] = min(x);
ans10 = I*0.01;

save("A9.dat", "ans9", "-ascii");
save("A10.dat", "ans10", "-ascii");

             
