#!/bin/bash
#  setup.sh

HOMEDIR=home
VIMRC=.vimrc
BUNDLE=$HOMEDIR/.vim_bundle
UNDOES=$HOMEDIR/.vim_undoes

mkdir -pv $BUNDLE
mkdir -pv $UNDOES
cp -fv $VIMRC $HOMEDIR/$VIMRC
git clone https://github.com/gmarik/Vundle.vim.git $BUNDLE
vim +PluginInstall +qall
echo "Done! Please enjoy."
