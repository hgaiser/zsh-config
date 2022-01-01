#!/bin/zsh

# Location for zsh plugins.
ZPLUGINDIR=$HOME/.local/share/zsh/plugins

# If you want to use zsh_unplugged, you can either copy/paste the plugin-load function
# here, source a Zsh file with the function, or just clone the repo
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
	git clone https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/unplugged.zsh

# List of plugins to install.
plugins=(
	# Automatically suggest commands based on history.
	zsh-users/zsh-autosuggestions
	zsh-users/zsh-history-substring-search

	# A smarter cd.
	rupa/z

	# Syntax highlighting for commands.
	zsh-users/zsh-syntax-highlighting

	# Color settings.
	hgaiser/gruvbox-zsh
)

# Load plugins.
for repo in $plugins; do
	plugin-load https://github.com/${repo}.git
done
unset repo
