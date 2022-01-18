include ../common/basic.mk
include ../common/target.mk

DOTFILES   :=
COMMIT     := 166cbe2fca25319db2551f0cc74a86c93259017d
SHELL       = /bin/bash


deploy: ## Create symlink to home directory
	-@echo '[$(TARGET)]    ==> Start to deploy dotfiles to home directory.'
	-@git clone --recursive -submodules https://github.com/sorin-ionescu/prezto.git "$(HOME)/.zprezto" > ../$(ERRFILE) 2>&1
	-@ echo -n "..."
	-@cd $(HOME)/.zprezto && git checkout $(COMMIT)
	-@ echo -n "..."
	@$(DOTPATH)/scripts/zinstall.sh > ../$(ERRFILE) 2>&1
	-@ echo "..."
	-@rm ../$(ERRFILE)

init: ## Setup environment settings
	-@echo "[$(TARGET)]    ==> Initialize dotfiles."
	@patch "$(HOME)/.zprezto/runcoms/zpreztorc" < zprezto.patch > ../$(ERRFILE) 2>&1
	-@ echo "..."
	-@rm ../$(ERRFILE)

clean: ## Remove the dot files and this repo
	-@echo '[$(TARGET)]    ==> Remove all dotfiles for this package.'
	-@rm -vrf $(HOME)/.zsh* $(HOME)/.zlog* $(HOME)/.zpr* > ../$(LOGFILE) 2>&1
	-@rm -vrf $(HOME)/.zprezto > ../$(LOGFILE) 2>&1
	-@rm ../$(LOGFILE)
