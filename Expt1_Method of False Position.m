f=@(x) x^4+3*x^3-8*x^2-6*x+1
t=0;
xn=0;
xp=0;

while f(xn)*f(xp)>0
    y=f(t);
    
    if y>0
        xp=t;
    else
        xn=t;
    end        
    t=t+1;
end 

tol=10^-10;
n=50;

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