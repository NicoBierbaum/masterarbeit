#Differentialgleichungssystem 1. Ordnung in Matix Form
#nichtlineares RWP

function out = Bieg_nonlin (x, y)
  
  q = 500;
  EI = 1500;
  L = 1;
  
  out = [0;-q/2 * (x*(x-L)/EI)*(1+y(2)^2)^(3/2)] + [0 1; 0 0]*y;
  

endfunction
