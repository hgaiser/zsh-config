#!/bin/zsh

# Test if a command exists.
function test_command {
	command -v "$1" > /dev/null
}

# Source a file if it exists.
function try_source {
	[ -f "$1" ] && source "$1"
}

# Create a directory and change to it.
function mkd {
	if [ $# -gt 1 ]; then
		echo "Usage: $0 [dir]" >&2
		return 13
	fi
	if [ -z $1 ]; then
		mkd "/tmp/$(date +%F-%H-%M-%S)"
	else
		mkdir -p "$1"
		cd "$1"
	fi
}
