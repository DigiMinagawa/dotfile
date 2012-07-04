#!/bin/bash

DOT_FILES=( .vimrc .vim .zshrc .screenrc )

for file in ${DOT_FILES[@]}
do
    ln -Fiis $HOME/dotfile/$file $HOME/$file
done

