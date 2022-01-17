include ../common/basic.mk
include ../common/target.mk

BYOBUCONF     := $(filter-out $(EXCLUSIONS) $(ADDEXCLUSIONS), $(shell /bin/ls | sed -e "s/Makefile//"))
BYOBUDIR      := $(HOME)/.byobu/
BYOBUCONFPATH := $(foreach val, $(BYOBUCONF), $(addsuffix .$(val), $(BYOBUDIR)))

DOTFILES      := $(BYOBUCONFPATH)

deploy: ## Create symlink to home directory
	-@echo '[$(TARGET)] ==> Start to deploy dotfiles to home directory.'
	-@mkdir -p $(BYOBUDIR)
	@$(foreach val, $(DOTFILES), ln -sfnv $(val) $(BYOBUDIR)$(BYOBUCONF) > ../$(ERRFILE) 2>&1;)
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
