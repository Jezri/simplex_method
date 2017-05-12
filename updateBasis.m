function newBasis = updateBasis(basis, pivotElem)
temp_basis = basis;
temp_basis(pivotElem(1)) = pivotElem(2);
newBasis = (temp_basis);
end
