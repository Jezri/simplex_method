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
