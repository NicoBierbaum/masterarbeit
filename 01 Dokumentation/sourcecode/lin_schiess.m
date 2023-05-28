#Lineares Schiessverfahren
# Aufbauend auf dem Beispiel des beidseitig aufliegenden Balkens
# vereinfacht durch die Annahme eines kleinen Beigemomentes

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

z1 = -0.2;  #Schiesswert 1
z2 =  0.1;  #Schiesswert 2

epsilon = 1.0e-6; #Toleranzschwelle fuer "passenden" Wert

options = odeset('InitialStep', 0.01,'MaxStep', 0.01, ...
                 'RelTol', epsilon, 'AbsTol', epsilon);

# Berechnung
  ya1 = [beta1; z1];
  
  [t_v,v] = ode45(@Bieg_lin,[a,b],ya1,options);
  
  ya2 = [beta1; z2];
  
  [t_w,w] = ode45(@Bieg_lin,[a,b],ya2,options);
  
  vL = length(v);
  wL = length(w);
  
  theta = (beta2 - w(wL,1)) / (v(vL,1) - w(wL,1));
  
  ya3 = theta * v(1,:) + (1-theta) * w(1,:);
  
  [t_u,u] = ode45(@Bieg_lin,[a,b],ya3,options);
  
# Darstellung der Loesung  
figure
  hold;
  
  xlabel('x / Laenge des Balkens')
  ylabel('Durchbiegung')
  xlim([0,1])

  diagramm = plot (t_v,v(:,1),'g');
  diagramm = plot (t_w,w(:,1),'b');
  diagramm = plot (t_u,u(:,1),'r');
  
  pause(10);
  hold;
  diagramm = plot (t_u,u(:,1),'r');
 
# Vergleichsdarstellung 
  xlabel('x / Laenge des Balkens')
  ylabel('Durchbiegung')
  ylim([-0.005, 0.001])
  yticks(linspace(-0.005,0.001,7))
  
