function solution = simplexMethod(tableau, basis)
	pivotCol = getPivotColumn(tableau)
	while(pivotCol != 0)
		pivotRow = getPivotRow(tableau, pivotCol)
		[tableau basis] = updateTableau(tableau,basis,[pivotRow; pivotCol])
	end
	solution = readSolution(tableau,basis)
end	
