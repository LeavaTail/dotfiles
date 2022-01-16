include ../common/basic.mk
include ../common/target.mk

DOTFILES   := $(shell /bin/ls | sed -e "s/Makefile//")
CONFDIR    := .emacs.d


deploy: ## Create symlink to home directory
	-@echo '[$(TARGET)]  ==> Start to deploy dotfiles to home directory.'
	-@mkdir -p $(HOME)/$(CONFDIR)/backup
	-@mkdir -p $(HOME)/$(CONFDIR)/swap
	@$(foreach val, $(DOTFILES), ln -sfnv $(DOTPATH)/$(val) $(HOME)/$(CONFDIR)/$(val) > ../$(ERRFILE) 2>&1;)
	-@echo '...'
	-@rm ../$(ERRFILE)

init: ## Setup environment settings
	@:

clean: ## Remove the emacs setting files
	-@echo '[$(TARGET)]  ==> Remove all dotfiles for this package.'
	-@$(foreach val, $(CONFDIR), rm -vrf $(HOME)/$(val) > ../$(LOGFILE) 2>&1;)
	-@rm ../$(LOGFILE)
