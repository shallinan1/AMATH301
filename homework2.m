clc; clear all; close all;

tolerance = 10^-10;
a=0;
b=1.2;
count=0;
f = @(x)(x^5-2*x^4+3*x^3-2*x^2+x-1-cos(30*x));
ans1 = f(a) * f(b);
save("A1.dat", "ans1", "-ascii");

for k = 1:1000
    count = count +1;
    midpoint = (a+b)/2;
    if abs(f(midpoint)) < tolerance
        ans2 = midpoint;
        break
    end
    if sign(f(midpoint)) == sign(f(a))
        a = midpoint;
    else
        b = midpoint;
    end
end

save("A2.dat", "ans2", "-ascii");

save("A3.dat", "count", "-ascii");



%Problem 2
r=3.5;
K=50;
P=10;
b= zeros(1,102);
b(1) = P;
for k=1:101
    P = r*P*(1-P/K);
    b(k+1) = P;
end
 matrix1 = [Pout(2.5,50,10, 99:101); Pout(3.2, 50,10, 99:101);Pout(3.5, 50,10, 99:101)];
 
 save("A4.dat", "matrix1", "-ascii");
 
 is_equilibrium = zeros(1,15);
 equilibrium_value = zeros(1,15);
 
 tolerance = 10^-8;
 marker = 0;
 
 for r=2:0.1:3.4
     marker = marker +1;
     if abs(Pout2(r,50,10,501) - Pout2(r,50,10,500)) < tolerance
         is_equilibrium(marker) = 1;
         equilibrium_value(marker) = Pout2(r,50,10,501);
     end
 end
 
save("A5.dat","is_equilibrium","-ascii");
save("A6.dat","equilibrium_value","-ascii");

%problem 3
p = [1 0 0 0];
save("A7.dat", "p", "-ascii");
probmat= [0.99 0 0.01 0; 0 0.56 0.25 0.19; 0.1 0.22 0.42 0.26; 0 0.36 0.15 0.49];
counta = 0;
for k=1:1000
p = p*probmat;
counta = counta+1;
if p(1) < 0.8
    break
end
end

save("A8.dat","counta","-ascii");
save("A9.dat","p","-ascii");
 
pold = [1 0 0 0];
pnew = [1 0 0 0];
for k=1:1000
    pold= pnew;
    pnew=pold*probmat;
    if abs(pold(1)-pnew(1)) < tolerance
        break
    end
end

save("A10.dat", "pnew", "-ascii");

 