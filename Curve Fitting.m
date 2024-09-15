close all
clear all
clc

x=[1 2 3 4 5];
y=[8 26 46 76 119];
d=input('No. of order:');
n=length(x);
N=d+1;
A=zeros(N,N);
B=zeros(N,1);

for i=1:N
    for j=1:N
        A(i,j)=sum(x.^(i+j-2));
    end
end

for k=1:N
    B(k,1)=sum(x.^(k-1).*y);
end

s=A\B;
C=flip(s);
p=poly2sym(C');
X=linspace(x(1),x(n),100);
Y=polyval(C,X);
plot (X,Y,'r')
hold on
plot(x,y,'b')