#!/usr/bin/env fish

alias t 'tmux -u'

alias vim '/usr/local/bin/nvim'
alias v '/usr/local/bin/nvim .'

# List direcory contents
alias l 'ls -la'
alias lsa 'ls -lah'
alias ll 'ls -l'

alias c 'clear'
alias q 'exit'

# Some more alias to avoid making mistakes:
alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'

alias o 'open .'

# Git
alias gtheirs 'git checkout --theirs'
alias gours 'git checkout --ours'

# http://www.jukie.net/bart/blog/pimping-out-git-log
alias glog "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

alias cb 'cargo +nightly bench'
alias cc 'cargo check'
alias ccc 'cargo check && cargo clippy --all-targets --workspace -- -D warnings'
alias cr 'cargo run'
alias ct 'cargo test'
