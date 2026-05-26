PDF=report
OUTDIR=latex_files

all:
	mkdir -p $(OUTDIR)
	pdflatex -output-directory=$(OUTDIR) $(PDF).tex
	pdflatex -output-directory=$(OUTDIR) $(PDF).tex
	mv $(OUTDIR)/$(PDF).pdf .

clean:
	rm -rf $(OUTDIR)/*.aux $(OUTDIR)/*.log $(OUTDIR)/*.toc $(OUTDIR)/*.out $(OUTDIR)/*.fls $(OUTDIR)/*.fdb_latexmk $(PDF).pdf