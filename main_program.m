%% Part 1
clc; clear all;

NumOfSolutions = 20; 
Parameter = [1,-0.5, 2.5,1.5];
LowerBound = [-6, 1, -7, 2]; 
UpperBound = [6, 10, 3, 9.5];
NumOfTopSolution = 5; 

Solutions = GenRandSolution(NumOfSolutions, LowerBound, UpperBound); %generating random solutions
fprintf('Randomly Generated Solutions: \n')
disp(Solutions)
Fitness = ObjectFunction(Parameter, Solutions); %Generating Fitness with given equation
[MinimizedSetsOfSolutions, MinimizedFuncOutput] = EvaluteFitness(NumOfTopSolution, Fitness, Solutions); %filtering top(minimum) sets of solution

fprintf('Top %d solutions: \n', NumOfTopSolution)
disp(num2str([MinimizedSetsOfSolutions, MinimizedFuncOutput]))
AvgFuncOutput(1, :) = mean(MinimizedFuncOutput); % storing average fitness output in a matrix 
fprintf('\nBest solutions for Part 1: ')
[MinFunc, MinFunc_index] = min(MinimizedFuncOutput); % finding index of min function, so that we can call the SetsOfSolution by index 
disp(MinimizedSetsOfSolutions(MinFunc_index,:))
GlobalBestSol(1,:)=MinimizedSetsOfSolutions(MinFunc_index,:); % storing best SetsOfSolution in a matrix 

%% Part 2
NewSolSize = NumOfSolutions - NumOfTopSolution;
SolutionsNew = GenRandSolution(NewSolSize, LowerBound, UpperBound);

Solutions = [SolutionsNew; MinimizedSetsOfSolutions]; 
Fitness = ObjectFunction(Parameter, Solutions); 
[MinimizedSetsOfSolutions, MinimizedFuncOutput] = EvaluteFitness(NumOfTopSolution, Fitness, Solutions);

AvgFuncOutput(2, :) = mean(MinimizedFuncOutput);
fprintf('Best solutions for Part 2: ')
[MinFunc, MinFunc_index] = min(MinimizedFuncOutput);
disp(MinimizedSetsOfSolutions(MinFunc_index,:))
GlobalBestSol(2,:)=MinimizedSetsOfSolutions(MinFunc_index,:);

%% Part 3 
NewSolSize = NumOfSolutions - NumOfTopSolution;
SolutionsNew = GenRandSolution(NewSolSize, LowerBound, UpperBound);

Solutions = [SolutionsNew; MinimizedSetsOfSolutions]; 
Fitness = ObjectFunction(Parameter, Solutions); 
[MinimizedSetsOfSolutions, MinimizedFuncOutput] = EvaluteFitness(NumOfTopSolution, Fitness, Solutions);

AvgFuncOutput(3, :) = mean(MinimizedFuncOutput);
fprintf('Best solutions for Part 3: ')
[MinFunc, MinFunc_index] = min(MinimizedFuncOutput);
disp(MinimizedSetsOfSolutions(MinFunc_index,:))
GlobalBestSol(3,:)=MinimizedSetsOfSolutions(MinFunc_index,:);

%% Part 4 and 5
generation= 10;
for j = 4:generation 
    NewSolSize = NumOfSolutions - NumOfTopSolution;
    SolutionsNew = GenRandSolution(NewSolSize, LowerBound, UpperBound);
    
    Solutions = [SolutionsNew; MinimizedSetsOfSolutions]; 
    Fitness = ObjectFunction(Parameter, Solutions); 
    [MinimizedSetsOfSolutions, MinimizedFuncOutput] = EvaluteFitness(NumOfTopSolution, Fitness, Solutions);
    
    AvgFuncOutput(j, :) = mean(MinimizedFuncOutput);
    fprintf('Best solutions for Gen %d: ', j)
    [MinFunc, MinFunc_index] = min(MinimizedFuncOutput);
    disp(MinimizedSetsOfSolutions(MinFunc_index,:))
    GlobalBestSol(j,:)=MinimizedSetsOfSolutions(MinFunc_index,:);
end

fprintf('All Best Solutions with their respective fitness: \n')
disp(num2str([GlobalBestSol, AvgFuncOutput]))
% fprintf('Average Function Output: \n')
% disp(AvgFuncOutput)
% fprintf('All Best Solution Sets: \n')
% disp(GlobalBestSol)

% plotting
f = plot(AvgFuncOutput);
title('Minimizing the function output curve')
xlabel('Number of generation')
ylabel('Desired Output results')
saveas(f, 'output.png')
%exportgraphics(f, 'output.png', 'Resolution', 300) % My ver. doesn;t support this function
