export ZSH=/Users/aitorfernandez/.oh-my-zsh

ZSH_THEME="odin"

DEFAULT_USER="aitorfernandez"

plugins=(
  cargo
  git
  zsh-syntax-highlighting
)

if type ag &> /dev/null; then
  export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore --ignore .git --ignore pkg --ignore bin -g ""'
fi

export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:/usr/local/sbin:$PATH

export GOPATH=$HOME/af/go
export PATH=$GOPATH/bin:$PATH

source $ZSH/oh-my-zsh.sh
