# Env
export LANG=en_US.UTF-8
export EDITOR=vim
export PATH=~/bin:$PATH

# Color
autoload -Uz colors
colors

# Keybind
bindkey -e

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt share_history
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_expand
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^[[5~" history-beginning-search-backward-end
bindkey "^[[6~" history-beginning-search-forward-end

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

# Clipboard
if which pbcopy >/dev/null 2>&1 ; then 
    # Mac  
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then 
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then 
    # Cygwin 
    alias -g C='| putclip'
fi

# Alias
alias l=ls
alias :q='fg >& /dev/null ;exit'
alias cd..=cd ..

COLOR_FLAG=`ls --color >& /dev/null && echo -n "--color" || echo -n "-G"`
alias ls="ls -F $COLOR_FLAG"
alias la="ls -AF $COLOR_FLAG"
alias ll="ls -lAF $COLOR_FLAG"

alias gv='gvim'
alias tm='tmux'
alias ssh='ssh -X'

#if ($?TMUX) then
#	alias :q 'tmux detach'
#endif
