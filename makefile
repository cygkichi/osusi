
all: ## hoge
	cat -n res.txt | tr '\t' ' ' > temp.res
	runghc statistician.hs > graph.txt
	gnuplot *.plt

clean: ## hoge clean
	rm Score-*.png
