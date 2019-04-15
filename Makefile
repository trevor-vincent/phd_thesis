#
# Makefile for Thesis
#
# Using AASTex and BibTeX
#

all : thesis.pdf

thesis.pdf : thesis.tex thesis.bib */*.tex 
	pdflatex thesis -file-line-error --synctex=1 $<
	bibtex thesis
	pdflatex thesis -file-line-error --synctex=1 $<
	pdflatex thesis -file-line-error --synctex=1 $<

thesis.dvi : thesis.tex thesis.bib */*.tex 
	latex thesis
	bibtex thesis
	latex thesis
	latex thesis

thesis.ps : thesis.dvi
	dvips thesis

revert_papers :
	cp chap2/chap2_header.tex chap2/chap2.tex
	cp chap3/chap3_header.tex chap3/chap3.tex

clean:
	rm -fr thesis.dvi thesis.ps thesis.pdf thesis.aux thesis.log \
	thesis.lof thesis.lot thesis.toc thesis.blg thesis.bbl */*.aux *~ 
