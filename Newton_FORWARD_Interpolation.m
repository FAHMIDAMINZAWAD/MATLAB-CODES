clc
close all
clear all
x = [0.61 0.62 0.63 0.64 0.65 0.66 0.67];
y = [1.840431 1.858928 1.877610 1.896481 1.915541 1.934792 1.954237];
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

sumf = y(1);
h = x(2)-x(1);
vf=0.644;
p = (vf-x(1))/h; 
for i = 1:n-1
    prod = 1;
    for j = 1:i
        prod = prod*(p-(j-1)); 
    end
    sumf = sumf + prod*t(1,i+2)/factorial(i);  
end
disp('Interpolation using Forward Difference Table')
