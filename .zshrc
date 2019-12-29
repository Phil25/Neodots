HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory
unsetopt beep
bindkey -v

# fix broken backspace after exiting normal mode
bindkey "^?" backward-delete-char

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
alias v='vim'

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
	nohup urxvt -cd "$DIR" &>/dev/null &
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
