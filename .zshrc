export ZSH=/Users/aitorfernandez/.oh-my-zsh

ZSH_THEME="odin"

DEFAULT_USER="aitorfernandez"

plugins=(
  cargo
  git
  zsh-syntax-highlighting
)

if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi

export PATH=$PATH:/usr/local/sbin:$HOME/.cargo/bin

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
