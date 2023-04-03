function polynomialFunction = Polynomial(x,coefficientsVector)
polynomialFunction = 0;
for i = 1:length(coefficientsVector)
    polynomialFunction = polynomialFunction + coefficientsVector(i)*x^(i-1);
end
end