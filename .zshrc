## == Variables
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# THEMING STUFF
ZSH_THEME=pygmalion
HIST_STAMPS="%d/%m/%y %T"
RPROMPT="[%D{%f/%m/%y} | %D{%L:%M:%S}]"

# Re-attach to existing tmux session or create a new one
tmux_initialize () {
    if [[ -z "$TMUX" ]] ;then
        ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
        if [[ -z "$ID" ]] ;then # if not available create a new one
            tmux new-session
        else
            tmux attach-session -t "$ID" # if available attach to it
        fi
    fi
}

plugins=(
  git
  iterm2
  man
  python
  zsh-syntax-highlighting
  zsh-autosuggestions
  z
)

## == Aliases
# Convenience aliases for editing configs
alias ev='vim ~/.vimrc'
alias etmux='vim ~/.tmux.conf'
alias ez='vim ~/.zshrc'
alias eb='vim ~/.bashrc'

source $ZSH/oh-my-zsh.sh
