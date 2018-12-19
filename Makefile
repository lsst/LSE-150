#for dependency you want all tex files  but for acronyms you do not want to include the acronyms file itself.
tex=$(filter-out $(wildcard *acronyms.tex) , $(wildcard *.tex))  


SRC= LSE-150.tex

OBJ=$(SRC:.tex=.pdf)

#Default when you type make
all: $(OBJ)

$(OBJ): $(tex) # for now lander can not do this acronyms.tex
	latexmk -bibtex -xelatex -f $(SRC)

#The generateAcronyms.py  script is in lsst-texmf/bin - put that in the path
acronyms.tex :$(tex) myacronyms.txt
	generateAcronyms.py   $(tex)

clean :
	latexmk -c
	rm *.pdf *.nav *.bbl *.xdv *.snm



