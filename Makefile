PAPER = main
TEX = $(wildcard *.tex sections/*.tex)
BIB = bibliography.bib
#FIGS = $(wildcard figures/*.pdf figures/*.png graphs/*.pdf graphs/*.png)

.PHONY: all clean

#$(PAPER).pdf: $(TEX) $(BIB) $(FIGS) jpaper.cls
$(PAPER).pdf: $(TEX) $(BIB) $(FIGS)
	echo $(FIGS)
	pdflatex $(PAPER)
	bibtex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)

clean:
	rm -f *.toc *.gz *.aux *.bbl *.blg *.log *.out sections/*.aux $(PAPER).pdf

# only works on OSX
open: $(PAPER).pdf
	open $(PAPER).pdf
