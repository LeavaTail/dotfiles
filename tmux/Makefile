include ../common/basic.mk
include ../common/target.mk

TMUXCONF      := $(filter-out $(EXCLUSIONS) $(ADDEXCLUSIONS), $(shell /bin/ls | sed -e "s/Makefile//"))
TMUXDIR       := $(HOME)/
TMUXCONFPATH  := $(foreach val, $(TMUXCONF), $(addsuffix .$(val), $(TMUXDIR)))

DOTFILES      := $(TMUXCONFPATH)

deploy: ## Create symlink to home directory
	-@echo '[$(TARGET)]   ==> Start to deploy dotfiles to home directory.'
	@$(foreach val, $(TMUXCONF), ln -sfnv $(DOTPATH)/$(val) $(HOME)/.$(val) > ../$(ERRFILE) 2>&1;)
	-@echo "..."
	-@rm ../$(ERRFILE)

init: ## Setup environment settings
	@:

clean: ## Remove the dot files and this repo
	-@echo '[$(TARGET)]   ==> Remove all dotfiles for this package.'
	-@$(foreach val, $(DOTFILES), rm -vrf $(val) > ../$(LOGFILE) 2>&1;)
	-@rm ../$(LOGFILE)

test: pretest ## Test dotfiles and init script
