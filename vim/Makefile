include ../common/basic.mk
include ../common/target.mk

ADDEXCLUSIONS := docs tests
VIMCONF    := $(shell ls *vimrc)
NVIMCONF    := $(shell ls init.vim)
VIMDIRS    := $(filter-out $(EXCLUSIONS) $(ADDEXCLUSIONS), $(shell ls -F | grep / | sed -e "s/\///g"))
DOTFILES   := "$(VIMCONF) $(NVIMCONF) $(VIMDIRS)"


deploy: ## Create symlink to home directory
	-@echo '[$(TARGET)]    ==> Start to deploy dotfiles to home directory.'
	-@export XDG_CONFIG_HOME=${HOME}/.config
	-@mkdir -p $(HOME)/.vim/dein
	-@mkdir -p $(HOME)/.vim/temp
	@$(foreach val, $(VIMCONF), ln -sfn $(DOTPATH)/$(val) $(HOME)/.$(val) > ../$(ERRFILE) 2>&1;)
	-@echo -n '...'
	@$(foreach val, $(VIMDIRS), ln -sfn $(DOTPATH)/$(val) $(HOME)/.vim/$(val) > ../$(ERRFILE) 2>&1;)
	-@echo -n '...'
	-@mkdir -p $(HOME)/.config
	@ln -s ${HOME}/.vim ${HOME}/.config/nvim
	@$(foreach val, $(NVIMCONF), ln -sfn $(DOTPATH)/$(val) $(HOME)/.vim/$(val) > ../$(ERRFILE) 2>&1;)
	-@echo '...'
	-@rm ../$(ERRFILE)

init: ## Setup environment settings
	-@echo "[$(TARGET)]    ==> Initialize dotfiles."
	-@git clone https://github.com/Shougo/dein.vim.git ~/.vim/repos/github.com/Shougo/dein.vim > ../$(ERRFILE) 2>&1
	-@echo '...'
	-@rm ../$(ERRFILE)

clean: ## Remove the dot files and this repo
	-@echo '[$(TARGET)]    ==> Remove all dotfiles for this package.'
	-@$(foreach val, $(VIMCONF), rm -vrf $(HOME)/.$(val) > ../$(LOGFILE) 2>&1;)
	-@$(foreach val, $(VIMDIRS), rm -vrf $(HOME)/.vim/$(val) > ../$(LOGFILE) 2>&1;)
	-@rm -vrf $(HOME)/.vim/ > ../$(LOGFILE) 2>&1
	-@rm ../$(LOGFILE)
