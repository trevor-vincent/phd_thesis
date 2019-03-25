SHELL := /bin/bash

# Makefile for papers
PAPER := thesis

MANUAL_FIGURES := #./figures/test_example_1_mesh.png ./figures/cube-to-inner.pdf ./figures/cube-to-outer.pdf
AUTO_FIGURES   := #./figures/test_example_1_u_convergence.pdf ./figures/test_example_1_est_convergence.pdf ./figures/test_example_1_mg_vs_cg.pdf

# .DEFAULT_GOAL := $(PAPER).pdf
.PHONY: touchit all

all: touchit $(PAPER).pdf

touchit:
	bash -c "touch $(PAPER).tex"
	rm $(PAPER).bib
	ln -s /home/tvincent/Dropbox/Research/refs.bib $(PAPER).bib

$(PAPER).pdf: $(PAPER).tex
	pdflatex -file-line-error --synctex=1 $<
	bibtex $(PAPER)
	pdflatex -file-line-error --synctex=1 $<
	pdflatex -file-line-error --synctex=1 $<


clean:
	@rm -f *.aux
	@rm -f *.out
	@rm -f *.log
	@rm -f *.bbl
	@rm -f *.blg
	@rm -f *.bib
	@rm -f $(PAPER).pdf

