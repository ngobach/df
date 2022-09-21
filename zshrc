__path_add_() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

alias choco="choco.exe"
alias wslexit="wsl.exe -t $WSL_DISTRO_NAME"
alias gmb="gb --sort=-committerdate -vlr \"*/bachngo/*\""

if which vim &> /dev/null; then
	export EDITOR="vim"
fi

if [ -n "$BASH" ]; then
    BASE_DIR="$(dirname "${BASH_SOURCE[0]}")"
elif [ -n "$ZSH_NAME" ]; then
    BASE_DIR="$(dirname "$0")"
else
    BASE_DIR="$HOME/.df"
fi

__path_add_ "$BASE_DIR/bin"

unset BASE_DIR

# vi: ft=sh
