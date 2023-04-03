function mutatedChromosome = Mutate(chromosome, mutationRate)
    nGenes = length(chromosome);
    mutatedChromosome = chromosome;
    for i = 1:nGenes
        r = rand;
        if r < mutationRate
            mutatedChromosome(i) = 1 - chromosome(i);
        end
    end
end