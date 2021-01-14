DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES   := $(shell /bin/ls | sed -e "s/Makefile//")
ZDIR       := "${HOME}/.zprezto/runcoms"
TIMESTAMP  := $(shell date "+%Y%m%d_%H%M%S")
ERRFILE    := error_zsh$(TIMESTAMP).log
LOGFILE    := zsh$(TIMESTAMP).log

.PHONY := all deploy init uninstall clean list test help
.DEFAULT_GOAL := help

all:
deploy: ## Create symlink to home directory
	-@echo '[zsh]    ==> Start to deploy dotfiles to home directory.'
	-@git clone --recursive --depth=1 -submodules https://github.com/sorin-ionescu/prezto.git "$(HOME)/.zprezto" > ../../$(ERRFILE) 2>&1
	-@ echo -n "..."
	@../../script/zinstall > ../../$(ERRFILE) 2>&1
	-@ echo "..."
	-@rm ../../$(ERRFILE)

list: ## Show dot files in this repository
	-@$(foreach val, $(filter-out README.md, $(shell ls -F $(ZDIR))), echo " * $(val)";)

uninstall: ## Remove deployed dotfile.
	-@echo '[zsh]    ==> Remove only deployed files.'
	-@$(foreach val, $(filter-out README.md, $(shell ls -F $(ZDIR))), ../../script/removelink $(ZDIR)/$(val) $(HOME)/.$(val);)

init: ## Setup environment settings
	-@echo "[zsh]    ==> Initialize dotfiles."
	@patch "$(HOME)/.zprezto/runcoms/zpreztorc" < zprezto.patch > ../../$(ERRFILE) 2>&1
	-@ echo "..."
	-@rm ../../$(ERRFILE)

clean: ## Remove the dot files and this repo
	-@echo '[zsh]    ==> Remove all dotfiles for this package.'
	-@rm -vrf $(HOME)/.zsh* $(HOME)/.zlog* $(HOME)/.zpr* > $(LOGFILE) 2>&1
	-@rm -vrf $(HOME)/.zprezto > $(LOGFILE) 2>&1
	-@rm $(LOGFILE)

test: ## make sure that dotfiles is correst deploy
	-@$(foreach val, $(filter-out README.md, $(shell ls -F $(ZDIR))), ../../script/checkfile $(ZDIR)/$(val) $(HOME)/.$(val);)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
