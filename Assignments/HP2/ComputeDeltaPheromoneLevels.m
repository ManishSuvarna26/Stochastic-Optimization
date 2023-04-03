function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,  pathLengthCollection)
    
    
    nCities = size(pathCollection, 2) - 1;
    deltaPheromoneLevel = zeros(nCities);
    nPaths = size(pathCollection, 1);
    
    for k = 1:nPaths
        edges = zeros(nCities);
        pathTaken = pathCollection(k, :);
        lengthOfPathTaken = pathLengthCollection(k);
        nCitiesInPathTaken = size(pathTaken, 2);
        for i = 1:nCitiesInPathTaken - 1
            startingCity = pathTaken(i);
            destinationCity = pathTaken(i + 1);
            edges(startingCity, destinationCity) = 1;
            edges(startingCity, destinationCity) = 1;
        end
        for i = 1:nCities
            for j = i+1:nCities
                if edges(i, j) == 1
                    deltaPheromoneLevel(i, j) = deltaPheromoneLevel(i, j) + 1 / lengthOfPathTaken;
                    deltaPheromoneLevel(j, i) = deltaPheromoneLevel(i, j);
                end
            end
        end
    end
end