function x = RunGradientDescent(startingPoint, mu, stepLength, Threshold)
    x = zeros(2,1);
    x(1) = startingPoint(1);
    x(2) = startingPoint(2);
    normGrad = 1;
   

   
    
    while normGrad >= Threshold
          gradient = ComputeGradient(x(1),x(2),mu); 
          x = (x - stepLength*gradient);
          normGrad = norm(gradient,2);
    end
                
               
            
            
   
    
                              
                
            
            
            
     
 
            
             
    
    