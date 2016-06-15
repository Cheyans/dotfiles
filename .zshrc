# Path to your oh-my-zsh installation.
export ZSH=/home/cheyan/.oh-my-zsh
export MEDIA_DIR=/opt/lecture_viewer/media

export PATH="/home/cheyan/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval "$(thefuck --alias fuck)"

# THEMING STUFF
ZSH_THEME=pygmalion

if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi

plugins=(git docker pyenv tmux)

source $ZSH/oh-my-zsh.sh

eval "$(direnv hook zsh)"

export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="/home/cheyan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

