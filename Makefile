# Makefile

SUBFILE_NAMES = Problem1 Problem2
SUBFILE_DIRECTORIES = $(addprefix problems/, $(addsuffix /, $(SUBFILE_NAMES)))
SUBFILE_PDFS =   $(join $(SUBFILE_DIRECTORIES), $(addsuffix .pdf, $(SUBFILE_NAMES)))
SUBFILE_TEXS = $(SUBFILE_PDFS:.pdf=.tex)

# Command for latexmk that creates a PDF only
LATEXMK = latexmk -pdf -dvi- -ps- -g

all_pdfs: main.pdf $(SUBFILE_PDFS)
	@echo "Creating docs folder if it doesn't exist"
	mkdir -p ./docs
	find . -path ./docs -prune -o -name "*.pdf" -exec cp {} docs \;

.PHONY: all_pdfs

main.pdf: main.tex $(SUBFILE_TEXS) $(Prob2Dependencies)
	$(LATEXMK) main.tex

# Problem 2
Prob2 = problems/Problem2
Prob2Dependencies = $(Prob2)/images/quadraticFigure.jpg
$(Prob2)/images/quadraticFigure.jpg: $(Prob2)/QuadraticFigureScript.wl
	@echo "Creating images folder if it doesn't exist"
	mkdir -p $(Prob2)/images
	wolframscript -f $(Prob2)/QuadraticFigureScript.wl

$(Prob2)/Problem2.pdf: $(Prob2)/Problem2.tex $(Prob2Dependencies)
	cd $(<D); $(LATEXMK) $(<F)


%.pdf: %.tex
	cd $(<D); $(LATEXMK) $(<F)
