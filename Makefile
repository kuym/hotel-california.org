# How to build:
#
# Requires pug (formerly "jade") Node.js module to build
#   -> Requires Node.js (nodejs.org) and npm (npmjs.com)
#
# To set up:
#   -> install Node.js (nodejs.org)
#
#   -> # npm install pug
#
#   This should create a node_modules directory, which is used by this makefile

JADE = node_modules/.bin/jade
pages = $(patsubst %.pug,%.html,$(shell find * | grep -E ".pug$$"))

.PHONY: site clean

site: $(pages)

%.html: %.pug
	@echo Building $@ from $<...
	@$(JADE) < $< > $@

clean:
	rm $(pages)
