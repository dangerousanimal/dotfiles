# -------------------------------------
# Environment variable
# -------------------------------------
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=/usr/local/bin/vim

# rbenv
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

# golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# wp-cli
export PATH="$HOME/.wp-cli/bin:$PATH"

# postgresql
export PGDATA=/usr/local/var/postgres

# docker
# export DOCKER_HOST=tcp://192.168.59.103:2376
# export DOCKER_CERT_PATH=/Users/hideaki/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1

# direnv
eval "$(direnv hook zsh)"

# -------------------------------------
# zsh options
# -------------------------------------

#for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

## complementation
autoload -U compinit
compinit -u

unsetopt auto_menu

setopt auto_pushd

setopt auto_cd

setopt correct

setopt nobeep

setopt prompt_subst

setopt ignoreeof

setopt no_tify

setopt hist_ignore_dups

# -------------------------------------
# path
# -------------------------------------
typeset -U path cdpath fpath manpath

path=(
    $HOME/bin(N-/)
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    $path
)

# -------------------------------------
# prompt
# -------------------------------------
autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz is-at-least
autoload -Uz vcs_info

zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
precmd () { vcs_info }
PS1='%F{5}[%F{2}%n%F{5}] %F{3}%3~ ${vcs_info_msg_0_}%f%# '

# -------------------------------------
# key binding
# -------------------------------------
bindkey -d
bindkey -e

# -------------------------------------
# edit command line
# -------------------------------------
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line

# -------------------------------------
# alias
# -------------------------------------
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

# ls
alias ls="ls -G" # color for darwin
alias l="ls -la"
alias la="ls -la"
alias l1="ls -1"

# tree
alias tree="tree -NC"

# -------------------------------------
# other settings
# -------------------------------------

# auto enter 'ls' after enter 'cd'
function chpwd() { ls -1 }

# tmuxinator
if [ -f ~/.tmuxinator/tmuxinator.zsh ]; then
  source ~/.tmuxinator/tmuxinator.zsh
fi

# nvm
if [ -f ~/.nvm/nvm.sh ]; then
  source ~/.nvm/nvm.sh
fi
