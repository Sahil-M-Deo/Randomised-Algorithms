PDF=report
SRCDIR=source files
OUTDIR=../compiler_files

all:
	mkdir -p "$(OUTDIR)"
	cd "$(SRCDIR)" && pdflatex -shell-escape -output-directory="$(OUTDIR)" $(PDF).tex
	cd "$(SRCDIR)" && pdflatex -shell-escape -output-directory="$(OUTDIR)" $(PDF).tex
	mv compiler_files/$(PDF).pdf .

clean:
	rm -f report.pdf
	rm -f compiler_files/*
