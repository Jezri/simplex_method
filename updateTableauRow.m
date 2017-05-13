function newRow = updateTableauRow(tableauPivotRow, tableauRow, pivotCol) 
		coefficient = tableauRow(pivotCol)/tableauPivotRow(pivotCol);
newRow = tableauRow - coefficient.*tableauPivotRow;
end
