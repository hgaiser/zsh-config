#!/bin/zsh

source "$HOME/.profile"

# Test if a command exists.
function test_command {
	command -v "$1" > /dev/null
}

# {{{ Plugins.

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

# }}}

# {{{ Key bindings.

# Bind up / down key to history substring searching.
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind ^q to remove line and push line after command.
bindkey '^q' push-line-or-edit

# }}}

# {{{ General options.

HISTFILE=$ZDOTDIR/history
HISTSIZE=100000
SAVEHIST=100000

setopt auto_cd # If the command is a directory name, cd into it.
setopt appendhistory # Append to history, instead of replacing it.
setopt auto_pushd # Make cd push the old directory onto the directory stack.
setopt hist_ignore_dups # Ignore duplicates for history.
setopt menu_complete # On completion, insert the first match right away.

# }}}

# {{{ Completion settings.

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

zstyle ':completion:*' auto-description '<%d>'
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format '[%d]'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %l: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %l%s
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle :compinstall filename "$ZDOTDIR/.zshrc"

fpath+=("$HOME/.local/share/zsh/site-functions")
autoload -Uz compinit
compinit

# }}}

# {{{ Starship prompt.

export STARSHIP_CONFIG=$ZDOTDIR/starship.toml
eval "$(starship init zsh)"

# }}}

# {{{ Aliases.

source "$ZDOTDIR/aliases"

# }}}

# {{{ Exa color config.

# Set up additional colors for exa.
EXA_COLORS="uu=0:gu=0:un=33:gn=33"
EXA_COLORS="${EXA_COLORS}:lp=34;1"
EXA_COLORS="${EXA_COLORS}:ur=33:gr=33:tr=33"
EXA_COLORS="${EXA_COLORS}:uw=31:gw=31:tw=32"
EXA_COLORS="${EXA_COLORS}:ue=32:gx=32:tx=32"
EXA_COLORS="${EXA_COLORS}:ux=32;1"

# Highlight READMEs and license files.
EXA_COLORS="${EXA_COLORS}:README=33:README.*=33"
EXA_COLORS="${EXA_COLORS}:LICENSE=33:LICENSE.*=33"
EXA_COLORS="${EXA_COLORS}:COPYING=33:COPYING.*=33"
EXA_COLORS="${EXA_COLORS}:COPYING.LESSER=33:COPYING.LESSER.*=33"

# Build definition files.
EXA_COLORS="${EXA_COLORS}:Makefile=33;1"
EXA_COLORS="${EXA_COLORS}:Cargo.toml=33;1"
EXA_COLORS="${EXA_COLORS}:SConstruct=33;1"
EXA_COLORS="${EXA_COLORS}:CMakeLists.txt=33;1"
EXA_COLORS="${EXA_COLORS}:build.gradle=33;1"
EXA_COLORS="${EXA_COLORS}:Rakefile=33;1"
EXA_COLORS="${EXA_COLORS}:Gruntfile.js=33;1"
EXA_COLORS="${EXA_COLORS}:Gruntfile.coffee=33;1"
EXA_COLORS="${EXA_COLORS}:BUILD=33;1"
EXA_COLORS="${EXA_COLORS}:BUILD.bazel=33;1"
EXA_COLORS="${EXA_COLORS}:WORKSPACE=33;1"
EXA_COLORS="${EXA_COLORS}:build.xml=33;1"
EXA_COLORS="${EXA_COLORS}:package.xml=33;1"
export EXA_COLORS

#

# vim: foldmethod=marker
