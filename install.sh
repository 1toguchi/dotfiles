#!/bin/bash
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    echo "$f"
    ln -s $HOME/dotfiles/$f $HOME/$f
done

for DOTFILE in `find $HOME/dotfiles/system`
do
  [ -f $DOTFILE ] && source $DOTFILE
done

#source $HOME/dotfiles/system/.env

# .ideavimrc
touch $HOME/.ideavimrc
echo "source $HOME/dotfiles/.vimrc.keymap" >> $HOME/.ideavimrc
source $HOME/dotfiles/.zshrc

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ "$(uname)" == 'Darwin' ]; then
	# MacOS
  OS='Mac'
  # Write Brew cask / Brew install here
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
	# Linux
	OS='Linux'
	# install zsh
	sudo apt-get install zsh -y
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then                                                                                           
	# Windows
  OS='Cygwin'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

# set zsh as default
chsh -s /bin/zsh
/bin/zsh
