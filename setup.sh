#!/bin/bash

DOT_FILES=( .vimrc .vim .tmux.conf .bashrc .bashrc_profile )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

