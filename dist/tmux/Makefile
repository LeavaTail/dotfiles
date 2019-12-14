DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES   := $(shell /bin/ls | sed -e "s/Makefile//" | sed -e "s/mini//")
DOTMINI    := $(shell /bin/ls mini | sed -e "s/Makefile//")
TIMESTAMP  := $(shell date "+%Y%m%d_%H%M%S")
ERRFILE    := error_tmux$(TIMESTAMP).log
LOGFILE    := tmux$(TIMESTAMP).log

.PHONY := all deploy init uninstall clean list test help
.DEFAULT_GOAL := help

mini: ## Run deploy with minimal configuration
	-@echo '[tmux]   ==> Start to deploy dotfiles to home directory.'
	@$(foreach val, $(DOTMINI), ln -sfnv $(DOTPATH)/mini/$(val) $(HOME)/.$(val) > ../../$(ERRFILE) 2>&1;)
	-@rm ../../$(ERRFILE)

all:
deploy: ## Create symlink to home directory
	-@echo '[tmux]   ==> Start to deploy dotfiles to home directory.'
	-@git clone --depth=1 https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm > ../../$(ERRFILE) 2>&1
	-@echo -n '...'
	@$(foreach val, $(DOTFILES), ln -sfnv $(DOTPATH)/$(val) $(HOME)/.$(val) > ../../$(ERRFILE) 2>&1;)
	-@echo "..."
	-@rm ../../$(ERRFILE)

list: ## Show dot files in this repository
	-@$(foreach val, $(DOTFILES), echo " * $(val)";)

init: ## Setup environment settings
	-@echo "[tmux]   ==> Initialize dotfiles."
	@$(HOME)/.tmux/plugins/tpm/bin/install_plugins > ../../$(ERRFILE) 2>&1
	-@echo '...'
	-@rm ../../$(ERRFILE)

uninstall: ## Remove deployed dotfile.
	-@echo '[Tmux]   ==> Remove only deployed files.'
	-@$(foreach val, $(DOTFILES), ../../script/removelink $(DOTPATH)/$(val) $(HOME)/.$(val);)

clean: ## Remove the dot files and this repo
	-@echo '[Tmux]   ==> Remove all dotfiles for this package.'
	-@$(foreach val, $(DOTFILES), rm -vrf $(HOME)/.$(val) > $(LOGFILE) 2>&1;)
	-@rm -vrf $(HOME)/.tmux > $(LOGFILE) 2>&1
	-@rm $(LOGFILE)

test: ## make sure that dotfiles is correst deploy
	-@$(foreach val, $(DOTFILES),../../script/checkfile $(DOTPATH)/$(val) $(HOME)/.$(val);)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
