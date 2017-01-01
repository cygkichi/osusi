reset

res='res.txt'

set xdata time
set timefmt "%Y/%m/%d_%H:%M:%S"
set xrange ["2014/12/01":"2017/04/01"]


set y2tics
set y2range [0:]
unset key
set grid   lc rgb "white"
set border lc rgb "white"

set obj 1 rect behind from screen 0,screen 0 to screen 1,screen 1 fc rgb '#111111' lw 0
set term pngcairo size 1200,600
set out 'Score-1.png'
sum10=-1
sum5=-1
sum3=-1
p res us 1:0 w l axes x1y2  lc rgb 'gray',\
  res us 1:((stringcolumn(6) eq "h10"?sum10=sum10+1:0),sum10) w l axes x1y2  lc rgb 'dark-red',\
  res us 1:((stringcolumn(6) eq "h5" ?sum5=sum5+1  :0),sum5)  w l axes x1y2  lc rgb 'dark-blue',\
  res us 1:((stringcolumn(6) eq "h3" ?sum3=sum3+1  :0),sum3)  w l axes x1y2  lc rgb 'dark-yellow',\
  res us 1:( stringcolumn(6) eq "h3" ?$2:NaN) w p lc rgb 'yellow' lt 6 ps 3 ,\
  res us 1:( stringcolumn(6) eq "s3" ?$2:NaN) w p lc rgb 'yellow' lt 6 ,\
  res us 1:( stringcolumn(6) eq "h5" ?$2:NaN) w p lc rgb 'blue'   lt 6 ps 3 ,\
  res us 1:( stringcolumn(6) eq "s5" ?$2:NaN) w p lc rgb 'blue'   lt 6 ,\
  res us 1:( stringcolumn(6) eq "h10"?$2:NaN) w p lc rgb 'red'    lt 6 ps 3 ,\
  res us 1:( stringcolumn(6) eq "s10"?$2:NaN) w p lc rgb 'red'    lt 6

sum10=-1
sum5=-1
sum3=-1

set xrange ["2016/04/01":"2017/04/01"]
set out 'Score-2.png'
rep
