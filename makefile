
all: ## hoge
	cat -n res.txt | tr '\t' ' ' > temp.res
	cat res.txt | tr ' ' ',' > res.csv
	python3 susi.py > graph17.txt
	runghc statistician.hs > graph.txt
	runghc stat2.hs > graph-wma.txt
	zsh ./QScore.sh
	gnuplot *.plt
	gnuplot hist*.plt

more:
	runghc xDate.hs > xDate.txt

view: ## hoge view
	xdg-open Score17-1.png

clean: ## hoge clean
	rm Score-*.png

