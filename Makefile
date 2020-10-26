PANDOCARG:=-H$(dir $(realpath $(firstword $(MAKEFILE_LIST))))/header.tex --filter pandoc-plot
%.pdf: %.md
		pandoc $< $(PANDOCARG) -o $@

watch-%.pdf: %.md
		entr pandoc $< $(PANDOCARG) -o $@ <<< $<
