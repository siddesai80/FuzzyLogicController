% Genetic Algorithm for FLC Membership Function Optimization

% Defining problem encoding
% Chromosome length: 6 (2 MFs for Input1, 2 MFs for Input2, 1 MF for Output1, 1 MF for Output2)
chromosomeLength = 6;

% Defining lower and upper bounds for each MF parameter
lowerBounds = [-2.08333, 0, -2.08333, 0, -82.5, -12.5];
upperBounds = [7.08333, 7.08333, 82.406976744186, 42.5, 82.406976744186, 42.5];

% Defining fitness function
fitnessFunction = @(chromosome) evaluateFLC(chromosome, lowerBounds, upperBounds, data); % Implement this function based on your evaluation criteria

% Defining genetic operators
mutationRate = 0.1; % Probability of mutation
crossoverRate = 0.8; % Probability of crossover
selectionMethod = 'roulette'; % Selection method (e.g., 'roulette', 'tournament')

% Defining GA parameters
populationSize = 50;
maxGenerations = 100;
eliteCount = 2; % Number of elites to preserve in each generation

% Initializing population
population = initializePopulation(populationSize, chromosomeLength, lowerBounds, upperBounds);

% Evaluating initial population
fitness = evaluatePopulation(population, fitnessFunction);

% Main GA loop
for generation = 1:maxGenerations
    % Selecting parents
    parents = selectParents(population, fitness, selectionMethod);
    
    % Applying crossover
    offspring = crossover(parents, crossoverRate);
    
    % Applying mutation
    offspring = mutate(offspring, mutationRate, lowerBounds, upperBounds);
    
    % Evaluating offspring
    offspringFitness = evaluatePopulation(offspring, fitnessFunction);
    
    % Combining offspring and parents
    combinedPopulation = [population; offspring];
    combinedFitness = [fitness; offspringFitness];
    
    % Selecting new population
    [population, fitness] = selectPopulation(combinedPopulation, combinedFitness, populationSize, eliteCount);
    
    % Displaying generation information
    disp(['Generation: ' num2str(generation) ', Best Fitness: ' num2str(max(fitness))]);
end

% Extracting best chromosome
bestChromosome = population(1, :);

% Decoding and setting optimized membership functions for FLC
[flc, input1Mf1, input1Mf2, input2Mf1, input2Mf2, output1Mf, output2Mf] = decodeChromosome(bestChromosome, lowerBounds, upperBounds);
flc.Inputs(1).MFs(1).Params = input1Mf1;
flc.Inputs(1).MFs(2).Params = input1Mf2;
flc.Inputs(2).MFs(1).Params = input2Mf1;
flc.Inputs(2).MFs(2).Params = input2Mf2;
flc.Outputs(1).MFs(1).Params = output1Mf;
flc.Outputs(2).MFs(1).Params = output2Mf;