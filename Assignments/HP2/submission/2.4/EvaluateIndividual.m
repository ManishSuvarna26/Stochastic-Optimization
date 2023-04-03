function [fitness,totalError] = EvaluateIndividual(chromosome,dataset,nVariableRegisters,constantRegistersSet,divisionProtection,maximumLengthOfChromosome)

    chromosomeLength = length(chromosome);
    numberOfDataPoints = length(dataset);
    numberOfGenesPerInstruction =4;
    numberOfConstants = length(constantRegistersSet);
    
    error = 0;
    lengthViolationPenalty = (1 - abs((maximumLengthOfChromosome-length(chromosome)))/maximumLengthOfChromosome);
    
    for k = 1:numberOfDataPoints
        x = dataset(k,1);
        y = dataset(k,2);
        variableConstantsUnionSet = zeros(1,(nVariableRegisters + numberOfConstants));
        variableConstantsUnionSet(1) = x;
        variableConstantsUnionSet(nVariableRegisters+1:end) = constantRegistersSet;
        for i = 1:numberOfGenesPerInstruction:chromosomeLength
            operator = chromosome(i);
            destinationRegister = chromosome(i+1);
            operand1Register = chromosome(i+2);
            operand2Register = chromosome(i+3);
            operand1 = variableConstantsUnionSet(operand1Register);
            operand2 = variableConstantsUnionSet(operand2Register);
            
            if operator == 1
                variableConstantsUnionSet(destinationRegister) = operand1 + operand2;
            end
            if operator ==2
                variableConstantsUnionSet(destinationRegister) = operand1 - operand2;
            end
            if operator == 3
                variableConstantsUnionSet(destinationRegister)= operand1 * operand2;
            end
            if operator == 4
                if operand2 == 0
                    variableConstantsUnionSet(destinationRegister) = divisionProtection;
                else
                    variableConstantsUnionSet(destinationRegister)= operand1 / operand2;
                end
            end
        end
        yEstimate = variableConstantsUnionSet(1);
        error = error + (yEstimate - y)^2;
    end
    totalError = sqrt(error/numberOfDataPoints);
    
    fitness = 1/totalError;
    if length(chromosome) > maximumLengthOfChromosome
        fitness = fitness*lengthViolationPenalty;
    end
   
        
        
            
            
                
            
            
            