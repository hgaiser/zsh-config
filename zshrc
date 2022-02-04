#!/bin/zsh

# Disable Ctrl-S / Ctrl-Q starting / stopping output signals to the terminal.
stty start undef stop undef

source $HOME/.local/share/zsh/plugins/powerlevel10k/powerlevel10k.plugin.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$HOME/.profile"

for file in $ZDOTDIR/zshrc.d/*.zsh; do
	source $file
done

try_source $HOME/.zshrc.local

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
