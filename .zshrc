# Completion setup - optimized
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list ''

autoload -Uz compinit
# Only rebuild daily
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
unsetopt autocd
bindkey -v

# Aliases
alias cd='z'
alias c="clear"
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -a"
alias sp='systemctl suspend'
alias zkw="cd ~/Documents/notes/work && zk"
alias zkp="cd ~/Documents/notes/personal && zk"
alias vim='nvim'

# PNPM (lightweight)
export PNPM_HOME="/home/cian/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

eval "$(starship init zsh)"
source <(fzf --zsh)

# Lazy load heavy tools
export NVM_DIR="$HOME/.nvm"
nvm() {
    unset -f nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
}

zoxide_init() {
    eval "$(zoxide init zsh)"
    unfunction zoxide_init
    unalias z
}
z() { zoxide_init; z "$@"; }

fuck_init() {
    eval "$(thefuck --alias fuck)"
    unfunction fuck_init
}
fuck() { fuck_init; fuck; }

# Plugins 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
