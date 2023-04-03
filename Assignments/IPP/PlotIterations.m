function graph = PlotIterations(polynomialCoefficients,iterationValues)
    x = (1:0.1:3);
    for i = 1:length(x)
        for j = 1:length(polynomialCoefficients)
            tmpVector(j) = x(i)^(j-1);
            tmpVector_i(j) = iterationValues(i)^(j-1);
        end
        y(i) = polynomialCoefficients*tmpVector';
        y_iteration(i) = polynomialCoefficients*tmpVector_i';
    end
    
    figure()
    plot(x,y);
    hold on
    plot(iterationValues,y_iteration,'bo');
    xlabel('x');
    ylabel('f(x)');
    title('Stationary point of the polynomial by Newton Raphson method');
    
end