INPUTS := $(wildcard *.md)
TARGETS := $(patsubst %.md,html/%.html,$(notdir $(INPUTS)))


# TODO - index and scripts list
all: $(TARGETS)


html/%.html: %.md | html/res
	@pandoc -i $< -o $@ --lua-filter=$(BIN_DIR)/docs_res/links-to-html.lua --template=$(BIN_DIR)/docs_res/template.html --metadata hostname=$(shell hostname) --highlight-style=zenburn 

html:
	@mkdir -p html

html/res: | html
	@cp -r $(BIN_DIR)/docs_res/res html/

clean:
	@rm -rfd html/*.html
	

.PHONY: all clean
