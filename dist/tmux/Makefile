DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES   := $(shell /bin/ls | sed -e "s/Makefile//")
TIMESTAMP  := $(shell date "+%Y%m%d_%H%M%S")
LOGFILE    := error_tmux$(TIMESTAMP).log

.PHONY := all deploy init uninstall clean list test help
.DEFAULT_GOAL := help

all:

deploy: ## Create symlink to home directory
	-@echo '[tmux] ==> Start to deploy dotfiles to home directory.'
	@git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm > ../../$(LOGFILE) 2>&1
	-@echo -n '...'
	@$(foreach val, $(DOTFILES), ln -sfnv $(DOTPATH)/$(val) $(HOME)/.$(val) > ../../$(LOGFILE) 2>&1;)
	-@echo "..."
	-@rm ../../$(LOGFILE)

list: ## Show dot files in this repository
	-@$(foreach val, $(DOTFILES), echo " * $(val)";)

init: ## Setup environment settings
	@echo "[tmux] Initialize dotfiles..."
	$(HOME)/.tmux/plugins/tpm/bin/install_plugins

uninstall: ## Remove deployed dotfile.
	-@$(foreach val, $(DOTFILES), ../../script/removelink $(DOTPATH)/$(val) $(HOME)/.$(val);)

clean: ## Remove the dot files and this repo
	@echo 'Remove dot files in your home directory...'
	-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/.$(val);)
	-rm -vrf $(HOME)/.tmux

test: ## make sure that dotfiles is correst deploy
	-@$(foreach val, $(DOTFILES),../../script/checkfile $(DOTPATH)/$(val) $(HOME)/.$(val);)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
