clc; clear all; close all;
load('salmon.mat');

%Problem A1
xfine = 0:0.01:80;
% plot(t,salmon, 'ro')
coeff=polyfit(t,salmon,1);
yfine= polyval(coeff, xfine);
% hold on;
% plot(xfine, yfine);

slope= coeff(1);
save("A1.dat", "slope", "-ascii");

%Problem A2
proj = yfine(8001);
save("A2.dat", "proj", "-ascii");

%Problem A3
rmse =  sqrt(sum((polyval(coeff,t)-salmon).^2)./length(salmon));
save("A3.dat", "rmse", "-ascii");

%Problem A4
close all;
coeff=polyfit(t,salmon,2);
yfine= polyval(coeff,xfine);
plot(xfine,yfine);
proj = yfine(8001);
save("A4.dat","proj", "-ascii");

%Problem A5
close all;
coeff=polyfit(t,salmon,5);
yfine= polyval(coeff,xfine);
plot(xfine,yfine);
proj = yfine(8001);
save("A5.dat","proj", "-ascii");

%Problem A6
close all;
coeff=polyfit(t,salmon,20);
yfine= polyval(coeff,xfine);
plot(xfine,yfine);
proj = yfine(8001);
save("A6.dat","proj", "-ascii");

%Problem A7A8
close all;
z = log(salmon);
coeff= polyfit(t,z,1);
zfine=polyval(coeff,xfine);
r=coeff(1);
n=exp(coeff(2));
rv = [n r];
save("A7.dat","rv","-ascii");

proj = exp(zfine(8001));
save("A8.dat","proj","-ascii");

%Problem A9
v= [0.001, -0.01, 10];
vfin = fminsearch('rmse',v);
proj = exp((vfin(1)*(80^2))+(vfin(2)*80)+vfin(3))
save("A9.dat", "proj", "-ascii");

%Problem A10
yfine = spline(t,salmon,xfine);
proj = yfine(8001);
save("A10.dat", "proj", "-ascii");




