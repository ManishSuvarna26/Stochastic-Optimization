function pheromoneLevels = InitializePheromoneLevels(numberOfCities,tau0)
pheromoneLevels = (ones(numberOfCities) - eye(numberOfCities))*tau0;
end