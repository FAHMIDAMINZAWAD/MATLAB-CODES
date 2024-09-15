% Define the data points (x and y values)
x = [0 1 2 3 4]; % example x values
y = [1 2 4 8 16]; % example y values

% Number of data points
n = length(x);

% Initialize the difference table
t = zeros(n, n+1);
t(:,1) = x;
t(:,2)=y;
dd=n-1;
p=0;
% Compute the forward differences
for j = 3:n+1
    for i=1:dd 
   t(i,j)= t(i+1,j-1)- t(i,j-1);
    end
    dd=dd-1;
end

% Display the difference table
disp('Difference Table:');
disp(t);

% Compute the derivative using Newton's forward interpolation formula
h = x(2) - x(1); % assuming equally spaced points

sum=0;

for j=1:n-1
    sum = sum+ ((-1)^(j+1)*t(1,j+2))/j
end
diff1=sum/h;

fprintf('x=2 is=%.4f',diff1)
