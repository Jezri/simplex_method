function solution = simplexMethod(tableau, basis)
	objFun = tableau(1,1:end-1).*(-1);
	pivotCol = getPivotColumn(tableau);
	while(pivotCol != 0)
		pivotRow = getPivotRow(tableau, pivotCol);
		if pivotRow == 1;
			solution = 0;
			return;
		end
		[tableau basis] = updateTableau(tableau,basis,[pivotRow; pivotCol]);
		pivotCol = getPivotColumn(tableau);
		
	end
	temp_solution = readSolution(tableau,basis);
	z =objFun* (temp_solution);
		temp_solution = [temp_solution;z] ;
		temp_tableau = tableau;
		second_sol = 0;
	for i = 1:length(objFun)
		if all(basis !=i) && tableau(1,i) == 0 && second_sol == 0
		second_sol +=1;
		pivotCol = i;
		pivotRow = getPivotRow(temp_tableau, pivotCol);
		[temp_tableau temp_basis] = updateTableau(temp_tableau,basis,[pivotRow; pivotCol]);
		temp = [ readSolution(temp_tableau,temp_basis);z];
		temp_solution = [temp_solution,temp];
		end
	end
	solution= temp_solution;
end	
function pivotCol = getPivotColumn(tableau)
    if(any(tableau(1,1:end-1) < 0))
      [Y,temp_pivotCol] = (min(tableau(1,1:end-1)) );
        pivotCol = temp_pivotCol ;
    else
        pivotCol = 0;
    end
end
function pivotRow = getPivotRow(tableau, pivotCol)
pivotRow= findMin(tableau(2:end,end),tableau(2:end,pivotCol))+1; 
end

function ind = findMin(a, b)
%returns the smallest entry of a/b, such that b is positive. Otherwise, returns zero.
	find = 0;
	minFound = Inf;
	for i=1:length(b)
		if b(i)>0 
			if a(i)/b(i)<minFound
				minFound = a(i)/b(i);
				ind = i;
			end
			ind = find;
		end
	end
end
function [x,z]= readSolution(tableau,basis)
basis = transpose(basis);
A= tableau(2:end,1:end-1);
B = zeros(size(A));
B(:,basis)=ones(size(B(:,basis)));
A = A .* B;

x = linsolve(A,tableau(2:end,end));
z = -(tableau(1,2:end))*x;
end
function [newSimplex, newBasis] = updateTableau(tableau,basis, pivotElement)
temp_tableau = tableau;
temp_tableau(pivotElement(1),:) = tableau(pivotElement(1),:)./tableau(pivotElement(1),pivotElement(2));

	for i = [[1:pivotElement(1)-1],[pivotElement(1)+1:size(tableau,1)]]
	temp_tableau(i,:) = updateTableauRow(temp_tableau(pivotElement(1),:),temp_tableau(i,:), pivotElement(2));
	end
	newSimplex = temp_tableau;
	newBasis = updateBasis (basis, pivotElement);
end


function newBasis = updateBasis(basis, pivotElem)
temp_basis = basis;
temp_basis(pivotElem(1)-1) = pivotElem(2);
newBasis = (temp_basis);
end
function newRow = updateTableauRow(tableauPivotRow, tableauRow, pivotCol) 
		coefficient = tableauRow(pivotCol)/tableauPivotRow(pivotCol);
newRow = tableauRow - coefficient.*tableauPivotRow;
end
