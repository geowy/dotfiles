# Terminal.app support
if [[ $TERM_PROGRAM == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]] {
  function chpwd {
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
  }
  chpwd
}

# emacs keybindings
bindkey -e

# history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# prompts
PS1='%F{green}%n@%m%f:%F{blue}%~%f%(!.%F{red}.)%#%f '
RPS1='%t'

# gotta go fast
setopt AUTO_CD
setopt EXTENDED_GLOB
cdpath=(. ~ ~/Workspace/src/github.com)

# git aliases
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gaac='git add --all; git commit --verbose'
alias gb='git branch'
alias gbd='git branch --delete'
alias gc='git commit --verbose'
alias gca='git commit --all --verbose'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcof='git checkout --force'
alias gd='git diff'
alias gf='git fetch'
alias gl='git pull'
alias gm='git merge'
alias gma='git merge --abort'
alias gp='git push'
alias gpu='git push --set-upstream origin HEAD'
alias gs='git status'
alias gss='git stash'
alias gssp='git stash pop'

# misc aliases
alias e='$EDITOR'

# environment variables
export CLICOLOR=1
export EDITOR=nvim
export GOPATH="$HOME/Workspace"

# path
path=(~/Scripts ~/Workspace/bin $path)

# completion
autoload -U compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit

# history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# misc
source ~/.fzf.zsh

# tool config
export BAT_THEME='ansi-light'
alias swag=~/Workspace/src/github.com/agworld/swag/swag
eval "$(opam env)"
eval "$(rbenv init -)"
