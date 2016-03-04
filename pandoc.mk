FORMAT := markdown_github
FORMAT := $(FORMAT)-hard_line_breaks
FORMAT := $(FORMAT)-native_spans
FORMAT := $(FORMAT)-raw_html
FORMAT := $(FORMAT)+tex_math_dollars
FORMAT := $(FORMAT)-tex_math_single_backslash

PANDOC_ARGS :=			\
	--no-tex-ligatures	\
	--atx-headers		\
	--columns=79		\
