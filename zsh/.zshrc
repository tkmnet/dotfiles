# Env
export LANG=en_US.UTF-8
export EDITOR=vim
export PATH=~/bin:$PATH

# Color
autoload -Uz colors
colors

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt share_history
setopt hist_ignore_space
setopt hist_reduce_blanks

# Keybind
bindkey -e

# Prompt
PROMPT="%T %{${fg[green]}%}%n@%m%{${reset_color}%} %c> "
## watch all users (login/logout)
watch="all"

# Comp
zstyle :compinstall filename '/home/takamin/.zshrc'
autoload -Uz compinit
compinit
setopt numeric_glob_sort

# beep
setopt no_beep

# Sharp as Comment
setopt interactive_comments

# Dir
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
cdpath=(~)

