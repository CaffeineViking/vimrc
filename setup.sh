#!/bin/bash
#  setup.sh

$HOMEDIR = ~
$VIMRC = .vimrc
$BUNDLE = $(HOMEDIR)/.vim_bundle
$UNDOES = $(HOMEDIR)/.vim_undoes

mkdir -p $(BUNDLE)
mkdir -p $(UNDOES)
mv -f $(VIMRC) $(HOMEDIR)/$(VIMRC)
git clone https://github.com/gmarik/Vundle.vim.git $(BUNDLE)
vim +PluginInstall +qall
echo "Done! Please enjoy."
