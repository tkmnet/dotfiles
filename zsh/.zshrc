# Color
autoload -Uz colors
colors

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Keybind
bindkey -e

# Prompt
PROMPT="%%T {${fg[green]}%}[%n@%m]%{${reset_color}%} %c%# "

# autocomp
zstyle :compinstall filename '/home/takamin/.zshrc'
autoload -Uz compinit
compinit

# beep
setopt no_beep
setopt interactive_comments
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt hist_ignore_all_dups
setopt share_history
setopt hist_ignore_space
setopt hist_reduce_blanks
