function Solution = GenRandSolution(NumOfSol,LowerBound, UpperBound)
Dimension = length(LowerBound);
    for i = 1:NumOfSol
        for j =1:Dimension
            Solution(i, j)=LowerBound(:, j) + rand*(UpperBound(:, j) - LowerBound(:, j));
        end
    end
end