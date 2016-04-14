

all:
	sh creatTemp.sh
	gnuplot graph1.plt
	gnuplot graph2.plt


clean:
	rm *.png temp*
