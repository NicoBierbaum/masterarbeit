set terminal pngcairo
set output 'cosine-plot_real.png'
set title 'Function z(t)'
set xlabel 't'
set ylabel 'z(t)'
set xr [0.0:4*pi]
set yr [0.0:1.5]

# Constants
h = 1.0  # Replace with the actual value of h
omega = 1.0  # Replace with the actual value of omega
hat_z = h / 2.0
x_0 = 0.5  # Replace with the actual value of x_0

# Define custom x-axis tick positions and labels
set xtics ('0' 0, 'pi' pi, '2pi' 2*pi, '3pi' 3*pi, '4pi' 4*pi)
set ytics ('0' 0, 'z_0' 0.5, 'z_0+h/2' 1, 'z_0+h' 1.5)

# Define function z(x)
z(x) = x_0 - hat_z * (cos(omega * x) - 1)

plot z(x) with lines lw 2 title 'z(t)'
