% Problem 1.1 main file

clc;
clear all;
startingPoint = [1;2];
mu = [0,1,10,100,1000];
stepLength = 0.0001;
Threshold = 10^-6;
x = zeros(2,length(mu));
for i = 1:length(mu)

    x(:,i) = RunGradientDescent(startingPoint, mu(i), stepLength, Threshold);
    g(i) = -(1-x(2,i)^2 - x(1,i)^2);
end
varNames = {'mu','x1*','x2*'};
T = table(mu',round(x(1,:)',3),round(x(2,:)',3),'VariableNames',varNames)
