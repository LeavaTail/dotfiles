all:

deploy: ## Create symbolic link to your local directory.

list: ## Show dot files in this repository
	-@$(foreach val, $(DOTFILES), echo " * $(val)";)
	@:

init: ## Setup environment settings

install: ## Run make check, deploy, init

update: ## Fetch changes for this repo

uninstall: ## Remove deployed dotfile.
	-@echo '[$(TARGET)]  ==> Remove only deployed files.'
	-@$(foreach val, $(DOTFILES), $(BASEPATH)/scripts/removelink.sh $(val);)

check: ## Check required package in your system.
	-@$(BASEPATH)/scripts/checkpackage.sh $(TARGET)

clean: ## Remove all dotfiles

pretest: ## Test dotfiles and init script
	-@$(foreach val, $(DOTFILES), $(BASEPATH)/scripts/checkfile.sh $(val);)
	@:
