function population = InitializePopulation(populationSize,nOperators,nVariableRegisters,nAvailableOperands,...
    maximumLengthOfChromosome, minimumLengthOfChromosome)
    
    population = [];
    for i = 1:populationSize 
        chromosomeStruct = GenerateChromosomeOfInstructions(nOperators,nVariableRegisters,nAvailableOperands,...
    maximumLengthOfChromosome, minimumLengthOfChromosome);
        population = [population; chromosomeStruct];
    end
end