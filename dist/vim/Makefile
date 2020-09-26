DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES   := $(shell /bin/ls | sed -e "s/Makefile//")
VIMCONF    := $(shell ls *vimrc)
NVIMCONF    := $(shell ls init.vim)
VIMDIRS    := $(shell ls -F | grep / | sed -e "s/\///g")
DEINCONF   := $(shell ls *.toml)
TIMESTAMP  := $(shell date "+%Y%m%d_%H%M%S")
ERRFILE    := error_vim$(TIMESTAMP).log
LOGFILE    := vim$(TIMESTAMP).log

.PHONY := all deploy init uninstall clean list test help
.DEFAULT_GOAL := help

all:
deploy: ## Create symlink to home directory
	-@echo '[Vim]    ==> Start to deploy dotfiles to home directory.'
	-@export XDG_CONFIG_HOME=${HOME}/.config
	-@mkdir -p $(HOME)/.vim/dein
	-@mkdir -p $(HOME)/.vim/temp
	@$(foreach val, $(VIMCONF), ln -sfn $(DOTPATH)/$(val) $(HOME)/.$(val) > ../../$(ERRFILE) 2>&1;)
	-@echo -n '...'
	@$(foreach val, $(DEINCONF),ln -sfn $(DOTPATH)/$(val) $(HOME)/.vim/$(val) > ../../$(ERRFILE) 2>&1;)
	-@echo -n '...'
	@$(foreach val, $(VIMDIRS), ln -sfn $(DOTPATH)/$(val) $(HOME)/.vim/$(val) > ../../$(ERRFILE) 2>&1;)
	-@echo -n '...'
	-@mkdir -p $(HOME)/.config
	@ln -s ${HOME}/.vim ${HOME}/.config/nvim
	@$(foreach val, $(NVIMCONF), ln -sfn $(DOTPATH)/$(val) $(HOME)/.vim/$(val) > ../../$(ERRFILE) 2>&1;)
	-@echo '...'
	-@rm ../../$(ERRFILE)

list: ## Show dot files in this repository
	-@$(foreach val, $(VIMCONF), echo " * $(val)";)
	-@$(foreach val, $(DEINCONF), echo " * $(val)";)
	-@$(foreach val, $(VIMDIRS), echo " * $(val)";)

init: ## Setup environment settings
	-@echo "[Vim]    ==> Initialize dotfiles."
	@../../script/deinstall > ../../$(ERRFILE) 2>&1
	-@echo '...'
	-@rm ../../$(ERRFILE)

uninstall: ## Remove deployed dotfile.
	-@echo '[Vim]    ==> Remove only deployed files.'
	-@$(foreach val, $(VIMCONF), ../../script/removelink $(DOTPATH)/$(val) $(HOME)/.$(val);)
	-@$(foreach val, $(DEINCONF), ../../script/removelink $(DOTPATH)/$(val) $(HOME)/.vim/$(val);)
	-@$(foreach val, $(VIMDIRS), ../../script/removelink $(DOTPATH)/$(val) $(HOME)/.vim/$(val);)

clean: ## Remove the dot files and this repo
	-@echo '[Vim]    ==> Remove all dotfiles for this package.'
	-@$(foreach val, $(VIMCONF), rm -vrf $(HOME)/.$(val) > $(LOGFILE) 2>&1;)
	-@$(foreach val, $(DEINCONF),rm -vrf $(HOME)/.vim/$(val) > $(LOGFILE) 2>&1;)
	-@$(foreach val, $(VIMDIRS), rm -vrf $(HOME)/.vim/$(val) > $(LOGFILE) 2>&1;)
	-@rm -vrf $(HOME)/.vim/ > $(LOGFILE) 2>&1
	-@rm $(LOGFILE)

test: ## make sure that dotfiles is correst deploy
	-@$(foreach val, $(VIMCONF), ../../script/checkfile $(DOTPATH)/$(val) $(HOME)/.$(val);)
	-@$(foreach val, $(DEINCONF), ../../script/checkfile $(DOTPATH)/$(val) $(HOME)/.vim/$(val);)
	-@$(foreach val, $(VIMDIRS), ../../script/checkfile $(DOTPATH)/$(val) $(HOME)/.vim/$(val);)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
