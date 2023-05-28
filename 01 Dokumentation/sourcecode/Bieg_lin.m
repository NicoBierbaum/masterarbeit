#Differentialgleichungssystem 1. Ordnung in Matix Form
#lineares RWP

function out = Bieg_lin (x, y)
  q = 500;
  EI = 1500;
  L = 1;
  
  out = [0;-q/2 * (x*(x-L)/EI)] + [0 1; 0 0]*y;
  
endfunction
