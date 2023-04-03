% GA21b
clc;
clear all;
nGenerations = 10000;
populationSize = 50;


cityPositions = LoadCityLocations();
nGenes = size(cityPositions,1); % The number of genes will be the number of cities we have in the locations file
population = InitializePopulation(populationSize,nGenes);
% Defining Parameters
mutationRate = 1/nGenes;
tournamentSize = 2;
tournamentSelect = 0.75;
% Now the population has been created, proceed to evaluate each individual
% for every generation
fitness = zeros(populationSize,1);
maxFitness = 0;
bestTourPlanList = zeros(nGenerations,nGenes);

tspFigure = InitializeTspPlot(cityPositions,[0 20 0 20]); 
connection = InitializeConnections(cityPositions);

for iGeneration = 1: nGenerations
    for i = 1:populationSize
    chromosome = population(i,:);
    [fitness(i),pathLength] = EvaluateIndividual(chromosome,cityPositions);
    if fitness(i) > maxFitness
        bestFitnessIndex = i;
        maxFitness = fitness(i);
        bestTourPlan = population(i,:);
        shortestPathLength = pathLength;
        PlotPath(connection,cityPositions,bestTourPlan); 
        title(sprintf('GA paths, Pathlength: %.2f',shortestPathLength));
        
    end
    end
    fprintf('Generation : %d Best Pathlength : %.3f \n',iGeneration, shortestPathLength);

    tmpPopulation = population;

    for i = 1:2:populationSize
        i1 = TournamentSelect(fitness,tournamentSelect,tournamentSize);
        i2 = TournamentSelect(fitness,tournamentSelect,tournamentSize);
        chromosome1 = population(i1,:);
        chromosome2 = population(i2,:);
        tmpPopulation(i,:) = chromosome1;
        tmpPopulation(i+1,:) = chromosome2;
    end

    for i = 1:populationSize
        originalChromosome = tmpPopulation(i,:);
        mutatedChromosome = Mutate(originalChromosome,mutationRate);
        tmpPopulation(i,:) = mutatedChromosome;
    end
    population = tmpPopulation;

    population = InsertBestIndividual(population,bestTourPlan,1);
    bestTourPlanList(iGeneration,:) = bestTourPlan;
     
    PlotPath(connection,cityPositions,bestTourPlan); 
    
end
fprintf('Best pathlength found for TSP using GA: %.3f \n', shortestPathLength);