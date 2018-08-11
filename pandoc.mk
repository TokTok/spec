FORMAT := markdown_github
FORMAT := $(FORMAT)+footnotes
FORMAT := $(FORMAT)+tex_math_dollars
FORMAT := $(FORMAT)-tex_math_single_backslash

PANDOC_ARGS :=			\
	--atx-headers		\
	--columns=79		\
