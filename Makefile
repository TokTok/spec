FONT	:= "sourceserifpro"
COLOR	:= "Blue"

PDF_ARGS :=			\
	--toc			\
	--toc-depth=2		\
	-V geometry:margin=1in	\
	-V fontsize:12pt	\
	-V links-as-notes	\
	-V fontfamily:$(FONT)	\
	-V linkcolor:$(COLOR)	\
	-V urlcolor:$(COLOR)	\

include pandoc.mk

ifneq ($(shell which rustdoc),)
build: spec.html
endif

ifneq ($(shell which pandoc),)
build: spec-pandoc.html
ifneq ($(shell which pdflatex),)
build: spec.pdf
endif
endif

# Generates `spec.html`.
# `rust.css` must be included alongside with `.html` file in order to work.
spec.html: spec.md
	rustdoc --markdown-css rust.css $< -o $(@D)

spec-pandoc.html: spec.md
	pandoc $(PANDOC_ARGS) -f $(FORMAT) -t html5 $< -o $@

check: spec.md .md-style.rb
	mdl -w -s .md-style.rb spec.md

format: spec.md
	pandoc $(PANDOC_ARGS) -f $(FORMAT) -t $(FORMAT) $< -o $<

spec.pdf: spec.md Makefile
	pandoc $(PANDOC_ARGS) $(PDF_ARGS) -f $(FORMAT)+pandoc_title_block -t latex $< -o $@
