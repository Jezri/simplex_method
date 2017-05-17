function solution = bigM(c,A,b);
	nonConicalRows = getNonConicalRows(A)
	[Ms ,A] = addRs(A, nonConicalRows)
solution = 0;
end;
function nonConicalRows = getNonConicalRows(A);
	
	height = size(A)(1);
	conical_rows =[];
	for	i=1:size(A)(1)
		for j=1:size(A)(2) 
			if A(i,j) == 1 && all(A([1:i-1,i+1:end],j) == zeros(height-1,1))
				conical_rows = [conical_rows,i];
			A(i,j);
			end
		end
	end

	non_conical_rows = [];
	for i = 1:size(A)(1);
		if all(conical_rows !=i);
			non_conical_rows = [non_conical_rows,i];
		end
	end
	nonConicalRows = non_conical_rows;
end
function [Ms , A] = addRs(A, nonConicalRows)
	height = size(A)(1);
	Ms = zeros(1,size(A)(2));
	for i = nonConicalRows
		append_vector = zeros(height,1);
		append_vector(i,1)=1;
		A=[A,append_vector];
		Ms = [Ms,1];
		Ms = updateTableauRow(A(i,:),Ms, size(A)(2));
	end
end
function newRow = updateTableauRow(tableauPivotRow, tableauRow, pivotCol) 
		coefficient = tableauRow(pivotCol)/tableauPivotRow(pivotCol);
newRow = tableauRow - coefficient.*tableauPivotRow;
end
