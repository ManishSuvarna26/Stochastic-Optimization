function nearestNeighbour = GetNextNode(startingCity,visitedCities,cities,cityLocation)
%Getting next node by seeing who is nearest to the startingCity
    nCities = length(cities);
    nearestPathLength = inf;
    nearestNeighbour = 0;
    for i = 1:nCities-1
        x1 = cityLocation(startingCity,1);
        y1 = cityLocation(startingCity,2);
        % Asserting if the node has been visited 
        if ~ismember(cities(i+1),visitedCities)
            x2 = cityLocation(cities(i+1),1);
            y2 = cityLocation(cities(i+1),2);
            nnDistance = sqrt((x2-x1)^2 + (y2-y1)^2);
            if nnDistance < nearestPathLength
                nearestPathLength = nnDistance;
                nearestNeighbour = cities(i+1);
            end
        end
    end
        
         
        
        
   