eval "$(starship init zsh)"
eval "$(fzf --zsh)"

. "$HOME/.local/bin/env"
. "$HOME/.aliases.sh"
. "$HOME/.utils.sh"

. $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$HOME/go/bin:$PATH"
# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/pariarch/.lmstudio/bin"
# End of LM Studio CLI section
export PATH="/opt/homebrew/opt/php@8.2/bin:$PATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=~/.npm-global/bin:$PATH

# bun completions
[ -s "/Users/pariarch/.bun/_bun" ] && source "/Users/pariarch/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PHPENV_ROOT="$HOME/.phpenv"
export PATH="$PHPENV_ROOT/bin:$PATH"
eval "$(phpenv init -)"
eval "$(zoxide init zsh)"

export EDITOR=nvim
export VISUAL=nvim

# opencode
export PATH=/Users/pariarch/.opencode/bin:$PATH

# edit-command
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line
export EDITOR=nvim
