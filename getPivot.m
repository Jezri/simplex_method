function pivotElement = getPivot(tableau)

	pivotCol = getPivotColumn(tableau);
	if pivotCol == 0
		pivotElement = 0;
	else
	 	pivotRow = getPivotRow(tableau, pivotCol);
		if pivotRow == 0;
	 	pivotElement = 1;
		else	
		pivotElement = [ pivotRow; pivotCol];
		end
	end
end
