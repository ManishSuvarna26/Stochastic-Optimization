clc;
clear all;
nGenes = 50;
nVariables = 2;
variableRange = 3;
populationSize = 100;
pCrossover = 0.8;
tournamentSize = 2;
tournamentSelect = 0.75;
mutationRate = [0, 0.02,0.05];
maxFitness = 0;
bestFitnessIndex = 0;
nGenerations = 100;
%Initializing Population
population = InitializePopulation(populationSize,nGenes);
fitness = zeros(populationSize,1);

%Decoding and Evaluating the fitness of each chromosome
fitnessMedianTable = zeros(1,3);
variablesTable = zeros(2,3);

for iMutationRate = 1:length(mutationRate)
    
    for iGenerations = 1:100
        maxFitness = 0;
        bestFitnessIndex = 0;

        for i = 1:populationSize
        chromosome = population(i,:);
        variables = DecodeChromosome(chromosome,nVariables,variableRange);
        fitness(i) = EvaluateIndividual(variables);
            if fitness(i) > maxFitness
                bestFitnessIndex = i;
                maxFitness = fitness(i);
                bestIndividual = population(i,:);
                bestIndividualVariables = variables;
            end      
   
        end
        fitnessMedian = median(fitness);

        tmpPopulation = population;

        for i = 1:2:populationSize
            i1 = TournamentSelect(fitness,tournamentSelect,tournamentSize);
            i2 = TournamentSelect(fitness,tournamentSelect,tournamentSize);
            chromosome1 = population(i1,:);
            chromosome2 = population(i2,:);
            %Crossing the selected chromosomes
            r = rand;
            if r < pCrossover
                chromosomePair = Cross(chromosome1, chromosome2);
                tmpPopulation(i,:) = chromosomePair(1,:);
                tmpPopulation(i+1,:) = chromosomePair(2,:);
            else
                tmpPopulation(i,:) = chromosome1;
                tmpPopulation(i+1,:) = chromosome2;
            end
        end


        %Mutating the chromosomes

        for i = 1:populationSize
            originalChromosome = tmpPopulation(i,:);
            mutatedChromosome = Mutate(originalChromosome,mutationRate(iMutationRate));
            tmpPopulation(i,:) = mutatedChromosome;
        end

population = tmpPopulation;

population = InsertBestIndividual(population,bestIndividual,1);

    end
   
    fitnessMedianTable(iMutationRate) = fitnessMedian;
    variablesTable(:,iMutationRate) = bestIndividualVariables';
   
end
varNames = {'Mutation Rate','Fitness Median','x1*','x2*'};
T = table(mutationRate',round(fitnessMedianTable',4),round(variablesTable(1,:)',3),round(variablesTable(2,:)',3),'VariableNames',varNames)
