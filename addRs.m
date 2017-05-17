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
