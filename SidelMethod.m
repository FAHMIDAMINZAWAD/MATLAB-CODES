clc
close all
clear all
format long;
i = 1;
xi(i) = 0;
x2(i) = 0;
x3(i) = 0;
error_x1(i) = 9999;
iteration=0;
while error_x1(i)>=10^-12
    
    x1(i+1) = (11+2*x2(i)-x3(i))/6;
    x2(i+1) = (5+2*x1(i+1)-2*x3(i))/7;
    x3(i+1) = (-1-1*x1(i+1)-2*x2(i+1))/-5;
    
    error_x1(i+1) = abs((x1(i+1)-x1(i))/x1(i+1))*100; 
    error_x2(i+1) = abs((x2(i+1)-x2(i))/x2(i+1))*100;
    error_x3(i+1) = abs((x3(i+1)-x3(i))/x3(i+1))*100;
    i=i+1;
    iteration = iteration+1;
end
result= [x1(end);x2(end);x3(end)]
fprintf(' Iteration = %d',iteration)


