clc
close
clear
format short
syms f(x)
iteration=0;
f(x)= x^3-2*x^2+3*x-5;
df = diff(f,x);
x_o=1.8;
tol=10^-5;
n=50;
for i = 1 :n
    x_i=x_o-(f(x_o)/df(x_o));
    
    iteration=iteration+1;

  
    if abs(f(x_i))<tol
        disp(double(x_i));
        break
    end
    x_o=x_i;
end