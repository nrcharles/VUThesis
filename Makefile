#https://gist.github.com/yy/808914
TEX = xelatex -shell-escape -interaction nonstopmode
BIB = bibtex
GS = gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite 

PAPER = thesis
BIBFILE = temp.bib
BUNDLE = workign-thesis.pdf

all: $(PAPER).pdf

view: $(BUNDLE)
	open $(BUNDLE)

spell::
	ispell *.tex

clean::
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof $(PAPER).pdf $(SUPP).pdf $(BUNDLE)

$(PAPER).pdf: $(PAPER).tex $(PAPER).bbl 
	$(TEX) $(PAPER) 
	$(TEX) $(PAPER)

$(PAPER).bbl: $(PAPER).tex 
	$(TEX) $(PAPER)
	$(BIB) $(PAPER)
