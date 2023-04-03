function crossoverPoints = GetCrossingPoints(chromosome)
    crossoverPoints = zeros(2,1);
    numberOfInstructions = length(chromosome)/4;
    

crossoverPoint1 = (1 + fix(rand*(length(chromosome)/4)))*4;
crossoverPoint2 = (1 + fix(rand*(length(chromosome)/4)))*4;
if crossoverPoint1 > crossoverPoint2
    crossoverPoints(1) = crossoverPoint2;
    crossoverPoints(2) = crossoverPoint1;
else
    crossoverPoints(1) = crossoverPoint1;
    crossoverPoints(2) = crossoverPoint2;
end