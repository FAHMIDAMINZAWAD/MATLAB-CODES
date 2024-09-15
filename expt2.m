f=@(x) exp(x)-x^2;
t=0;
xn=0;
xp=0;
while f(xn)*f(xp)>0 %run the loop as long as both have same sign
   y = f(t); %first trial
   
   if y>0
       xp = t;
   else
       xn = t;
   end
   t = t+1; %increase trial variable
end

tol=10^-5;
n=1000;

for i=1:n;
    
    xt=(xp*f(xn)-xn*f(xp))/(f(xn)-f(xp));
    fprintf('xt %d =%.7f\n',i,xt)
    
    if abs(f(xt))<tol
        break
    end
    
    if f(xn)*f(xt)<0
        xp=xt;
        
    else 
        xn=xt;
    end   
end