
all: ## hoge
	cat -n res.txt | tr '\t' ' ' > temp.res
	runghc statistician.hs > graph.txt
	gnuplot *.plt

more:
	runghc xDate.hs > xDate.txt

view: ## hoge view
	xdg-open Score-0.png

clean: ## hoge clean
	rm Score-*.png

