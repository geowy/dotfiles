fzf_root=$(nix-store -r "$(which fzf)" 2> /dev/null)
fzf_tools="${fzf_root}/share/fzf"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${fzf_tools}/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${fzf_tools}/key-bindings.zsh"

