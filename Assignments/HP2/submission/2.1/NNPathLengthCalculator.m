function nnPathLength = NNPathLengthCalculator(cityLocation)

%nn: Nearest Neighbour
clc;

cityLocation = LoadCityLocations();

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
fprintf('The NN pathlength with starting city as %d was found to be %.2f \n',cities(1),nnPathLength);
    
    
    