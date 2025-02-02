#          _              
#  _______| |__  _ __ ___ 
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__ 
# /___|___/_| |_|_|  \___|
#                         
# Colors
autoload -U colors && colors
#
# Prompt config
PS1="%B%{$fg[red]%}%n%{$fg[orange]%}@%{$fg[yellow]%}%M %{$fg[green]%}%~%{$reset_color%} $%b "

# History management
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_expire_dups_first

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Disable Ctrl-s from freezing the terminal
stty stop undef
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

autoload -Uz compinit
compinit
# End of lines added by compinstall
setopt COMPLETE_ALIASES

# vi-like menu nagvigation
zstyle ':completion:*' rehash true menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect '\e' send-break

# Aliases
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias grep='grep --color'
alias ip='ip -color=auto'
alias '..'='cd ..'
alias '...'='cd ../..'
alias -- -='cd ~-'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias rename='perl-rename'
alias vim='nvim'
alias sxiv='sxiv -b'
alias msync="rsync -Parvz --delete ~/Musik/all/ root@xandria:~linkai.zhang/Musik/all/"

webm2opus () {
	cd $HOME/Musik/.raw
	for i in *webm; do
		ffmpeg -i $i ${i::-4}opus 
	done
}

# Automatically cd into typed directories
setopt autocd
eval "$(zoxide init --cmd cd zsh)"

source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh

# Autosuggestions from history
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=69,bg=#220022,underline"
bindkey '^J' autosuggest-accept
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^R' history-incremental-search-backward

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
