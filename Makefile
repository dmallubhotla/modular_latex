# Makefile

SUBFILE_NAMES = Problem1
SUBFILE_DIRECTORIES = $(addprefix problems/, $(addsuffix /, $(SUBFILE_NAMES)))
SUBFILE_PDFS =   $(join $(SUBFILE_DIRECTORIES), $(addsuffix .pdf, $(SUBFILE_NAMES)))
SUBFILE_TEXS = $(SUBFILE_PDFS:.pdf=.tex)

# Command for latexmk that creates a PDF only
LATEXMK = latexmk -pdf -dvi- -ps-

all_pdfs: main.pdf $(SUBFILE_PDFS)
	@echo "Creating docs folder if it doesn't exist"
	mkdir -p ./docs
	find . -path ./docs -prune -o -name "*.pdf" -exec cp {} docs \;

.PHONY: all_pdfs

main.pdf: main.tex $(SUBFILE_TEXS)
	$(LATEXMK) main.tex

%.pdf: %.tex
	cd $(<D); $(LATEXMK) $(<F)
