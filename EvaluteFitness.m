function [OptimalSolutions, OptimalFuncOut] = EvaluteFitness(NoOfSolution, Fitness, Solution)
    for i = 1:NoOfSolution
        [Fitness_Min, Index_Min] = min(Fitness);
        OptimalSolutions(i, :) = Solution(Index_Min, :);
        OptimalFuncOut(i, :) = Fitness_Min;
        Fitness(Index_Min,:) = [];
        Solution(Index_Min, :) = [];
    end
end