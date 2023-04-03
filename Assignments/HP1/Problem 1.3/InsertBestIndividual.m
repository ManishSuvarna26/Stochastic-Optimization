function elitePopulation = InsertBestIndividual(population,previousBestIndividual,nCopiesOfBestIndividual)
  population(nCopiesOfBestIndividual,:) = ones(nCopiesOfBestIndividual,1)*previousBestIndividual;
  elitePopulation = population;
    