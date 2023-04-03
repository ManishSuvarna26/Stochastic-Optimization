function chromosomePair = Cross(chromosome1, chromosome2)
    nGenes = size(chromosome1,2);
    crossoverPoint = 1 + fix(rand*(nGenes-1));
    
    for i = 1:nGenes
        if i <= crossoverPoint
            chromosome1(i) = chromosome1(i);
            chromosome2(i) = chromosome2(i);
        else
            chromosome1(i) = chromosome2(i);
            chromosome2(i) = chromosome1(i);
        end
    end
    chromosomePair = [chromosome1; chromosome2];
    