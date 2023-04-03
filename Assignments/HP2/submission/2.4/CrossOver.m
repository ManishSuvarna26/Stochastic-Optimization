function [crossedChromosome1struct, crossedChromosome2struct] = CrossOver(chromosome1, chromosome2)
   
  
    crossingPointsOfChromosome1 = GetCrossingPoints(chromosome1);
    crossingPointsOfChromosome2 = GetCrossingPoints(chromosome2);
    chromosome1Part1 = chromosome1(1:crossingPointsOfChromosome1(1));
    chromosome1Part2 = chromosome1(crossingPointsOfChromosome1(1)+1:crossingPointsOfChromosome1(2));
    chromosome1Part3 = chromosome1(crossingPointsOfChromosome1(2)+1:end);
    chromosome2Part1 = chromosome2(1:crossingPointsOfChromosome2(1));
    chromosome2Part2 = chromosome2(crossingPointsOfChromosome2(1)+1:crossingPointsOfChromosome2(2));
    chromosome2Part3 = chromosome2(crossingPointsOfChromosome2(2)+1:end);
    
    crossedChromosome1 = [chromosome1Part1 chromosome2Part2 chromosome1Part3];
    crossedChromosome1struct = struct('crossedChromosome1',crossedChromosome1);
    crossedChromosome2 = [chromosome2Part1 chromosome1Part2 chromosome2Part3];
    crossedChromosome2struct = struct('crossedChromosome2',crossedChromosome2);
end
        
        
        
        
       