DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES   := $(shell /bin/ls | sed -e "s/Makefile//")
CONFDIR    := .emacs.d
TIMESTAMP  := $(shell date "+%Y%m%d_%H%M%S")
LOGFILE    := error_emacs$(TIMESTAMP).log

.PHONY := all deploy init uninstall clean list test help
.DEFAULT_GOAL := help

all:

deploy: ## Create symlink to home directory
	-@echo '[emacs] ==> Start to deploy dotfiles to home directory.'
	-@mkdir -p $(HOME)/$(CONFDIR)/backup
	-@mkdir -p $(HOME)/$(CONFDIR)/swap
	@$(foreach val, $(DOTFILES), ln -sfnv $(DOTPATH)/$(val) $(HOME)/$(CONFDIR)/$(val) > ../../$(LOGFILE) 2>&1;)
	-@echo '...'
	-@rm ../../$(LOGFILE)

list: ## Show dot files in this repository
	-@$(foreach val, $(DOTFILES), echo " * $(val)";)

init: ## Setup environment settings
	@echo "[emacs] Initialize dotfiles..."

uninstall: ## Remove deployed dotfile.
	-@$(foreach val, $(DOTFILES), ../../script/removelink $(DOTPATH)/$(val) $(HOME)/$(CONFDIR)/$(val);)

clean: ## Remove the emacs setting files
	@echo 'Remove dot files in your home directory...'
	-$(foreach val, $(CONFDIR), rm -vrf $(HOME)/$(val);)

test: ## Test dotfiles and init script
	-@$(foreach val, $(DOTFILES), ../../script/checkfile $(DOTPATH)/$(val) $(HOME)/$(CONFDIR)/$(val);)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
