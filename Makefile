include common/basic.mk

DISTRIBUTION  := tig tmux vim zsh # byobu


all:

deploy: ## Create symbolic link to your local directory.
	@./common/scripts/stashfile.sh ${DISTRIBUTION}
	@$(foreach val, $(DISTRIBUTION), $(MAKE) $@ -C $(val);)

list: ## Show dot files in this repository
	@$(foreach val, $(DISTRIBUTION), $(MAKE) $@ --no-print-directory -C $(val);)

init: ## Setup environment settings
	@$(foreach val, $(DISTRIBUTION), $(MAKE) $@ -C $(val);)

install: check deploy init ## Run make check, deploy, init
	@$(BASEPATH)/scripts/errorlog.sh

update: ## Fetch changes for this repo
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

uninstall: ## Remove deployed dotfile.
	@echo 'Remove deployed dotfile in home directory.'
	@$(foreach val, $(DISTRIBUTION), $(MAKE) $@ -C $(val);)

check: ## Check required package in your system.
	@echo 'Check required package.'
	-@$(BASEPATH)/scripts/checkpackage.sh common
	@$(foreach val, $(DISTRIBUTION), $(MAKE) $@ --no-print-directory -C $(val);)

clean: ## Remove all dotfiles
	@echo 'Remove all dotfiles in home directory.'
	@$(foreach val, $(DISTRIBUTION), $(MAKE) $@ -C $(val);)

test: ## Test dotfiles and init script
	@$(foreach val, $(DISTRIBUTION), $(MAKE) $@ --no-print-directory -C $(val);)
