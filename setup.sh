#!/bin/bash

DOT_FILES=( .vimrc .vim .tmux.conf .bashrc .bashrc_profile .inputrc )

for file in ${DOT_FILES[@]}
do
    ln -Fiis $HOME/dotfile/$file $HOME/$file
done

