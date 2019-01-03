DOTFILE_DIR=$HOME/dotfiles

# theme is written in this file
for f in $DOTFILE_DIR/.zsh/[0-9]*.(sh|zsh)
do
	source "$f"
done

export TERM="xterm-256color"
source $DOTFILE_DIR/.zshrc.antigen
source $DOTFILE_DIR/.zsh

# tmux_automatically_attach attachs tmux session
# automatically when your are in zsh
if [[ -x ~/bin/tmuxx ]]; then
    ./bin/tmuxx
fi
