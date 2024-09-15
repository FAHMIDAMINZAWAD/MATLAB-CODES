clc
close all
clear all
format long;
i = 1;
xi(i) = 0;
x2(i) = 0;
x3(i) = 0;
error_x1(i) = 9999;
while error_x1(i)>=10^-12
    
    x1(i+1) = (1-3*x2(i)+5*x3(i))/12;
    x2(i+1) = (28-1*x1(i+1)-3*x3(i))/5;
    x3(i+1) = (76-3*x1(i+1)-7*x2(i+1))/13;
    
    error_x1(i+1) = abs((x1(i+1)-x1(i))/x1(i+1))*100;
    error_x2(i+1) = abs((x2(i+1)-x2(i))/x2(i+1))*100;
    error_x3(i+1) = abs((x3(i+1)-x3(i))/x3(i+1))*100;
    
    i=i+1;
end
result= [x1(end);x2(end);x3(end)]


