#!/bin/bash
git clone https://github.com/zsh-users/antigen.git ~/dotfiles/.zsh/antigen/

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    echo "$f"
    ln -s $HOME/dotfiles/$f $HOME/$f
done

# idea vim rc
touch $HOME/.ideavimrc
echo "source $HOME/dotfiles/.vimrc.keymap" >> $HOME/.ideavimrc

source $HOME/dotfiles/.zshrc
