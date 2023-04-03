function pathLength = GetPathLength(path,cityLocation)
pathLength = 0;
nCities = length(path);

for i = 1:nCities-1
        x1 = cityLocation(path(i),1);
        y1 = cityLocation(path(i),2);
        x2 = cityLocation(path(i+1),1);
        y2 = cityLocation(path(i+1),2);
        pathLength = pathLength + sqrt((x2-x1)^2 + (y2-y1)^2);
end
           
       
end