%Particle Swarm Optimization%
clc;
clear all;
nBoids = 40; % Number of Boids per variable
nVariables = 2; % Number of variables
varMax = 5;
varMin = -5;
alpha = 0.5;
tolerance = 1e-2;
nIterations = 1000;
inertiaWeight = linspace(3,0.5,nIterations);
timeStep = 1;
c1 = 1.5;
c2 = c1;
maxVelocity = (varMax - varMin)/ timeStep;

particleBestPositions = zeros(nBoids,nVariables);
particleBestScores = inf*ones(nBoids,1);
swarmBestPerformance = inf;
performance = zeros(1,nBoids);
swarmBestPosition = zeros(1,nVariables);
criteria = 1;
nMinima = 4;

% Initialize Positions 
posBoids = zeros(nBoids,nVariables);
for i = 1: length(posBoids)
    posBoids(i,1) = varMin + rand*(varMax-varMin);
    posBoids(i,2) = varMin + rand*(varMax-varMin);
end
% Initialize Velocities
velBoids = zeros(nBoids,nVariables);
for i = 1:length(velBoids)
    velBoids(i,1) = (alpha/timeStep)*(-varMax + 2*rand*varMax);
    velBoids(i,2) = (alpha/timeStep)*(-varMax + 2*rand*varMax);
end

% Evaluating the Function
for n = 1:nMinima
while criteria > tolerance
for j = 2:nIterations

    
for i = 1:nBoids
    xPos = posBoids(i,1);
    yPos = posBoids(i,2);
    performance(i) = (xPos^2 + yPos - 11)^2 + (xPos + yPos^2 - 7)^2;
    if performance(i) < particleBestScores(i)
        particleBestPositions(i,1) = xPos; %x_ij_pb
        particleBestPositions(i,2) = yPos;
        particleBestScores(i) = performance(i);
    end
    if performance(i) < swarmBestPerformance
        swarmBestPosition = posBoids(i,:);
        swarmBestPerformance = performance(i);
    end
end


% Updating Velocities and Positions
for i = 1: nBoids
    q = rand;
    r = rand;
    cognitiveTermX = c1*q*(particleBestPositions(i,1)-posBoids(i,1))/timeStep;
    cognitiveTermY = c1*q*(particleBestPositions(i,2)-posBoids(i,2))/timeStep;
    socialTermX = c2*r*(swarmBestPosition(1) - posBoids(i,1))/timeStep;
    socialTermY = c2*r*(swarmBestPosition(2) - posBoids(i,2))/timeStep;
    velBoids(i,1) = inertiaWeight(j)*velBoids(i,1) + cognitiveTermX + socialTermX;
    velBoids(i,2) = inertiaWeight(j)*velBoids(i,2) + cognitiveTermY + socialTermY;
    if velBoids(i,1) > maxVelocity
        velBoids(i,1) = maxVelocity;
    end
    if velBoids(i,2) > maxVelocity
        velBoids(i,2) = maxVelocity;
    end
end

% Updating Positions
for i = 1:nBoids
    posBoids(i,1) = posBoids(i,1) + velBoids(i,1)*timeStep;
    posBoids(i,2) = posBoids(i,2) + velBoids(i,2)*timeStep;
end

var1error = swarmBestPosition(1)-swarmBestPosition(1);
var2error = swarmBestPosition(2)-swarmBestPosition(2);
criteria = abs(var1error + var2error);
end

if criteria < tolerance
    break
end
end
end
varNames = {'x','y','f'};
T = table(round(swarmBestPosition(1),2),round(swarmBestPosition(2),2),round(swarmBestPerformance,2),'VariableNames',varNames)
[x,y] = meshgrid(-5:.01:5);
z = log(0.01 + (x.^2 + y - 11).^2 + (x + y.^2 - 7).^2);
figure();
contour(x,y,z,20,'HandleVisibility','off');
hold on 
plot(swarmBestPosition(1),swarmBestPosition(2),'r*');
legend('minima');
title('Contour Plot');
