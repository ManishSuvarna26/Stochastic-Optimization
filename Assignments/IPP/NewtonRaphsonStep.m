function x_step = NewtonRaphsonStep(x,firstDerivative,secondDerivative)
    x_step = x - (firstDerivative/secondDerivative);
end