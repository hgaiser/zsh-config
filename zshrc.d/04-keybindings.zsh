#!/bin/zsh

# Bind up / down key to history substring searching.
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind ^q to remove line and push line after command.
bindkey '^q' push-line-or-edit
