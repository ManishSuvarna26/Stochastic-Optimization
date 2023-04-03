function mutatedChromosome = Mutate(mutationRate,chromosome,nVariableRegisters,nOperators,nAvailableOperands)
    mutatedChromosome = chromosome;
    nGenesPerInstruction = 4;
    for i = 1:length(chromosome)
        r = rand;
        index = mod(i,nGenesPerInstruction);
        if mutationRate > r
            if index == 1
                mutatedChromosome(i) = 1 + fix(rand*(nOperators));
            end
            if index == 2
                mutatedChromosome(i) = 1 + fix(rand*(nVariableRegisters));
            end
            if index == 3
                mutatedChromosome(i) = 1 + fix(rand*(nAvailableOperands));
            end
            if index == 0
                mutatedChromosome(i) = 1 + fix(rand*(nAvailableOperands));
            end
        end
    end
            