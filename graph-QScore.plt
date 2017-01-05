reset

unset key
set grid   lc rgb "white"
set border lc rgb "white"

set obj 1 rect behind from screen 0,\
    screen 0 to screen 1,screen 1 fc rgb '#111111' lw 0

set term pngcairo size 1000,1000
set out 'Score-QScore.png'

pf = 'temp-QScore'

set xtic ( \
  '14-3Q' 2014.75,'14-4Q' 2015.00,\
  '15-1Q' 2015.25,'15-2Q' 2015.50,\
  '15-3Q' 2015.75,'15-4Q' 2016.00,\
  '16-1Q' 2016.25,'16-2Q' 2016.50,\
  '16-3Q' 2016.75,'16-4Q' 2017.00)

set xr  [2014.5:2017.25]
set y2r [0:700]
set style fill solid border lc rgb "black"
p pf index 0 us ($1-0.05):3:(0.05) w boxes  axes x1y2 lc rgb '#404000',\
  pf index 1 us ($1+0.00):3:(0.05) w boxes  axes x1y2 lc rgb '#000040',\
  pf index 2 us ($1+0.05):3:(0.05) w boxes  axes x1y2 lc rgb '#400000',\
  pf index 0 us ($1-0.02) :4:5 w er pt 6 lw 2 ps 3 lc rgb 'yellow',\
  pf index 1 us ($1+0.00) :4:5 w er pt 6 lw 2 ps 3 lc rgb 'blue'  ,\
  pf index 2 us ($1+0.02) :4:5 w er pt 6 lw 2 ps 3 lc rgb 'red'


