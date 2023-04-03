function probabilities = GetProbabilities(startingPoint,pheromoneLevel, visibility,alpha,beta,tabuList)
nCities = size(pheromoneLevel,1);
probabilityNumerator = zeros(nCities);
for i = 1:nCities
    for j = i+1:nCities
        probabilityNumerator(i,j) = pheromoneLevel(i,j)^alpha*visibility(i,j)^beta;
        probabilityNumerator(j,i) = probabilityNumerator(i,j);
    end
end
    
probabilities = zeros(1,nCities);
j = startingPoint;
nonTabuListProbabilities = 0;

for i = 1:nCities
    isPaidVisit = tabuList(i) == 1;
    % Add product of tau and eta for nodes unvisited
    if ~isPaidVisit 
        probabilityNum = probabilityNumerator(i,j);
        probabilities(i) = probabilityNum;
        nonTabuListProbabilities = nonTabuListProbabilities + probabilityNum;
    end
end
probabilities = probabilities/nonTabuListProbabilities;
        
        
    

    