function x = NewtonRaphson(polynomialCoefficients, startingPoint, tolerance)

    numberIterations = 21;
    x = zeros(1,numberIterations);
    x(1) = startingPoint;
    firstDerivativeCoeffs = PolynomialDifferentiation(polynomialCoefficients,1);
    secondDerivativeCoeffs = PolynomialDifferentiation(polynomialCoefficients,2);
   
    for i = 2:numberIterations
        if abs(x(i) - x(i-1)) > tolerance
            for j = 1:length(firstDerivativeCoeffs)
                tmpVector1(j) = x(i-1)^(j-1);
            end
            for k = 1:length(secondDerivativeCoeffs)
                tmpVector2(k) = x(i-1)^(k-1);
            end
            firstDerivative = firstDerivativeCoeffs*tmpVector1';
            secondDerivative = secondDerivativeCoeffs*tmpVector2';
            x(i) = NewtonRaphsonStep(x(i-1),firstDerivative,secondDerivative);
        else 
            x(i) = 0;
        end
    end
    
