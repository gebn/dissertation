all:
	pdflatex dissertation.tex
	biber dissertation.bcf
	pdflatex dissertation.tex
	pdflatex dissertation.tex

clean:
	rm -f *.aux *.bbl *.bcf *.blg *.lof *.log *.out *.toc *.xml
