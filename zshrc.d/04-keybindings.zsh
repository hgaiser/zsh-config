#!/bin/zsh

# Set a bunch of emacs keybindings.
# Why? Because I got used to them :(.
typeset -A key

bindkey -e
bindkey '^[[Z' reverse-menu-complete
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey -s '^[Oo' '/'
bindkey -s '^[Oj' '*'
bindkey -s '^[Om' '-'
bindkey -s '^[Ok' '+'

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Bind up / down key to history substring searching.
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind ^q to remove line and push line after command.
bindkey '^q' push-line-or-edit
