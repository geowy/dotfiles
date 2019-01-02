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

# Hombrew support
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

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
setopt CORRECT
setopt CORRECT_ALL
cdpath=(. ~ ~/Workspace)

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
alias gl='git pull'
alias gp='git push'
alias gpu='git push --set-upstream origin HEAD'
alias gs='git status'

# github aliases
alias gh='hub'
alias ghb='hub browse'
alias ghpr='hub pull-request --browse'

# rails aliases
alias be='bundle exec'
alias beg='bundle exec guard'
alias ber='bundle exec rails'
alias berc='bundle exec rails c'
alias bers='bundle exec rails s'
alias betc='RAILS_ENV=test bundle exec cucumber'
alias betr='RAILS_ENV=test bundle exec rspec'
alias bi='bundle install'

# wag aliases
alias wff='wag get --full --force && wag init --full --force'
alias wiff='wag init --full --force'

# misc aliases
alias e='$EDITOR'
alias q='exit'

# environment variables
export CLICOLOR=1
export EDITOR=nvim

# path
path=(~/Scripts $path)

# completion
autoload -U compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit

# history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# misc
eval "$(rbenv init -)"
source ~/.fzf.zsh
