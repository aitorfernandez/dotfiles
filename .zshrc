export ZSH=/Users/aitorfernandez/.oh-my-zsh

ZSH_THEME="odin"

DEFAULT_USER="aitorfernandez"

plugins=(
  cargo
  git
  zsh-syntax-highlighting
)

export PATH=$PATH:/usr/local/sbin:$HOME/.cargo/bin

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
