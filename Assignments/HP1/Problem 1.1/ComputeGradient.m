function gradient = ComputeGradient(x1, x2, mu)
    if  2*x1^2 + x2^2 - 12 >=0
        
        gradient = [4*x1 - 4 + 8*mu*x1*(2*x1^2 + x2^2 - 12);
                    2*x2 + 2 + 4*mu*x2*(2*x1^2 + x2^2 - 12)];
    else
        gradient = [4*x1 - 4;
                    2*x2 + 2];
    end
    