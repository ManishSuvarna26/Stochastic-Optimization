function [fitness,pathLength] = EvaluateIndividual(chromosome,cityPositions)
    nCities = length(chromosome);
    
    % Extracting co-ordinates of the cities as sorted in the chromosome
    % which shows the tour of the salesman and calculating the total
    % co-ordinate distance
    pathLength = 0;
    for i = 1:(nCities-1)
        x1 = cityPositions(chromosome(i),1);
        y1 = cityPositions(chromosome(i),2);
        x2 = cityPositions(chromosome(i+1),1);
        y2 = cityPositions(chromosome(i+1),2);
        pathLength = pathLength + sqrt((x2-x1)^2 + (y2-y1)^2);
    end
    % Adding the return journey if the last city is not the origin city
    if chromosome(nCities) ~= chromosome(1)
        % Origin City Co-ordinates
        x0 = cityPositions(chromosome(1),1); 
        y0 = cityPositions(chromosome(1),2);
        % Last City Co-ordinates
        xLast = cityPositions(chromosome(nCities),1);
        yLast = cityPositions(chromosome(nCities),2);
        returnPathLength = sqrt((x0-xLast)^2 + (y0-yLast)^2);
        pathLength = pathLength + returnPathLength;
    end
    % Fitness value can be set to inverse of total path, which implies that
    % maximum fitness gives shortest path length of the tour.
    fitness = 1/pathLength;
    