# LaTeX Thesis Template for the Department of Astronomy & Astrophysics at the University of Toronto

**Note (May 1, 2018):** There are a bunch of convienences that have been introduced in LaTeX/BibTeX since I made this template, most notably the use of ``latexmk`` to simplify the compilation process, making the Makefile here redundant. But all aspects of this template *should* work.

**Last Updated: July 4, 2012 (Mubdi Rahman)**

This template with work for any LaTeX installation in a POSIX
environment (like Linux or Cygwin). It includes the ability to use all
the direct formatting from AASTeX (including macros such as the
deluxetable environment and the like), BibTeX, and includes a couple
of edits to make the final document look a little nicer (in my
opinion), such as changing from the horrendously ugly LaTeX default
font.

The files you'll want to edit are:

1. thesis.tex: Your main thesis file

2. thesiscommands.tex: All the optional latex commands you've defined

3. thesis.bib: Your bibtex file (you can steal the bibtex references
   directly from ADS)

4. Each of the intro/chapter/conclusion files: Where the bulk of your
   material will go

For your convenience there are a few scripts to make your life easier:

1. A Makefile: Just type "make" at the command line and you'll have
   your thesis.pdf file! Type "make clean" and it's all gone again!

2. scripteps2pdf.sh: Since this uses pdflatex for better quality
   output, all figures should be in PDF format. Since the journals
   generally require eps format, this script converts all eps files to
   pdf in each of the chapter subdirectories. From the command line,
   type in:
   ```
   ./scripteps2pdf.sh  
   ```
   
## Important Notes: 

- Bibtex will barf if you don't have any citations in the file (and it
  will refuse to let the makefile make anything.) Make sure you have
  at least one citation in to make sure it is successful.

- For those of you using git for version control, I do have a
  .gitignore file as well to make your lives easier. Just ask me for
  it.
