reset

res='res.txt'
unset key
set grid

#set term pngcairo size 800,400
#set out 'Score.png'



p res us 0:(stringcolumn(6) eq "h3" ?$2:NaN) w p lc rgb 'red'   ,\
  res us 0:(stringcolumn(6) eq "s3" ?$2:NaN) w p lc rgb 'blue'  ,\
  res us 0:(stringcolumn(6) eq "h5" ?$2:NaN) w p lc rgb 'blue'  ,\
  res us 0:(stringcolumn(6) eq "s5" ?$2:NaN) w p lc rgb 'blue'  ,\
  res us 0:(stringcolumn(6) eq "h10"?$2:NaN) w p lc rgb 'black' ,\
  res us 0:(stringcolumn(6) eq "s10"?$2:NaN) w p lc rgb 'black'



