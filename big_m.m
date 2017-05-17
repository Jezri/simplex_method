function solution = bigM(c,A,b);
	nonConicalRows = getNonConicalRows(A)
	[Ms ,A] = addRs(A, nonConicalRows)
solution = 0;
end;
