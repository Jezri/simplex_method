function [newSimplex, newBasis] = updateTableau(tableau,basis, pivotElement)
temp_tableau = tableau;
temp_tableau(pivotElement(1)+1,:) = tableau(pivotElement(1)+1,:)./tableau(pivotElement(1)+1,pivotElement(2));

	for i = [[1:pivotElement(1)],[pivotElement(1)+2:size(tableau,1)]]
	temp_tableau(i,:) = updateTableauRow(temp_tableau(pivotElement(1)+1,:),temp_tableau(i,:), pivotElement(2));
	end
	newSimplex = temp_tableau;
	newBasis = updateBasis (basis, pivotElement);
end

function newRow = updateTableauRow(tableauPivotRow, tableauRow, pivotCol)
coefficient = tableauRow(pivotCol)/tableauPivotRow(pivotCol);
newRow = tableauRow - coefficient.*tableauPivotRow;
end

function newBasis = updateBasis(basis, pivotElem)
temp_basis = basis;
temp_basis(pivotElem(1)) = pivotElem(2);
newBasis = (temp_basis);
end
