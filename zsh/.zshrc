# Base
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep
zstyle :compinstall filename '/home/sk/.zshrc'

autoload -Uz compinit
compinit

# Suggest
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/plugins/completion.zsh

# Prompt 
# -v is for vim-mode
# -e is for emacs-mode
bindkey -e
source $ZDOTDIR/plugins/prompt.zsh

# Aliases
alias ls='ls --color'
alias python='python3.8'
# Aliases/git
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gr='git branch -r'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'


# Sway
# autoload
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  XKB_DEFAULT_LAYOUT=us exec sway
fi

