set terminal pngcairo
set output 'cosine-plot.png'
set title 'Cosine Function'
set xlabel 'T'
set ylabel 'cos(T)'
set xr [0.0:6.29]

# Define custom x-axis tick positions and labels
set xtics ('0' 0, 'pi' pi, '2pi' 2*pi)
set xzeroaxis
plot cos(x) with lines lw 2 linecolor 'blue' title 'cos(T)'at graph 0.85, 0.1