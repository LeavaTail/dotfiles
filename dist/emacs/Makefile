DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES   := $(shell /bin/ls | sed -e "s/Makefile//")
CONFDIR    := .emacs.d
TIMESTAMP  := $(shell date "+%Y%m%d_%H%M%S")
ERRFILE    := error_emacs$(TIMESTAMP).log
LOGFILE    := emacs$(TIMESTAMP).log

.PHONY := all deploy init uninstall clean list test help
.DEFAULT_GOAL := help

all:

mini: deploy ## Run deploy with minimal configuration

deploy: ## Create symlink to home directory
	-@echo '[emacs]  ==> Start to deploy dotfiles to home directory.'
	-@mkdir -p $(HOME)/$(CONFDIR)/backup
	-@mkdir -p $(HOME)/$(CONFDIR)/swap
	@$(foreach val, $(DOTFILES), ln -sfnv $(DOTPATH)/$(val) $(HOME)/$(CONFDIR)/$(val) > ../../$(ERRFILE) 2>&1;)
	-@echo '...'
	-@rm ../../$(ERRFILE)

list: ## Show dot files in this repository
	-@$(foreach val, $(DOTFILES), echo " * $(val)";)

init: ## Setup environment settings
	@:

uninstall: ## Remove deployed dotfile.
	-@echo '[emacs]  ==> Remove only deployed files.'
	-@$(foreach val, $(DOTFILES), ../../script/removelink $(DOTPATH)/$(val) $(HOME)/$(CONFDIR)/$(val);)

clean: ## Remove the emacs setting files
	-@echo '[emacs]  ==> Remove all dotfiles for this package.'
	-@$(foreach val, $(CONFDIR), rm -vrf $(HOME)/$(val) > $(LOGFILE) 2>&1;)
	-@rm $(LOGFILE)

test: ## Test dotfiles and init script
	-@$(foreach val, $(DOTFILES), ../../script/checkfile $(DOTPATH)/$(val) $(HOME)/$(CONFDIR)/$(val);)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
