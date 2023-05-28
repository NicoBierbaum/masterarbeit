#Nicht-Lineares Schiessverfahren
# Aufbauend auf dem Beispiel des beidseitig aufliegenden Balkens
# 


clear all
clc

# Variablen
#   Physikalische Variablen zu aendern in der Funktion
q = 500;
EI = 1500;
L = 1;

#   Mathematische Variablen
a = 0;
b = L;
beta1 = 0;
beta2 = 0;

#   Numerische Variablen

z1 = -0.3;  #Schiesswert 1
z2 =  0.2;  #Schiesswert 2

epsilon = 1.0e-6; #Toleranzschwelle fuer "passenden" Wert

options = odeset('InitialStep', 0.01,'MaxStep', 0.02, ...
                 'RelTol', epsilon, 'AbsTol', epsilon);
                 
beta = 3;

# Berechnung erste Iteration
  ya1 = [beta1; z1];
  [t_v,v] = ode45(@Bieg_nonlin,[a,b],ya1,options);
  
  ya2 = [beta1; z2];
  [t_w,w] = ode45(@Bieg_nonlin,[a,b],ya2,options);
  
# Grafische Darstellung
figure
diagramm=plot(t_v,v(:,1));
xlabel('x / Laenge des Balkens')
ylabel('Durchbiegung')
xlim([0,1])
ylim([-0.05, 0.05])
hold

# iteratives Verfahren 
  
while abs(beta - beta2) > epsilon
  vL = length(v);  
  wL = length(w);
  
  yb1 =v(vL,1)-beta2;
  yb2 =w(wL,1)-beta2;
  
    if yb1*yb2 <0 # Nullstelle im Intervall
      z = 0.5 * (z1+z2);
      ya3 = [a,z];
      [t_u,u] = ode45(@Bieg_nonlin,[a,b],ya3,options);
        uL = length(u);
        if (u(uL,1) - beta2)*yb1 < 0
          z2 = z;
          t_w = t_u;
          w = u;
        else
          z1 = z;
          t_v = t_u;
          v = u;
        endif
    else        # Nullstelle ausserhalb des Intervalls      
      z=z1-yb1*(z2-z1)/(w(wL,1)-v(vL,1));
      z2 = z;
      ya3 = [a,z];
      [t_u,u] = ode45(@Bieg_nonlin,[a,b],ya3,options);
      uL = length(u);
      t_w,w = t_u,u;      
    endif
    
    # Darstellung der Steigung
    fprintf('Aktueller Steigungswert z: %d\n',z);
    # Aktualisieren der Grafischen Darstellung mit Iterationswerten
##    set(p,'xdata', t_u,'ydata',u(:,1));
##     drawnow
     
    diagramm=plot(t_u,u(:,1));
     pause(2)
    # Abbruchkriterium
        beta = u(uL,1);

  
end
  # Vergleichsdarstellung
  hold
  diagramm=plot(t_u,u(:,1));
  xlabel('x / Laenge des Balkens')
  ylabel('Durchbiegung')
  ylim([-0.005, 0.001])
  yticks(linspace(-0.005,0.001,7))