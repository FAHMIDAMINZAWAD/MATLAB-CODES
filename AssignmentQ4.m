%% Lagrange
	x=[2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5];
	y=[4.32, 4.83, 5.27, 5.47, 6.26, 6.79, 7.23];
n = length(x);
vl = 3;
suml = 0;
for i = 1:n
    p = 1;
    q = 1;
    for j = 1:n
        if i~=j
        p = p *(vl-x(j));
        q= q*(x(i)-x(j));
        end
    end
    suml = suml + p*y(i)/q;
end
disp('Interpolation using Lagrange Method')
suml