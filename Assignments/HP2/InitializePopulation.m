function population = InitializePopulation(populationSize,nGenes)
% nGenes is number of CIties
    population = zeros(populationSize,nGenes);
  
    for i = 1:populationSize
        population(i,:) = randperm(nGenes);
    end
end
          