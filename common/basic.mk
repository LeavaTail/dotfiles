DOTPATH     := $(realpath $(dir $(firstword $(MAKEFILE_LIST))))
BASEPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
EXCLUSIONS  := .DS_Store .git .github .gitmodules .travis.yml
TIMESTAMP   := $(shell date "+%Y%m%d_%H%M%S")
TARGET      := $(notdir $(realpath $(dir $(firstword $(MAKEFILE_LIST)))))
ERRFILE     := error_$(TARGET)_$(TIMESTAMP).log
LOGFILE     := log_$(TARGET)_$(TIMESTAMP).log
MAKEFILE    := Makefile

ADDEXCLUSIONS := docs tests scripts

.PHONY := all deploy list init install update uninstall clean pretest test help
.DEFAULT_GOAL := help

all:

deploy: ## Create symbolic link to your local directory.

list: ## Show dot files in this repository

init: ## Setup environment settings

install: ## Run make check, deploy, init

update: ## Fetch changes for this repo

uninstall: ## Remove deployed dotfile.

check: ## Check required package in your system.

clean: ## Remove all dotfiles

pretest: ## Check whether dotfiles was deployed correctly

test: ## Test dotfiles and init script

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
