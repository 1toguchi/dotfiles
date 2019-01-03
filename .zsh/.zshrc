export TERM="xterm-256color" 

DOTFILE_DIR=$HOME/dotfiles

for f in $DOTFILE_DIR/.zsh/[0-9]*.(sh|zsh)
do
    source "$f"
done

source $DOTFILE_DIR/.zsh/antigen/antigen.zsh
source $DOTFILE_DIR/.zshrc.antigen
source $DOTFILE_DIR/.zsh/powerlevel9k/powerlevel9k.zsh-theme
