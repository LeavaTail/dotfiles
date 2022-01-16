include ../common/basic.mk
include ../common/target.mk

ADDEXCLUSIONS := docs tests
DOTFILES      := $(filter-out $(EXCLUSIONS) $(ADDEXCLUSIONS), $(shell /bin/ls | sed -e "s/Makefile//"))


deploy: ## Create symlink to home directory
	-@echo '[$(TARGET)]    ==> Start to deploy dotfiles to home directory.'
	@$(foreach val, $(DOTFILES), ln -sfnv $(DOTPATH)/$(val) $(HOME)/.$(val) > ../$(ERRFILE) 2>&1;)
	-@echo '...'
	-@ rm ../$(ERRFILE)

init: ## Setup environment settings
	@:

clean: ## Remove the dot files and this repo
	-@echo '[$(TARGET)]    ==> Remove all dotfiles for this package.'
	-@$(foreach val, $(DOTFILES), rm -vrf $(HOME)/.$(val) > ../$(LOGFILE) 2>&1;)
	-@rm ../$(LOGFILE)
