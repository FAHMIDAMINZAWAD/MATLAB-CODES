% Given data points
x = [2.0, 2.5, 3.0];
y = [0.69315, 0.91629, 1.09861];

% Function to compute the Lagrange basis polynomials
L = @(x_val, xi, xj) (x_val - xj) ./ (xi - xj);

% Number of data points
n = length(x);

% Initialize the polynomial as a symbolic variable
syms X
P = 0;

% Compute the Lagrange polynomial
for i = 1:n
    term = y(i);
    for j = 1:n
        if i ~= j
            term = term * L(X, x(i), x(j));
        end
    end
    P = P + term;
end

% Simplify the polynomial
P = expand(P);

% Display the polynomial
disp('The Lagrange interpolating polynomial is:');
disp(P);

% Calculate the value at x = 2.7
x_value = 2.7;
ln_2_7 = double(subs(P, X, x_value));

% Display the result
fprintf('The estimated value of ln(2.7) is: %.5f\n', ln_2_7);
