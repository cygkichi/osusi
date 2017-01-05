
rm temp-QScore

for C in h3 h5 h10 s3 s5 s10
do
    for Y in 2014 2015 2016 2017
    for I in 0 1 2 3
    cat res.txt|tr '/_:' '   '|awk '{print $1,int(($2-1)/3),$7,$11}'|awk -v y=$Y -v i=$I -v c=$C '$1==y&&$2==i&&$4==c{n++;sum+=$3;sum2+=$3*$3}END{if(n>0){print y+i/4,c,n,sum/n,sqrt(sum2/n-(sum/n)^2)}}'
    echo
    echo
done>>temp-QScore
