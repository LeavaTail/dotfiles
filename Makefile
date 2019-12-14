DOTPATH     := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
EXCLUSIONS  := .DS_Store .git .gitmodules .travis.yml
UNSUPPORTED := vcs
DISTRIBUTION:= dist
DOTDIRS     := $(shell ls -F $(DISTRIBUTION) | grep / | sed -e "s/\///g")
DOTFILES    := $(filter-out $(EXCLUSIONS) $(UNSUPPORTED) , $(DOTDIRS))

.PHONY := all deploy list init install update uninstall clean test help
.DEFAULT_GOAL := help

all:
	
deploy: ## Create symbolic link to your local directory.
	@$(foreach val, $(DOTFILES), $(MAKE) deploy -C $(DISTRIBUTION)/$(val);)

list: ## Show dot files in this repository
	@$(foreach val, $(DOTFILES), $(MAKE) list -C $(DISTRIBUTION)/$(val);)

init: ## Setup environment settings
	@$(foreach val, $(DOTFILES), $(MAKE) init -C $(DISTRIBUTION)/$(val);)

install: check deploy init ## Run make check, deploy, init
	@./script/errorlog

mini-install: mini ## Run deploy with minimal configuration
	@$(foreach val, $(DOTFILES), $(MAKE) init -C $(DISTRIBUTION)/$(val);)

update: ## Fetch changes for this repo
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

uninstall: ## Remove deployed dotfile.
	@echo 'Remove deployed dotfile in home directory.'
	@$(foreach val, $(DOTFILES), $(MAKE) uninstall -C $(DISTRIBUTION)/$(val);)

check: ## Check required package in your system.
	@echo 'Check required package.'
	@./script/checkpackage ./docs/

clean: ## Remove all dotfiles
	@echo 'Remove all dotfiles in home directory.'
	@$(foreach val, $(DOTFILES), $(MAKE) clean -C $(DISTRIBUTION)/$(val);)

test: ## Test dotfiles and init script
	@$(foreach val, $(DOTFILES), $(MAKE) test -C $(DISTRIBUTION)/$(val);)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
