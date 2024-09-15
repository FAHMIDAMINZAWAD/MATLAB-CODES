clc
close all
clear all
A = [2 4 1;0 4 1;1 1 1]; 
B = [13 11 6]; 
Aug = [A B']; 
n = length(B); 
X = zeros(n,1); 

for col=1:n
    Aug(col,:)= Aug(col,:)/Aug(col,col); 
    
    for row = 1:n
        if row~=col 
            mul=Aug(row,col);
            Aug(row,:)= Aug(row,:) - mul*Aug(col,:);
        end   
    end
end
X=Aug(:,end)