function mutatedChromosome = Mutate(chromosome, mutationRate)
    nCities = size(chromosome,2);
    mutatedChromosome = chromosome;
    
    for i = 1:nCities
        r = rand;
        %disp(swapCity);
        if r < mutationRate
            swapCity = 1 + fix(rand*(nCities-1));
            mutatedChromosome([i swapCity]) = mutatedChromosome([swapCity i]);
        end
        
    end
end