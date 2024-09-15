clc;
close all;
clear;
 
x = [2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5];
y = [4.32, 4.83, 5.27, 5.47, 6.26, 6.79, 7.23];
n = length(x);
s = zeros(1, n);
r = zeros(1, n);
t = zeros(n-1, n-1);
for k = 1:n
    if k~=1 && k~=7
    idx = 1;
    for m = 1:n
        if m ~= k
            s(idx) = x(m);
            r(idx) = y(m);
            idx = idx + 1;
        end
    end
    w=length(s);
vl = x(k);
suml = 0;
for i = 1:w
    p = 1;
    q = 1;
    for j = 1:w
        if i~=j
        p = p *(vl-s(j));
        q= q*(s(i)-s(j));
        end
    end
    suml = suml + p*r(i)/q;
end
  
    fprintf('Interpolated value at x = %.1f: %.2f\n', x(k), suml);
    fprintf('Given value at x = %.1f: %.2f\n', x(k), y(k));
    fprintf('Error: %.2f\n', abs(suml - y(k)));
    fprintf('\n');
    end
end
s