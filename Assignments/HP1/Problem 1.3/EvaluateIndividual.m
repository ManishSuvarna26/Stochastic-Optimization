function fitness = EvaluateIndividual(Variables)
    f1 = 1 + (Variables(1) + Variables(2) + 1)^2*(19 - 14*Variables(1) + 3*Variables(1)^2 - 14*Variables(2) + 6*Variables(1)*Variables(2) + 3*Variables(2)^2);
    f2 = 30 + (2*Variables(1) - 3*Variables(2))^2*(18 - 32*Variables(1) + 12*Variables(1)^2 + 48*Variables(2) - 36*Variables(1)*Variables(2) + 27*Variables(2)^2);
    fitness = 1/(f1*f2);