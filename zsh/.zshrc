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
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 
setopt hist_ignore_all_dups
setopt share_history
setopt hist_ignore_space
setopt hist_reduce_blanks

# Keybind
bindkey -e

# Prompt
PROMPT="%T %{${fg[green]}%}%n@%m%{${reset_color}%} %c> "
setopt ignore_eof

# Comp
zstyle :compinstall filename '/home/takamin/.zshrc'
autoload -Uz compinit
compinit
setopt numeric_glob_sort
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# beep
setopt no_beep

# Sharp as Comment
setopt interactive_comments

# Dir
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
cdpath=(~)

# Alias
alias l=ls
alias :q='fg >& /dev/null ;exit'
alias cd..=cd ..

COLOR_FLAG=`ls --color >& /dev/null && echo -n "--color" || echo -n "-G"`
alias ls=ls -F $COLOR_FLAG
alias la=ls -AF $COLOR_FLAG
alias ll=ls -lAF $COLOR_FLAG

alias gv=gvim
alias tm=tmux
alias ssh=ssh -X

#if ($?TMUX) then
#	alias :q 'tmux detach'
#endif
