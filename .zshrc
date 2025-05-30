############################################################################################
# Default zshrc
############################################################################################
# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

############################################################################################
# Customizations
############################################################################################
export EDITOR="vim"
export PATH=$PATH:$HOME/.local/bin

alias la="ls -lah"

alias l="eza --long --all --smart-group --git --time-style=relative"
alias lf="eza --long --all --smart-group --git --time-style=long-iso"
alias ll="eza --oneline"
alias gr="eza --long --git-repos --no-user --no-filesize --no-time --no-permissions"

# Direnv (conditional env vars): https://direnv.net
eval "$(direnv hook zsh)"

# Oh-my-posh (shell prompt): https://ohmyposh.dev
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/rkt.omp.toml)"

# Configure zsh to recognize symbols as word characters to allow alt+left and alt+right to jump by word even in paths
# See: https://github.com/kovidgoyal/kitty/issues/838#issuecomment-2303988124
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'
