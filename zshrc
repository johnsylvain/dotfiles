ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=13
ZSH_THEME="john"
source $ZSH/oh-my-zsh.sh
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export SSH_KEY_PATH="~/.ssh/rsa_id"

export PATH="$PATH:/usr/local/mysql/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="/opt/homebrew/bin:$PATH"

source "$HOME/.zsh_functions"
source "$HOME/.zsh_aliases"
