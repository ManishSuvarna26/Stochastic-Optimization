function distance = CityLocationDistance(city1,city2,cityLocation)


x1 = cityLocation(city1,1);
y1 = cityLocation(city1,2);
x2 = cityLocation(city2,1);
y2 = cityLocation(city2,2);
distance = sqrt((x2-x1)^2 + (y2-y1)^2);
           
       
