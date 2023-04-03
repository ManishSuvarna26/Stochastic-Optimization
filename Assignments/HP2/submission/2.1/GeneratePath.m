function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
nCities = size(pheromoneLevel,1);
tabuList = zeros(1,nCities);
path = zeros(1,nCities+1);
startingPoint = 1 + fix(rand*nCities);
path(1) = startingPoint;

for i = 2:nCities
    startingPoint = path(i-1);
    % Here I update the Tabu List elements as 1 if its respective index
    % city has been visited by an ant
    tabuList(startingPoint) = 1;
    
    probabilities = GetProbabilities(startingPoint,pheromoneLevel, visibility,alpha,beta,tabuList);
    node = randsample(1:nCities,1,true,probabilities);
    path(i) = node;
    tabuList(node) = 1;
end
path(end) = path(1);