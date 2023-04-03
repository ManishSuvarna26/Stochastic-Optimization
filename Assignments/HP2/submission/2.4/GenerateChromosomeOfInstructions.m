function chromosomeStruct = GenerateChromosomeOfInstructions(nOperators,nVariableRegisters,nAvailableOperands,...
    maximumLengthOfChromosome, minimumLengthOfChromosome)
    nGenesPerInstruction = 4;
    chromosomeLength = 1 + fix(rand*(maximumLengthOfChromosome - minimumLengthOfChromosome)) + minimumLengthOfChromosome;
    chromosome = zeros(1,chromosomeLength);
    
    for i = 1:nGenesPerInstruction:chromosomeLength
        chromosome(i) = 1 + fix(rand*(nOperators));
        chromosome(i+1) = 1 + fix(rand*(nVariableRegisters));
        chromosome(i+2) = 1 + fix(rand*(nAvailableOperands));
        chromosome(i+3) =  1 + fix(rand*(nAvailableOperands));
    end
    
    % Since the generated chromosomes will have varying length, making the
    % chromosome a struct field helps to work with it 
    chromosomeStruct = struct('Chromosome',chromosome);