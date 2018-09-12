clc; close all; clear all;
load("population.mat");
%y variable is N,  varaible is t
%t = -90 representws 1810
%central method??
% f'(x) = f(X+delta(x)) - (f(x-delta(x)) / 2delta(X)

%A1.dat
dx = abs(t(1)-t(2));

ans1 = ((-3*N(1)) + (4*N(2)) - N(3))/(2*dx);
save("A1.dat", "ans1", "-ascii");

%A2.dat
%Central difference shceme, t=11

ans2= (N(12)-N(10))/(2*dx);
save("A2.dat","ans2","-ascii");

%A3.dat
%2nd order backwards difference scheme

ans3 = ((3*N(21))-(4*N(20))+N(19))/(2*dx);
save("A3.dat", "ans3", "-ascii");

%A4.dat
store =  zeros(1,21);
store(1) = ans1;
store(21) = ans3;

for k=2:20
    store(k) = (N(k+1) - N(k-1))/(2*dx);
end

for k=1:21
    store(k) = store(k) * (1/N(k));
end

ans4 = mean(store);
save("A4.dat", "ans4", "-ascii");

%Problem 2
load("brake_pad.mat");
theta = 0.7051;
%A5.dat
%LHR: re = 0.308 ro=0.478 theta = 0.7051, n=10 or 11/
dx= (r(2)-r(1));

N = (0.478-0.308) / dx;
lhrt = 0;
for k=1:10
    lhrt = lhrt + (T(k)*dx*r(k));
end
lhrt = theta * lhrt;
save("A5.dat", "lhrt", "-ascii");

%A6.dat
%LHR for bottom
lhrb = 0;
for k=1:10
    lhrb  = lhrb + dx*r(k);
end
lhrb = lhrb * theta;
save("A6.dat", "lhrb", "-ascii");

%A7.dat
Tmeanl=lhrt/lhrb;
save("A7.dat", "Tmeanl", "-ascii");

%A8.dat
%Find right hand rule stuff
rhrt = 0;
for k=2:11
    rhrt = rhrt + (T(k)*dx*r(k));
end
rhrt = theta*rhrt;
rhrb=0;
for k=2:11
    rhrb  = rhrb + dx*r(k);
end
rhrb= theta*rhrb;
Tmeanr = rhrt/rhrb;

thrc = 0.5* (lhrt+rhrt);
save("A8.dat", "thrc", "-ascii");

thrb= 0.5*(lhrb+rhrb);
save("A9.dat", "thrb", "-ascii");

tmeanc = (thrc/thrb);
save("A10.dat", "tmeanc", "-ascii");
