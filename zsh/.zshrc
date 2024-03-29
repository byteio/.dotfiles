# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#language settings
export LC_ALL=C 

ZSH_THEME="clean"
COMPLETION_WAITING_DOTS="true"
source $ZSH/oh-my-zsh.sh

alias tma="tmux attach-session -t"
alias tmad="tmux attach-session -dt"
alias tmux="tmux -2 -u"
alias ag="rg -S"
alias vim="nvim"
alias gco="git checkout"
alias gpo="git pull origin $1"
alias vimdiff="nvim -d"

export FZF_BASE=/usr/bin
export PATH=$PATH:/usr/local/go/bin
export EDITOR=/usr/local/bin/vim
export GOPATH=$HOME/projects/go
export GOROOT=/usr/local/go
export TERM=xterm-256color
export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"


#auto ls after a CD
function chpwd() {
    emulate -L zsh
    ls -A
}

# oh-my-zsh plugins
plugins=(git fzf)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#fzf reverse search
[ -f ~/.nix-profile/share/fzf/key-bindings.zsh ] && source ~/.nix-profile/share/fzf/key-bindings.zsh

#fzf tab completion
[ -f ~/.nix-profile/share/fzf-tab/fzf-tab.plugin.zsh ] && source ~/.nix-profile/share/fzf-tab/fzf-tab.plugin.zsh 

# nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export EDITOR=$(which nvim)

eval "$(direnv hook zsh)"
