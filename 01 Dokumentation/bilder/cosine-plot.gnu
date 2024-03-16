set terminal pngcairo
set output 'cosine-plot.png'
set title 'Cosine Function'
set xlabel 't'
set ylabel 'cos(t)'
set xr [0.0:4*pi]

# Define custom x-axis tick positions and labels
set xtics ('0' 0, 'pi' pi, '2pi' 2*pi, '3pi' 3*pi, '4pi' 4*pi)
set xzeroaxis
plot cos(x) with lines lw 2 linecolor 'blue' title 'cos(t)'at graph 0.75, 0.95