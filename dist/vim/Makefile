DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES   := $(shell /bin/ls | sed -e "s/Makefile//")
VIMCONF    := $(shell ls *vimrc)
VIMDIRS    := $(shell ls -F | grep / | sed -e "s/\///g")
DEINCONF   := $(shell ls *.toml)

.PHONY := all deploy init uninstall clean list test help
.DEFAULT_GOAL := help

all:

deploy: ## Create symlink to home directory
	@echo '[Vim] ==> Start to deploy dotfiles to home directory.'
	-@mkdir -p $(HOME)/.vim/dein
	-@mkdir -p $(HOME)/.vim/temp
	-$(foreach val, $(VIMCONF), ln -sfn $(DOTPATH)/$(val) $(HOME)/.$(val);)
	-$(foreach val, $(DEINCONF),ln -sfn $(DOTPATH)/$(val) $(HOME)/.vim/$(val);)
	-$(foreach val, $(VIMDIRS), ln -sfn $(DOTPATH)/$(val) $(HOME)/.vim/$(val);)

list: ## Show dot files in this repository
	-@$(foreach val, $(VIMCONF), echo " * $(val)";)
	-@$(foreach val, $(DEINCONF), echo " * $(val)";)
	-@$(foreach val, $(VIMDIRS), echo " * $(val)";)

init: ## Setup environment settings
	@echo "[Vim] Initialize dotfiles..."
	@../../script/deinstall

uninstall: ## Remove deployed dotfile.
	-@$(foreach val, $(VIMCONF), ../../script/removelink $(DOTPATH)/$(val) $(HOME)/.$(val);)
	-@$(foreach val, $(DEINCONF), ../../script/removelink $(DOTPATH)/$(val) $(HOME)/.vim/$(val);)
	-@$(foreach val, $(VIMDIRS), ../../script/removelink $(DOTPATH)/$(val) $(HOME)/.vim/$(val);)

clean: ## Remove the dot files and this repo
	@echo 'Remove dot files in your home directory...'
	-$(foreach val, $(VIMCONF), rm -vrf $(HOME)/.$(val);)
	-$(foreach val, $(DEINCONF),rm -vrf $(HOME)/.vim/$(val);)
	-$(foreach val, $(VIMDIRS), rm -vrf $(HOME)/.vim/$(val);)
	-rm -vrf $(HOME)/.vim/

test: ## make sure that dotfiles is correst deploy
	-@$(foreach val, $(VIMCONF), ../../script/checkfile $(DOTPATH)/$(val) $(HOME)/.$(val);)
	-@$(foreach val, $(DEINCONF), ../../script/checkfile $(DOTPATH)/$(val) $(HOME)/.vim/$(val);)
	-@$(foreach val, $(VIMDIRS), ../../script/checkfile $(DOTPATH)/$(val) $(HOME)/.vim/$(val);)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
