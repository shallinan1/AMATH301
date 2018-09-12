close all; clear all; clc;
%A1.dat
f = @(x)((1-x(1))^2+10*(x(2)-x(1)^2)^2);
compute = f([-1, 8]);
save("A1.dat", "compute", "-ascii");

%A2.dat
min = fminsearch(f, [-1 8]);
mincol = min.';
save("A2.dat", "mincol", "-ascii");

%A3.dat
%grad = @(x1,x2)([-2*(1-x1)-40*x1*(x2-x1^2); 20*(x2-x1^2)]);
grad = @(x)([-2*(1-x(1))-40*x(1)*(x(2)-x(1)^2); 20*(x(2)-x(1)^2)]);
ans3 = grad([-1,8]);
save("A3.dat", "ans3", "-ascii");

%A4.dat
norm1 = norm(ans3, Inf);
save("A4.dat", "norm1", "-ascii");

%A5.dat
phi = @(t)([-1-t*ans3(1); 8-t*ans3(2)]);
phi1 = phi(0.1);
save("A5.dat", "phi1", "-ascii");

%A6.dat
fphi1= f(phi1);
save("A6.dat", "fphi1", "-ascii");
%A7.dat
g = @(t)(f(phi(t)));
time = fminbnd(g,0,0.1);
save("A7.dat", "time", "-ascii");

%A8.dat
a8vec = phi(time);
save("A8.dat", "a8vec", "-ascii");

%A9.dat
counter = 0;
tolerance = 10^-4;
guess = [-1;8];

while norm(grad(guess),Inf) >= tolerance && counter<2000
a = grad(guess);
phi = @(t)([guess(1)-t*a(1); guess(2)-t*a(2)]);
g = @(t)(f(phi(t)));
time = fminbnd(g,0,0.1);
guess = phi(time);
counter = counter + 1;
end

save("A9.dat", "guess", "-ascii");
save("A10.dat", "counter", "-ascii");



