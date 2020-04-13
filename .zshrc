HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
KEYTIMEOUT=1 # exit normal mode faster

setopt appendhistory
unsetopt beep
bindkey -v

# disable C-s block
stty -ixon

# fix broken backspace after exiting normal mode
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

# emacs reverse search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

autoload -Uz compinit
compinit

alias l='ls'
alias k='ls'
alias lk='ls'
alias ll='ls -alh'
alias ls='ls --color=auto'

alias q='exit'
alias ':q'='exit'

alias g='git'
alias v='nvim'
alias vim='nvim'

alias i='sudo zypper install --no-recommends'
alias u='sudo zypper remove --clean-deps'

# create a directory and enter it
mkcd(){
	mkdir -p -- "$1" &&
	cd -P -- "$1"
}

# open new terminal with same pwd
clone(){
	DIR=`pwd`
	nohup alacritty --working-directory "$DIR" &>/dev/null &
	disown
}
alias cln="clone"

# wrapper around colorized diff
cdiff(){
	diff "$1" "$2" --color=always | less -R
}

vim_ins="%F{cyan}I%f"
vim_nor="%F{green}N%f"
dir_view="%F{blue}%~%f"

function update_prompt(){
	vim_mode="${${KEYMAP/vicmd/$vim_nor}/(main|viins)/$vim_ins}"
	PS1="╭╼ %B$dir_view%b
╰─┤%B$vim_mode%b├╼ "
}

function zle-line-init zle-keymap-select {
	update_prompt
	zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
