clc
close all
clear all
x = [150 152 154 156];
y = [12.247 12.329 12.410 12.490];
n=length(x); 

t=zeros(n,n+1);
t(:,1) = x;
t(:,2) = y;
dd = n-1;

for j= 3:n+1
    for i= 1:dd
        t(i,j)= t(i+1,j-1)- t(i,j-1);
    end
    dd=dd-1;
end

sumb = y(n);
h = x(2)-x(1);
vp = 38;
p = (vp-x(n))/h;
z=n;
for i = 1:n-1
    prod = 1;
    for j = 1:i
        prod = prod*(p+(j-1)); 
    end
    z=z-1;
    sumb = sumb + prod*t(z,i+2)/factorial(i); 
end
disp('Interpolation using Backward Difference Table')

