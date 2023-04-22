
################################################################################
# ===================================================================== info = #
################################################################################

# this is a make example and doubles as dot-case installer script

################################################################################
# ============================================================ configuration = #
################################################################################

# ------------------------------------------------------------------ targets ---

# defaults
MENU := all clean test

# helpers
MENU += help readme

# main
MENU += maps website website-develop

# load phony
.PHONY: $(MENU)

# ------------------------------------------------------------ check version ---

# enforce bash version 4+
ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error this make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later. use `brew install make` and run `gmake`)
endif

# ------------------------------------------------------------ settings ----- #

# set default target
.DEFAULT_GOAL := help

# set default shell to run makefile
# SHELL := /bin/bash
# SHELL := /usr/local/bin/bash

# single shell invocation
.ONESHELL:

# add shell flags
# set fast fail so targets fail on error
.SHELLFLAGS := -eu -o pipefail -c
# .SHELLFLAGS = -e

# ---------------------------------------------------- environment variables ---

# load current shell env vars into makefile shell env
export

################################################################################
# ======================================================= makefile functions = #
################################################################################

# note that define can only take single line or rule

define func_print_arrow
	# ==> $(1)
endef

define func_print_header
	# ============================================= ### $(1) ###
endef

define func_check_file_regex
	cat $(1) || grep "$(2)"
endef

define func_check_command
	command -V $(1) || printf "$(2)"
endef

define func_print_tab
	printf "%s\t\t%s\t\t%s\n" $(1) $(2) $(3)
endef

################################################################################
# ===================================================================== main = #
################################################################################

##@ Helpers

help:														## display this help
	@awk 'BEGIN { FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"; } \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2; } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5); } \
		END { printf ""; }' $(MAKEFILE_LIST)

readme:													## show information and notes
	$(call func_print_header,show readme)
	@touch README.md
	@cat README.md

##@ Menu

# core commands

maps:														## build maps to output folder
	# check bash version
	# bash --version
	# building maps
	# dot -Tsvg dotgraph.dot > output.svg
	pushd src/maps
	# generate using mermaid svg
	# mmdc -i example.mmd -o example-mmd.svg
	# generate using graphviz svg
	# dot -Tsvg example.dot > example-dot.svg
	# generate using plantuml svg
	plantuml -tsvg *.puml
	# generate using plantuml ascii
	# plantuml -ttxt example.puml
	popd

website:												## build website to output folder
	# remove old website files
	rm -fr docs
	# build and publish website
	pushd src/website
	hugo
	popd
	cp -r src/website/public docs

website-develop:								## run hugo hot reload locally for development
	# develop website locally
	pushd src/website
	hugo server --disableFastRender
