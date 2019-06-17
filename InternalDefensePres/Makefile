SHELL := /bin/bash

# Makefile for papers
PAPER := main

# MANUAL_FIGURES := ./figures/test_example_1_mesh.png ./figures/cube-to-inner.pdf ./figures/cube-to-outer.pdf
# AUTO_FIGURES   := ./figures/test_example_1_u_convergence.pdf ./figures/test_example_1_est_convergence.pdf ./figures/test_example_1_mg_vs_cg.pdf

# .DEFAULT_GOAL := $(PAPER).pdf
.PHONY: all

all: $(PAPER).pdf



# Get References SVN repo if it does not yet exist
References/References.bib:
	if [ ! -d "./References" ]; then \
		mkdir References; \
	fi
	@echo "Checking out *SVN* References repository"
	svn checkout svn+ssh://svn@sxs-archive.tapir.caltech.edu/home/SVNroot/References/trunk References

$(PAPER).pdf: $(PAPER).tex $(AUTO_FIGURES) $(MANUAL_FIGURES) 
	pdflatex -draftmode -file-line-error --synctex=1 $<
	# bibtex $(PAPER)
	pdflatex -draftmode -file-line-error --synctex=1 $<
	pdflatex -file-line-error --synctex=1 $<

# Automatically make pdf files from .gpi (gnuplot) scripts
%.pdf: %.gpi
	gnuplot $<

# Automatically make pdf files from .fig files
%.pdf: %.fig
	fig2mpdf $<

# Automatically make pdf files from .svg files
%.pdf: %.svg
	inkscape -D -z --file=$< --export-pdf=$@

# Automatically make pdf files from .agr files
%.pdf:%.agr
	xmgrace -hardcopy -hdevice EPS -printfile epsfig.eps $<
	epstopdf --outfile=$@ epsfig.eps
	rm -f epsfig.eps

# Automatically make pdf files from .py files
./figures/%.pdf:./scripts/%.py
	python $<

%.pdf:%.py
	python $<

clean:
	@rm -f *.aux
	@rm -f *.out
	@rm -f *.log
	@rm -f *.bbl
	@rm -f *.blg
	@rm -f *.bib
	@rm -f $(AUTO_FIGURES)
	@rm -f $(PAPER).pdf

clean_keep_figure:
	@rm -f *.aux
	@rm -f *.out
	@rm -f *.log
	@rm -f *.bbl
	@rm -f *.blg
	@rm -f *.bib
	@rm -f $(PAPER).pdf	


update_refs: References/References.bib
	cp /home/tvincent/Dropbox/Research/refs.bib ./References/References_Trevor.bib;
	cat References/References_Trevor.bib References/References.bib > References_final0.bib
	cat References_final0.bib References/dg.bib > References_final.bib
	bibtool -s -d References_final.bib -o References_final.bib
	bibtool -s -i References_final.bib -o References_final.bib
