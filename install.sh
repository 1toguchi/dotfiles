#!/bin/bash
git clone https://github.com/zsh-users/antigen.git ~/dotfiles/.zsh/antigen/

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    echo "$f"
    ln -s $HOME/dotfiles/$f $HOME/$f
done

source $HOME/dotfiles/.zshrc
