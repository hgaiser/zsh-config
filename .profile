add_path() {
	for d in "$@"; do
		[ -d "$d" ] || continue
		case ":$PATH:" in
			*":$d:"*) ;;
			::) export PATH="$d" ;;
			*)  export PATH="$d:$PATH" ;;
		esac
	done
}

add_path "$HOME/.local/bin"
add_path "$HOME/.cargo/bin"

if [ -d "$HOME/.npm-packages" ]; then
	export NODE_PATH="$HOME/.npm-packages/lib/node_modules"
fi

export EDITOR=nvim
export PAGER=less
export MANPAGER='nvim +Man!'

export FZF_DEFAULT_COMMAND='rg --files --follow'

[ -f "$HOME/.profile.local" ] && source "$HOME/.profile.local"

# vi: ft=sh
