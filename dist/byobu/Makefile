DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES   := $(shell /bin/ls | sed -e "s/Makefile//")
TIMESTAMP  := $(shell date "+%Y%m%d_%H%M%S")
ERRFILE    := error_byobu$(TIMESTAMP).log
LOGFILE    := byobu$(TIMESTAMP).log

.PHONY := all deploy init uninstall clean list test help
.DEFAULT_GOAL := help

all:

deploy: ## Create symlink to home directory
	-@echo '[byobu] ==> Start to deploy dotfiles to home directory.'
	-@mkdir -p $(HOME)/.log/byobu
	-@timeout 1 byobu
	@$(foreach val, $(DOTFILES), ln -sfnv $(DOTPATH)/$(val) $(HOME)/.byobu/$(val) > ../../$(ERRFILE) 2>&1;)
	-@echo '...'
	-@rm ../../$(ERRFILE)

list: ## Show dot files in this repository
	-@$(foreach val, $(DOTFILES), echo " * $(val)";)

init: ## Setup environment settings
	@:

uninstall: ## Remove deployed dotfile.
	-@echo '[byobu] ==> Remove only deployed files.'
	-@$(foreach val, $(DOTFILES), ../../script/removelink $(DOTPATH)/$(val) $(HOME)/.byobu/$(val);)

clean: ## Remove the dot files and this repo
	-@echo '[byobu] ==> Remove all dotfiles for this package.'
	-@$(foreach val, $(DOTFILES), rm -vrf $(HOME)/.byobu > $(LOGFILE) 2>&1;)
	-@rm $(LOGFILE)

test: ## make sure that dotfiles is correst deploy
	-@$(foreach val, $(DOTFILES),../../script/checkfile $(DOTPATH)/$(val) $(HOME)/.byobu/$(val);)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
