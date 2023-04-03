function iSelected = TournamentSelect(fitness,tournamentSelect,tournamentSize)
populationSize = size(fitness,1);
iTmp = zeros(tournamentSize,1);

for i = 1:length(iTmp)
    iTmp(i) = 1 + fix(rand*populationSize);
end
r = rand;
if tournamentSelect > r
    if fitness(iTmp(1)) > fitness(iTmp(2))
        iSelected = iTmp(1);
    else 
        iSelected = iTmp(2);
    end
else
    if fitness(iTmp(1)) > fitness(iTmp(2))
        iSelected = iTmp(2);
    else
        iSelected = iTmp(1);
    end
end
end


