all:
	pdflatex -shell-escape dissertation.tex
	biber dissertation.bcf
	pdflatex -shell-escape dissertation.tex
	pdflatex -shell-escape dissertation.tex

clean:
	rm -f *.aux *.bbl *.bcf *.blg *.lof *.log *.out *.toc *.xml
