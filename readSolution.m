function [x,z]= readSolution(tableau,basis)
basis = transpose(basis);
A= tableau(2:end,1:end-1);
B = zeros(size(A));
B(:,basis)=ones(size(B(:,basis)));
A = A .* B;

x = linsolve(A,tableau(2:end,end));
z = -(tableau(1,2:end))*x;
end
