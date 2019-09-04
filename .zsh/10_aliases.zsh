DORFILE_DIR=$HOME/dotfiles


alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
#-----------------------------------------------------
alias ez='exec $SHELL'
alias vz='vim $DOTFILE_DIR/.zshrc'
alias vv='vim $DOTFILE_DIR/.vimrc'
alias viv='vim $DOTFILE_DIR/.ideavimrc'
alias vza='vim $DOTFILE_DIR/.zsh/10_aliases.zsh'
alias vt='vim $DOTFILE_DIR/.tmux.conf'
#-----------------------------------------------------
alias ez='exec $SHELL'
#-----------------------------------------------------
alias st='tmux source-file $DOTFILE_DIR/.tmux.conf'
alias sz='source $DOTFILE_DIR/.zshrc'
#-----------------------------------------------------
#alias ls='ls --color=auto -lh'
alias vzantigen='vim $DOTFILE_DIR/.zshrc.antigen'
#alias tmux='tmux unbind-key C-b && tmux set-option -g prefix C-j && tmux bind-key C-j send-prefix && tmux -a'
alias rm='rm -i'

alias gad='git add .'
alias gcm='git commit -m'
alias gpom='git push origin master'
alias c='clear'
