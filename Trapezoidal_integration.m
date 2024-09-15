f=input('Enter function: ');
N=input('No.of trapezium:');
a=input('lower limit:');
b=input('upper limit:');
h=(b-a)/N;
sum1=0;

for i=1:N-1
    sum1= sum1+ f(a+i*h);
    
end

TR= (h/2)*(f(a)+ 2*sum1 +f(b));

fprintf('Trapezoidal result :%.6f\n\n',TR)

oddsum=0;
for j=1:2:N-1
    oddsum=oddsum+f(a+j*h);
end

evensum=0;
for k=2:2:N-1
    evensum=evensum+f(a+k*h);
end

Sim= (h/3)*(f(a)+4*oddsum+2*evensum+f(b));
fprintf('Simsion result: %.6f',Sim)

