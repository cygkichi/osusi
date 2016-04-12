#!/bin/zsh

res=etyping.res
nigate=etyping.well
theme=元気の出る言葉

# 引数1 スコア
# 引数2 入力時間(msec)
# 引数3 入力文字数
# 引数4 ミス文字数
# 引数5 WPM
# 引数6 正答率
# 引数7 苦手キー




echo $(date +"%Y %m %d %H %M %S") ${theme} $1 $2 $3 $4 $5 $6 $7 >> $res

tail $res

echo $(grep -v '#' etyping.res|awk '{print $14}') {a..z}|sed -s 's/./& /g'|tr ' ' '\n'|sort|uniq -c|awk '{if($2){print $2,$1-1}}' > WeakKey.dat

grep -v '#' etyping.res|awk '{print $8}'|sort>res.sort






N=2
N0=0
rm backcol.plt
for N1 THEME in $(grep -v '#' etyping.res|awk '{print $7}'|uniq -c)
do
    N1=$(expr $N0 + $N1)
    echo set obj $N rect behind from first ${N0},graph 0 to first ${N1},graph 1 fc rgb \(${N}%2\? \'\#222222\' \: \'\#333333\' \) >> backcol.plt
    N0=$N1
    N=$(expr $N + 1)
done
