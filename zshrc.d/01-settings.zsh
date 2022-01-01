#!/bin/zsh

HISTFILE=$ZDOTDIR/history
HISTSIZE=100000
SAVEHIST=100000

setopt auto_cd # If the command is a directory name, cd into it.
setopt appendhistory # Append to history, instead of replacing it.
setopt auto_pushd # Make cd push the old directory onto the directory stack.
setopt hist_ignore_dups # Ignore duplicates for history.
setopt menu_complete # On completion, insert the first match right away.
setopt null_glob