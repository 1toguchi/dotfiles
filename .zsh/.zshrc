export DOTFILE_DIR=$HOME/dotfiles

for f in $DOTFILES/.zsh/[0-9]*.(sh|zsh)
do
    source "$f"
done
