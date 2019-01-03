

DOTFILE_DIR=$HOME/dotfiles

for f in $DOTFILE_DIR/.zsh/[0-9]*.(sh|zsh)
do
    source "$f"
done

source $DOTFILE_DIR/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting


# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply
POWERLEVEL9K_MODE='nerdfont-complete'

source $DOTFILE_DIR/.zsh/powerlevel9k/powerlevel9k.zsh-theme
