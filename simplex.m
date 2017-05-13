function solution = simplexMethod(tableau, basis)
	objFun = tableau(1,1:end-1).*(-1)
	pivotCol = getPivotColumn(tableau);
	while(pivotCol != 0)
		pivotRow = getPivotRow(tableau, pivotCol);
		[tableau basis] = updateTableau(tableau,basis,[pivotRow; pivotCol]);
		pivotCol = getPivotColumn(tableau);
	end
	temp_solution = readSolution(tableau,basis);
	temp_solution
	z =objFun* (temp_solution)
	temp_solution = [temp_solution;z]
end	
