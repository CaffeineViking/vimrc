#!/bin/bash
#  setup.sh

mkdir ~/.vim_backup
mv ~/.vimrc ~/.vim_backup
mv ~/.vim_bundle ~/.vim_backup/
mv ~/.vim_undodir ~/.vim_backup/
cp ~/.vim_temp/.vimrc ~/

mkdir ~/.vim_bundle
mkdir ~/.vim_undodir
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim_bundle/Vundle.vim
vim +PluginInstall +qall
gvim
