include pandoc.mk

build: spec.html spec-pandoc.html

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
