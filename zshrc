#!/bin/zsh

source "$HOME/.profile"

for file in $ZDOTDIR/zshrc.d/*.zsh; do
	source $file
done

try_source $HOME/.zshrc.local
