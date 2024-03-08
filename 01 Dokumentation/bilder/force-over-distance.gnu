set terminal pngcairo
set output 'force-over-distance.png'
set title 'Function F(z)'
set xlabel 'z'
set ylabel 'F(z)'
set xr [0.0:2*pi]
set clip two
set style fill   pattern 4 border
set key inside left top vertical Left reverse enhanced autotitles nobox
set key noinvert samplen 1 spacing 1 width 0 height 0 
set style function filledcurves y1=0
unset colorbox

# Define custom x-axis tick positions and labels
set xtics ('z_0' 0, 'z_o+h' pi, 'z_0' 2*pi)
set ytics ('0' 0, 'F_{max}' 2)

# Define function z(x)
z(x) =  1 + cos(x)

# Plot the function with zebra-style fill
plot z(x) with filledcurves lc rgb "red" title 'F(z)' at graph 0.85, 0.1, \
     z(x) with lines lw 2 lc "red" title 'F(z)' at graph 0.2, 0.95