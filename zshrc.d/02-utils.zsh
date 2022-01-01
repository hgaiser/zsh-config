#!/bin/zsh

# Test if a command exists.
function test_command {
	command -v "$1" > /dev/null
}

# Source a file if it exists.
function try_source {
	[ -f "$1" ] && source "$1"
}
