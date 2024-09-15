x=[1.00 1.05 1.10 1.15 1.20 1.25];
y=[0.682689 0.706282 0.728668 0.749856 0.769861 0.788700];
n = length(x);
vl = 1.235;
sum = 0;
for i = 1:n
    p = 1;
    q = 1;
    for j = 1:n
        if i~=j
        p = p *(vl-x(j));
        q= q*(x(i)-x(j));
        end
    end
    sum = sum + p*y(i)/q;
end
disp('Interpolation using Lagrange Method')
sum


