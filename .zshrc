for f in $DOTFILE_DIR/.zsh/[0-9]*.(sh|zsh)
do
	source "$f"
done
