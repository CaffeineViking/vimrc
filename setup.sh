#!/bin/bash
#  setup.sh

mkdir ~/.vim_bundle
mkdir ~/.vim_undodir
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim_bundle/Vundle.vim
vim +PluginInstall +qall
echo "All done! Enjoy!"
gvim
