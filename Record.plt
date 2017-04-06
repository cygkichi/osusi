reset

f='Record.txt'

set xdata time
set timefmt "%Y/%m/%d_%H:%M:%S"
set xrange ["2014/11/01":"2017/08/01"]


unset key
set grid   lc rgb "white"
set border lc rgb "white"

set obj 1 rect behind from screen 0,screen 0 to screen 1,screen 1 fc rgb '#111111' lw 0
set term pngcairo size 600,600
set out 'Record.png'

p f index 0 us 1:2 w lp pt 7 ps 2 lw 3 lc rgb "dark-yellow"\
 ,f index 0 us 1:2 w  p pt 7 ps 1 lw 3 lc rgb "#111111"\
 ,f index 1 us 1:2 w lp pt 7 ps 2 lw 3 lc rgb "blue"\
 ,f index 1 us 1:2 w  p pt 7 ps 1 lw 3 lc rgb "#111111"\
 ,f index 2 us 1:2 w lp pt 7 ps 2 lw 3 lc rgb "red"\
 ,f index 2 us 1:2 w  p pt 7 ps 1 lw 3 lc rgb "#111111"\




