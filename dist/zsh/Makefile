DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES   := $(shell /bin/ls | sed -e "s/Makefile//")
ZDIR       := "${HOME}/.zprezto/runcoms"

.PHONY := all deploy init uninstall clean list test help
.DEFAULT_GOAL := help

all:

deploy: ## Create symlink to home directory
	@echo '[Zsh] ==> Start to deploy dotfiles to home directory.'
	-@git clone --recursive https://github.com/sorin-ionescu/prezto.git "$(HOME)/.zprezto" > /dev/null 2>&1
	@../../script/zinstall
	@patch $(shell readlink -f ~/.zpreztorc) < zprezto.patch

list: ## Show dot files in this repository
	-@$(foreach val, $(filter-out README.md, $(shell ls -F $(ZDIR))), echo " * $(val)";)

uninstall: ## Remove deployed dotfile.
	-@$(foreach val, $(filter-out README.md, $(shell ls -F $(ZDIR))), ../../script/removelink $(ZDIR)/$(val) $(HOME)/.$(val);)

init: ## Setup environment settings
	@echo "[Zsh] Initialize dotfiles..."

clean: ## Remove the dot files and this repo
	@echo 'Remove dot files in your home directory...'
	-rm -vrf $(HOME)/.zsh* $(HOME)/.zlog* $(HOME)/.zpr*
	-rm -vrf $(HOME)/.zprezto

test: ## make sure that dotfiles is correst deploy
	-@$(foreach val, $(filter-out README.md, $(shell ls -F $(ZDIR))), ../../script/checkfile $(ZDIR)/$(val) $(HOME)/.$(val);)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
