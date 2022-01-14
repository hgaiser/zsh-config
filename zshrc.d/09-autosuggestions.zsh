#!/bin/zsh

# Set autosuggestion strategy to what tab completion would provide.
ZSH_AUTOSUGGEST_STRATEGY=completion

# Make Ctrl+Space the only thing that accepts and fetches new autosuggestions (instead of right arrow).
autosuggest-accept-and-fetch() { zle autosuggest-fetch; zle forward-char }
zle -N autosuggest-accept-and-fetch
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(autosuggest-accept-and-fetch)
bindkey "^@" autosuggest-accept-and-fetch
