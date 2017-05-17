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
