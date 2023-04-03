%%LGP24

clc;
clear all;
dataset = LoadFunctionData();
nVariableRegisters = 6;
nConstantRegisters = 1;
nAvailableOperands = nVariableRegisters + nConstantRegisters;
constantRegistersSet = 1;
nOperators = 4; %add,substract,multiply,divide
divisionProtection = 1e4;
genesPerInstruction = 4;
minimumNumberOfInstructions = 5;
maximumNumberOfInstructions = 50;
minimumLengthOfChromosome = minimumNumberOfInstructions*genesPerInstruction;
maximumLengthOfChromosome = maximumNumberOfInstructions*genesPerInstruction;
lengthViolationPenalty = 0.2;
populationSize = 100;
nGenerations = 50000;
tournamentSize = 2;
tournamentSelect = 0.75;
crossOverProbability = 0.1;
% Initialize Population
population = InitializePopulation(populationSize,nOperators,nVariableRegisters,nAvailableOperands,...
    maximumLengthOfChromosome, minimumLengthOfChromosome);
% Evaluate Individual Chromosome of instructions
fitness = zeros(populationSize,1);
maxFitness = 0;
mutationVaryingFactor = zeros(1,nGenerations);
mutationVaryingFactor(1:nGenerations*0.8) = linspace(5,0,nGenerations*0.8);
for iGenerations = 1:nGenerations
    
for i = 1:populationSize
    chromosome = population(i).Chromosome;
    [fitness(i),totalError(i)] = EvaluateIndividual(chromosome,dataset,nVariableRegisters,constantRegistersSet,divisionProtection,maximumLengthOfChromosome,lengthViolationPenalty);
    
    if fitness(i) > maxFitness
        bestFitnessIndex = i;
        maxFitness = fitness(i);
        bestIndividual = chromosome;
        leastError = totalError(i);
    end
    fprintf('Generation :%d Best Fitness :%.3f RMS Error :%.3f \n',iGenerations,maxFitness,leastError)
end
tmpPopulation = population;
for i = 1:2:populationSize
        i1 = TournamentSelect(fitness,tournamentSelect,tournamentSize);
        i2 = TournamentSelect(fitness,tournamentSelect,tournamentSize);
        chromosome1 = population(i1).Chromosome;
        chromosome2 = population(i2).Chromosome;
        %Crossing the selected chromosomes
        r = rand;
        if r < crossOverProbability
            [crossedChromosome1struct, crossedChromosome2struct] = CrossOver(chromosome1, chromosome2);
            tmpPopulation(i).Chromosome = crossedChromosome1struct.crossedChromosome1;
            tmpPopulation(i+1).Chromosome = crossedChromosome2struct.crossedChromosome2;
        else
            tmpPopulation(i).Chromosome = chromosome1;
            tmpPopulation(i+1).Chromosome = chromosome2;
        end
end
% Taking the average number of genes per individual as the mutation rate
 nGenesInPopulation = 0;
for i = 1:populationSize
   
    nGenesInPopulation = nGenesInPopulation + length(population(i).Chromosome);
end
averageLengthInPopulation = nGenesInPopulation/populationSize;
mutationRate = 1/averageLengthInPopulation;
mutationRate = mutationRate + mutationVaryingFactor(iGenerations)*mutationRate;


for i = 1:populationSize
    originalChromosome = tmpPopulation(i).Chromosome;
    mutatedChromosome = Mutate(mutationRate,originalChromosome,nVariableRegisters,nOperators,nAvailableOperands);
    tmpPopulation(i).Chromosome = mutatedChromosome;
end
population = tmpPopulation;

population = InsertBestIndividual(population,bestIndividual,1);
end



