reset

unset key
set grid   lc rgb "white"
set border lc rgb "white"

set obj 1 rect behind from screen 0,\
    screen 0 to screen 1,screen 1 fc rgb '#111111' lw 0

set term pngcairo size 2400,1200
set out 'Score-0.png'

pf = 'graph.txt'

p pf index 6 w l lw 10 lc rgb '#303000' ,\
  pf index 7 w l lw 10 lc rgb '#000030' ,\
  pf index 8 w l lw 10 lc rgb '#300000',\
  pf index 3 w l lw 10 lc rgb '#707000' ,\
  pf index 4 w l lw 10 lc rgb '#000070' ,\
  pf index 5 w l lw 10 lc rgb '#700000',\
  pf index 0 lt 1 lc rgb 'yellow' ,\
  pf index 1 lt 2 lc rgb 'blue' ,\
  pf index 2 lt 3 lc rgb 'red'




set out 'Score-0-2.png'
set xr [1500:]
rep

set out 'Score-0-h3.png'
set xr [1:]
set yr [1000:4000]
rep

set out 'Score-0-2-h3.png'
set xr [1500:]
rep
