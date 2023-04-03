function DerivativeCoeffs = PolynomialDifferentiation(coefficientsVector,derivativeOrder)

DerivativeCoeffs = zeros(1 , length(coefficientsVector) - derivativeOrder);
k = derivativeOrder;
if (length(coefficientsVector)-1)<k
    error('Error. \n The degree of polynomial must be %d or larger.',k);
else
    for i = 1:length(DerivativeCoeffs)
        DerivativeCoeffs(i) = coefficientsVector(k+i)*(factorial(k+i-1)/factorial(i-1));
    end
end
end
