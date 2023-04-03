function visibilityMatrix = GetVisibility(cityLocation)
    nCities = length(cityLocation);
    visibilityMatrix = zeros(nCities);
    for i = 1:nCities
        for j = i+1:nCities
            distance = CityLocationDistance(i,j,cityLocation);
            visibility_i_j = 1/distance;
            visibilityMatrix(i,j) = visibility_i_j;
            visibilityMatrix(j,i) = visibilityMatrix(i,j);
        end
    end