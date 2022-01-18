include ../common/basic.mk
include ../common/target.mk

TIGCONF      := $(filter-out $(EXCLUSIONS) $(ADDEXCLUSIONS), $(shell /bin/ls | sed -e "s/Makefile//"))
TIGDIR       := $(HOME)
TIGCONFPATH  := $(foreach val, $(TIGCONF), $(addsuffix .$(val), $(TIGDIR)))

DOTFILES     := $(TIGCONFPATH)

deploy: ## Create symlink to home directory
	-@echo '[$(TARGET)]    ==> Start to deploy dotfiles to home directory.'
	@$(foreach val, $(TIGCONF), ln -sfnv $(DOTPATH)/$(val) $(TIGDIR)/.$(val) > ../$(ERRFILE) 2>&1;)
	-@echo '...'
	-@rm ../$(ERRFILE)

init: ## Setup environment settings
	@:

clean: ## Remove the dot files and this repo
	-@echo '[tig]    ==> Remove all dotfiles for this package.'
	-@$(foreach val, $(DOTFILES), rm -vrf $(val) > $(LOGFILE) 2>&1;)
	-@rm $(LOGFILE)

test: pretest ## Test dotfiles and init script
