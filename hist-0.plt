reset

unset key
set grid   lc rgb "white"
set border lc rgb "white"

set obj 1 rect behind from screen 0,\
    screen 0 to screen 1,screen 1 fc rgb '#111111' lw 0

pf='hist.dat'

set boxwidth 20
set style fill solid border lc rgb "black"

set size square
set term pngcairo size 1200,1200
set out 'hist-0.png'

p pf index 0 w boxes lc rgb "dark-yellow",\
  pf index 1 w boxes lc rgb "dark-blue",\
  pf index 2 w boxes lc rgb "dark-red"
