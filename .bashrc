# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# completion with sudo
complete -cf sudo

# alias
alias ranger='env TERM=xterm-kitty ranger'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cls="clear && printf '\e[3J'"
alias wrt='echo nothing happened'
alias vi='nvim'
alias sshugo='mosh shugo@ctrl-c.club'
alias sshaks='ssh -p 61141 aks@192.168.0.107'
# alias fixwifi='sudo service network-manager restart'
alias fixwifi='sudo systemctl restart NetworkManager'
alias xup='xrdb ~/.Xresources'
alias icat='kitty +kitten icat'
alias makepdf='convert \*.jpg'
alias sudovi='sudo -e'
alias cpick="colorpicker --short --one-shot --preview"

# temp aliases
alias rad='docker run -it arch_devel'
alias gta='cd ~/dev/games/gtavc/ && ./reVC'
alias debian_server='docker run -itp 4567:80 -v "/home/blue/src/projects/local":/var/www/html/local/ debian_server'
alias lofi='mpv --shuffle --ytdl-format=139 https://youtube.com/playlist?list=PL6NdkXsPL07IOu1AZ2Y2lGNYfjDStyT6O'
alias ythigh='mpv --ytdl-format=22 $1'
alias ytmed='mpv --ytdl-format=18 $1' 
alias ytlow='mpv --ytdl-format=395 $1'
alias ytmp3='mpv --ytdl-format=139 $1'
alias sshfs_envs='sshfs shugo@envs.net: ~/src/env/envs-mnt/'

PS1="\e[1;13m\w\e[0m\n$ "
HISTIGNORE="history*:rm*:ls:cls:startx:neofetch*:sshugo*:xup*:gta*:fixwifi*:cmus*:docker:battery:cd ~:sudo apt update:sudo apt upgrade:exit:htop:top:free*:l:ll:cd ~/.all/*:cd ~/.all*:cd .all*:irc:wc:"

# env variables
export PATH=$PATH:/usr/local/go/bin
export TERM=xterm-256color

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
