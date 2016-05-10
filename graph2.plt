reset

res='res.txt'

set xdata time
set timefmt "%Y/%m/%d_%H:%M:%S"
set xrange ["2014/12/01":"2016/08/01"]


set y2tics

unset key
set grid   lc rgb "white"
set border lc rgb "white"

set obj 1 rect behind from screen 0,screen 0 to screen 1,screen 1 fc rgb '#111111' lw 0
set term pngcairo size 1200,600
set out 'Score-1.png'

p res us 1:0 w l axes x1y2  lc rgb 'gray',\
  res us 1:(stringcolumn(6) eq "h3" ?$2:NaN) w p lc rgb 'yellow' lt 6 ps 3 ,\
  res us 1:(stringcolumn(6) eq "s3" ?$2:NaN) w p lc rgb 'yellow' lt 6 ,\
  res us 1:(stringcolumn(6) eq "h5" ?$2:NaN) w p lc rgb 'blue'   lt 6 ps 3 ,\
  res us 1:(stringcolumn(6) eq "s5" ?$2:NaN) w p lc rgb 'blue'   lt 6 ,\
  res us 1:(stringcolumn(6) eq "h10"?$2:NaN) w p lc rgb 'red'    lt 6 ps 3 ,\
  res us 1:(stringcolumn(6) eq "s10"?$2:NaN) w p lc rgb 'red'    lt 6


set xrange ["2016/04/01":"2016/06/01"]
set out 'Score-2.png'
rep
