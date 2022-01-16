include ../common/basic.mk
include ../common/target.mk

ADDEXCLUSIONS := docs tests
DOTFILES      := $(filter-out $(EXCLUSIONS) $(ADDEXCLUSIONS), $(shell /bin/ls | sed -e "s/Makefile//"))


deploy: ## Create symlink to home directory
	-@echo '[$(TARGET)] ==> Start to deploy dotfiles to home directory.'
	-@mkdir -p $(HOME)/.byobu
	@$(foreach val, $(DOTFILES), ln -sfnv $(DOTPATH)/$(val) $(HOME)/.byobu/$(val) > ../$(ERRFILE) 2>&1;)
	-@echo '...'
	-@rm ../$(ERRFILE)

init: ## Setup environment settings
	-@echo '[$(TARGET)] ==> Initial setup'
	-@mkdir -p $(HOME)/.log/byobu
	-@timeout 1 byobu

clean: ## Remove the dot files and this repo
	-@echo '[$(TARGET)] ==> Remove all dotfiles for this package.'
	-@$(foreach val, $(DOTFILES), rm -vrf $(HOME)/.byobu > ../$(LOGFILE) 2>&1;)
	-@rm ../$(LOGFILE)
