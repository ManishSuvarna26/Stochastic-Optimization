function nnPathLength = NNPathLengthCalculator(cityLocation)
% Evaluate the D (nnPathLength) in tau0 = N/D
%nn: Nearest Neighbour

numberOfNodes = size(cityLocation,1);    
visitedCities = zeros(1,numberOfNodes);
cities = randperm(numberOfNodes);
startingCity = cities(1);
visitedCities(1) = startingCity;
for i = 1:length(visitedCities)-1
    startingCity = visitedCities(i);
    nearestNeighbour = GetNearestNode(startingCity,visitedCities,cities,cityLocation);
    visitedCities(i+1) = nearestNeighbour;
end
nnPathLength = GetPathLength(visitedCities,cityLocation);
    
    
    