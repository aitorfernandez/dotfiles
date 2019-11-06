# List direcory contents
alias l='ls -la'
alias lsa='ls -lah'
alias ll='ls -l'

alias c='clear'
alias q='exit'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Push and pop directories on directory stack
# alias pu='pushd'
# alias po='popd'

# tmux
alias t='TERM=screen-256color-bce tmux -u'
alias tswitch='tmux switch -t'

alias o='open .'

alias v='vim .'

# Git
alias gtheirs='git checkout --theirs'
alias gours='git checkout --ours'
alias gf='git submodule foreach'

# http://www.jukie.net/bart/blog/pimping-out-git-log
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# Python
alias python=python3
alias pip=pip3

alias venv='python -m venv .venv'
alias ac='deactivate &> /dev/null; source .venv/bin/activate'
alias de='deactivate'

# Postgres
alias pstart='pg_ctl -D /usr/local/var/postgres start'
alias pstop='pg_ctl -D /usr/local/var/postgres stop'
alias prestart='pg_ctl -D /usr/local/var/postgres restart'
