 % Problem 1.1 main file

clc;
clear all;
startingPoint = [1;-1];
mu = [0,1,10,100,1000];
stepLength = 0.00001;
Threshold = 10^-6;
x = zeros(2,length(mu));
for i = 1:length(mu)

    x(:,i) = RunGradientDescent(startingPoint, mu(i), stepLength, Threshold);
    g(i) = 2*x(1)^2 + x(2)^2 - 12;
end
 
