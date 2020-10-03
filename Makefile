
###
# vscode makes
###

VSCODE-EXTENSIONS-PATH:=vscode/vscode-extensions.list

.PHONY: vscode-extensions
vscode-extensions:
	cat $(VSCODE-EXTENSIONS-PATH) | xargs -I {} code --install-extension {}

.PHONY: grab-vscode-extensions
grab-vscode-extensions:
	code --list-extensions > $(VSCODE-EXTENSIONS-PATH)

###
# Initialize MacOS
###

.PHONE: mac
mac: macos_minimal

.PHONY: macos_minimal


###
# dotfiles
###

.PHONY: dotfiles
dotfiles:
	for file in $(shell find $(CURDIR) -type f -iname ".*" -d 1  -not -name ".gitignore" ); do\
		f=$$(basename $$file);\
		echo $$file ;\
		ln -sfn $$file $(HOME)/$$f;\
	done;\

	ln -sfn $(CURDIR)/gitignore $(HOME)/.gitignore;
	ln -sfn $(CURDIR)/gitconfig $(HOME)/.gitconfig;

