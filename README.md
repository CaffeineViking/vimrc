vimrc
=====

Installation
------------
The shell script snipplet below will download this repository to `~/.vim_temp` and then execute the setup script. This script creates all the necessary folders in your home folder and fetches the required Vundle package manager. Thereafter, the `.vimrc` is moved too (make sure you backup you existing configuration in case you don't like this). It will automatically open vim and start downloading the required packages.

```sh
git clone https://github.com/CaffeineViking/vimrc.git ~/.vim_temp && \
cd ~/.vim_temp && ./setup.sh && rm -rf ~/.vim_temp
```

If the script doesn't work (maybe you are running Windows or OSX) you can just follow the steps below:

1. Remove (backup) your existing .vimrc and related folders from your home directory.
2. Download this repository, just copy over the .vimrc to your home directory.
3. Create two folders, `.vim_bundle` and `.vim_undodir` in your home directory.
5. Fetch the source from the Vundle repository. Put it in `.vim_bundle/Vundle.vim`.
4. Run vim and call `:PluginInstall`.
5. Done! Please enjoy.

Features
--------
* [Vundle](http://github.com/gmarik/vundle): an awesome package manager.
* [NERDTree](https://github.com/scrooloose/nerdtree): fast filesystem browser, see everything!
* [TagBar](https://github.com/majutsushi/tagbar): painless navigation of tags (functions, classes etc...).
* [Fugitive](https://github.com/tpope/vim-fugitive): easily one of the best Git integrators for Vim.
* [YankStack](https://github.com/maxbrunsfeld/vim-yankstack): choose a yank done before... any yank.
* [GUndo](https://github.com/sjl/gundo.vim): graphical visualization of the Vim undo tree and diffs for them.
* [TabLine](https://github.com/mkitt/tabline.vim): improved tab output, no clutter.
* [LightLine](https://github.com/itchyny/lightline.vim): minimal and lightweight statusline/tabline.
* [GruvBox](https://github.com/morhetz/gruvbox): pretty colors.
* No overwritten vim bindings, all key mappings are bound to the leader key.
* Sane defaults for vim: indents, no swap files, persistent undo tree etc...

Bindings
--------
* Disable search highlight (:noh): `<leader>space`
* YankStack: `<leader>y/Y`
* NERDTree: `<leader>n`
* TagBar: `<leader>t`
* GUndo: `<leader>g`

Screenshots
-----------
![vimrc screenshot 1](http://i62.tinypic.com/33l2gbc.png)
![vimrc screenshot 2](http://i62.tinypic.com/2dsqt85.png)
![vimrc screenshot 3](http://i58.tinypic.com/i3gpon.png)
![vimrc screenshot 4](http://i61.tinypic.com/qrkjsj.png)
