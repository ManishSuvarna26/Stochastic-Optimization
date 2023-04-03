% TestFit.m
clear all;
dataset = LoadFunctionData();
numberOfDataPoints = length(dataset);
xData = dataset(:,1);
yData = dataset(:,2);
bestChromosome = BestChromosome();
chromosomeLength = length(bestChromosome);
nGenesPerInstruction = 4;
nVariableRegisters = 6;
nConstantRegisters = 2;
constantSet = 1;
syms x c1
divisionProtection = 1000;
error = 0;
% Calculating Error for the best chromosome
for k = 1:numberOfDataPoints
        xDataPoint = dataset(k,1);
        yDataPoint = dataset(k,2);
        chromosome = bestChromosome;
        variableConstantsUnionSet = zeros(1,(nVariableRegisters + nConstantRegisters));
        variableConstantsUnionSet(1) = xDataPoint;
        variableConstantsUnionSet(nVariableRegisters+1:end) = constantSet;
        for i = 1:nGenesPerInstruction:chromosomeLength
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
        error = error + (yEstimate - yDataPoint)^2;
end
totalError = sqrt(error/numberOfDataPoints);
fprintf('The RMS error for the best chromosome found is %.3d \n',totalError);

evaluatedFunction = GetFunction(bestChromosome,nVariableRegisters,constantSet,divisionProtection);
functionValue = zeros(1,length(dataset));
f = matlabFunction(evaluatedFunction);
estimatedFunction = (simplifyFraction(f(1,x)));
fprintf('The estimated function was found to be \n %s \n',estimatedFunction);

for i = 1:length(functionValue)
    functionValue(i) = f(constantSet(1),xData(i));
end
figure()
plot(xData,yData,'b');
hold on
plot(xData,functionValue,'r.','linewidth',1.5);
legend('Actual Function','Approximated Function','Location','Best');
title('Test Fit');

    
