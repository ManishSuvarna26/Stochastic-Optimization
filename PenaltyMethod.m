clear all;
syms x mu;
syms x1 x2


alpha_range = [(0:0.1:1) 2 3 5];
% mu = 1;
x0 = 0;
eta = 0.01;
x0 = sym(zeros(100,1));
 for i = 2:length(x0)
    %mu = alpha_range(1)*mu;
    if 1-x0(i) < 0

        f_approx = @(x) x^2 - x + 1 + mu*(1-x)^2;
    else 
        f_approx = @(x) x^2 - x + 1 ;
    end
    df_approx = matlabFunction(diff(f_approx(x)));
    x0(i) = vpa(x0(i-1) - eta*df_approx(x0(i-1)));
    
    
 end
 
 

