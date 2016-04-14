reset

res='res.txt'

unset key
set grid   lc rgb "white"
set border lc rgb "white"

set obj 1 rect behind from screen 0,\
    screen 0 to screen 1,screen 1 fc rgb '#111111' lw 0

set term pngcairo size 1200,600
set out 'Score-0.png'

x(n)=(int(n/50)*50+25)

p 'temp1' index 0 us (x($1)):3 lw 10 lc rgb 'dark-red'   s u,\
  'temp1' index 1 us (x($1)):3 lw 10 lc rgb 'dark-blue'  s u,\
  'temp1' index 2 us (x($1)):3 lw 10 lc rgb 'dark-green' s u,\
  'temp1' index 3 us (x($1)):3 lw 10 lc rgb 'dark-red'   s u,\
  'temp1' index 4 us (x($1)):3 lw 10 lc rgb 'dark-blue'  s u,\
  'temp1' index 5 us (x($1)):3 lw 10 lc rgb 'dark-green' s u,\
  'temp1' index 0 us 1:3 lc rgb 'red'   ,\
  'temp1' index 1 us 1:3 lc rgb 'blue'  ,\
  'temp1' index 2 us 1:3 lc rgb 'green' ,\
  'temp1' index 3 us 1:3 lc rgb 'red'   ,\
  'temp1' index 4 us 1:3 lc rgb 'blue'  ,\
  'temp1' index 5 us 1:3 lc rgb 'green'

