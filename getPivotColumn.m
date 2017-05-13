function pivotCol = getPivotColumn(tableau)
    if(any(tableau(1,1:end-1) < 0))
      [Y,temp_pivotCol] = (min(tableau(1,1:end-1)) );
        pivotCol = temp_pivotCol ;
    else
        pivotCol = 0;
    end
end
