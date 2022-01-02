function fitness  = ObjectFunction(parameter, x)
    for i = 1:size(x, 1)
        terms = 0;
        for j = 1:size(x, 2)
            terms = parameter(:, j)*(x(i, j).^2);
            terms = terms + terms;
        end
        fitness(i,:) = terms;
    end
end