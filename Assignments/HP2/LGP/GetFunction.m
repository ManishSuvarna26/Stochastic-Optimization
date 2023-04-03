function evaluatedFunction = GetFunction(chromosome,nVariableRegisters,constantRegistersSet,divisionProtection)

    chromosomeLength = length(chromosome);
    
    numberOfGenesPerInstruction =4;
    numberOfConstants = length(constantRegistersSet);
    syms x c1
    % c1 c2 c3 c4 and c5 are the symbolic constants
    variableConstantsUnionSet = sym(zeros(1,(nVariableRegisters + numberOfConstants)));
    variableConstantsUnionSet(1) = x;
    variableConstantsUnionSet(nVariableRegisters+1:end) = c1;
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
    y = variableConstantsUnionSet(1);
    evaluatedFunction = (simplify(y));
 
end


        
            
            
                
            
            
            