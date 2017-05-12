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

function pivotCol = getPivotColumn(tableau)
    if(any(tableau(1,1:end-1) < 0))
      [Y,temp_pivotCol] = (min(tableau(1,1:end-1)) );
        pivotCol = temp_pivotCol ;
    else
        pivotCol = 0;
    end
end

function pivotRow = getPivotRow(tableau, pivotCol)
pivotRow= findMin(tableau(2:end,end),tableau(2:end,pivotCol));
end

function ind = findMin(a, b)
%returns the smallest entry of a/b, such that b is positive. Otherwise, returns zero.
	ind = 0;
	minFound = Inf;
	for i=1:length(b)
		if b(i)>0 && a(i)/b(i)<minFound
			minFound = a(i)/b(i);
			ind = i;
		end
	end
end
