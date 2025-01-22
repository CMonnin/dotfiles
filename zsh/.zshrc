# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list ''
zstyle :compinstall filename '/home/cian/.zshrc'

# commented out the following two lines b/c of the fzf plugin
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# Alias
alias cd='z'
alias c="clear"
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -a"
alias sp='systemctl suspend'



# starship
eval "$(starship init zsh)"

# fzf
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# pnpm
export PNPM_HOME="/home/cian/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
# zoxide
eval "$(zoxide init zsh)"

eval "$(thefuck --alias fuck)"

if ! pgrep -x "picom" > /dev/null
then
  picom -b 
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
