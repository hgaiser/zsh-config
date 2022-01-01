#!/bin/zsh

# Tell zsh where to look for our dotfiles.
# By default, Zsh will look for dotfiles in $HOME (and find this file), but
# once $ZDOTDIR is defined, it will start looking in that dir instead.
ZDOTDIR=${XDG_CONFIG_HOME:=~/.config}/zsh
