include ../common/basic.mk
include ../common/target.mk

VIMCONF        := vimrc
VIMDIR         := $(HOME)
VIMCONFPATH    := $(foreach val, $(VIMCONF), $(addsuffix .$(val), $(VIMDIR)/))

XDG_PATH       := $(HOME)/.config
NVIMCONF       := init.vim
NVIMDIR        := $(XDG_PATH)/nvim
NVIMCONFPATH := $(foreach val, $(NVIMCONF), $(addsuffix $(val), $(NVIMDIR)/))

VIMCONFDIR     := $(filter-out $(EXCLUSIONS) $(ADDEXCLUSIONS), $(shell ls -F | grep / | sed -e "s/\///g"))
CONFDIR        := $(HOME)/.vim
VIMCONFDIRPATH := $(foreach val, $(VIMCONFDIR), $(addsuffix $(val), $(CONFDIR)/))

DOTFILES       := $(VIMCONFPATH) $(NVIMCONFPATH) $(VIMCONFDIRPATH)

deploy: ## Create symlink to home directory
	-@echo '[$(TARGET)]    ==> Start to deploy dotfiles to home directory.'
	-@export XDG_CONFIG_HOME=$(XDG_PATH)
	-@mkdir -p $(CONFDIR)/dein
	-@mkdir -p $(CONFDIR)/temp
	@$(foreach val, $(VIMCONF), ln -sfn $(DOTPATH)/$(val) $(VIMDIR)/.$(val) > ../$(ERRFILE) 2>&1;)
	-@echo -n '...'
	@$(foreach val, $(VIMCONFDIR), ln -sfn $(DOTPATH)/$(val) $(CONFDIR)/$(val) > ../$(ERRFILE) 2>&1;)
	-@echo -n '...'
	-@mkdir -p $(XDG_PATH)
	-@ln -s $(CONFDIR) $(NVIMDIR) > ../$(ERRFILE) 2>&1
	-@$(foreach val, $(VIMCONF), ln -sfn $(DOTPATH)/$(val) $(CONFDIR)/$(NVIMCONF) > ../$(ERRFILE) 2>&1;)
	-@echo '...'
	-@rm ../$(ERRFILE)

init: ## Setup environment settings
	-@echo "[$(TARGET)]    ==> Initialize dotfiles."
	-@git clone https://github.com/Shougo/dein.vim.git ~/.vim/repos/github.com/Shougo/dein.vim > ../$(ERRFILE) 2>&1
	-@echo '...'
	-@rm ../$(ERRFILE)

clean: ## Remove the dot files and this repo
	-@echo '[$(TARGET)]    ==> Remove all dotfiles for this package.'
	$(foreach val, $(DOTFILES), rm -vrf $(val);)
	rm -vrf $(NVIMDIR) > ../$(LOGFILE) 2>&1
	rm -vrf $(CONFDIR) > ../$(LOGFILE) 2>&1
	rm ../$(LOGFILE)
