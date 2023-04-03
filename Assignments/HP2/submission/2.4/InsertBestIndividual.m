function elitePopulation = InsertBestIndividual(population,previousBestIndividual,nCopiesOfBestIndividual)
  population(nCopiesOfBestIndividual).Chromosome = ones(nCopiesOfBestIndividual,1)*previousBestIndividual;
  elitePopulation = population;