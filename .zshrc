# Path to your oh-my-zsh installation.
ZSH="/Users/alex/.oh-my-zsh"

if [[ ! -d $ZSH ]]; then
  ZSH="/home/alex/.oh-my-zsh"
fi

export ZSH

ZSH_THEME="robbyrussell"

# Case-sensitive completion.
CASE_SENSITIVE="true"

plugins=(git gitfast zsh-autosuggestions zsh-syntax-highlighting sudo rails)

source $ZSH/oh-my-zsh.sh

# Aliases
alias vim='nvim'
alias ezsh='nvim ~/.zshrc'
alias szsh='source ~/.zshrc'

alias lg='lazygit'

alias h='history | grep'
alias cat='bat'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# Git
alias gcod='gco develop'

export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$HOME/scripts:$PATH"

export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/projects/personal/go"

export PATH="$PATH:/Users/alex/.config/v-analyzer/bin/"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
[[ "$PATH" == *"$HOME/bin:"* ]] || export PATH="$HOME/bin:$PATH"
! { which werf | grep -qsE "^/Users/alex/.trdl/"; } && [[ -x "$HOME/bin/trdl" ]] && source $("$HOME/bin/trdl" use werf "2" "stable")
