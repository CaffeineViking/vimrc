vimrc
=====

Installation
------------
The shell script snipplet below will download this repository to `~/.vim_temp` and then execute the setup script. This script creates all the necessary folders in your home folder and fetches the required Vundle package manager. Thereafter, the `.vimrc` is moved too (make sure you backup you existing configuration in case you don't like this). It will automatically open vim and start downloading the required packages for you (go fetch some coffee, or eat some fika).

```sh
git clone https://github.com/CaffeineViking/vimrc.git ~/.vim_temp && \
cd ~/.vim_temp && ./setup.sh && rm -rf ~/.vim_temp && cd ~
```

If the script doesn't work (maybe you are running Windows or MacOS) you can just follow the steps below:

1. Remove (backup) your existing .vimrc and related folders from your home directory.
2. Download this repository, just copy over the .vimrc to your home directory.
3. Create two folders, `.vim_bundle` and `.vim_undoes` in your home directory.
4. Fetch the source from the Vundle repository. Put it in `.vim_bundle/Vundle.vim`.
5. Probably install the `Hack` font too, which has support for powerline.
6. Run vim and call `:PluginInstall`.
7. Done! Please enjoy.

Features
--------
* [Vundle](http://github.com/gmarik/vundle): an awesome package manager.
* [NERDTree](https://github.com/scrooloose/nerdtree): fast filesystem browser, see everything!
* [TagBar](https://github.com/majutsushi/tagbar): painless navigation of tags (functions, classes etc...).
* [Fugitive](https://github.com/tpope/vim-fugitive): easily one of the best Git integrators for Vim.
* [Vim-Surround](https://github.com/tpope/vim-surround): enables one to manipulate e.g. (){}<> directly.
* [GUndo](https://github.com/sjl/gundo.vim): graphical visualization of the Vim undo tree and diffs for them.
* [TabLine](https://github.com/mkitt/tabline.vim): improved tab output, no clutter.
* [LightLine](https://github.com/itchyny/lightline.vim): minimal and lightweight statusline/tabline.
* [Vim-Repeat](https://github.com/tpope/vim-repeat): extends vim's '.' operator usage.
* [Vim-Commentary](https://github.com/tpope/vim-commentary): comment stuff out with gc.
* [MatchIt](https://github.com/tmhedberg/matchit): operator '%' matches more stuff.
* [Ack](https://github.com/mileszs/ack.vim): searches directory absurdingly fast.
* [GruvBox](https://github.com/morhetz/gruvbox): very, extremely, pretty colors.
* No overwritten vim bindings, all key mappings are bound to the leader key.
* Sane defaults for vim: indents, no swap files, persistent undo tree etc...

Bindings
--------
* Disable Highlight: `<leader>space`
* Toggle NERDTree: `<leader>n`
* Toggle TagBar: `<leader>t`
* Toggle GUndo: `<leader>g`

Screenshot
----------

![pretty](https://i.imgsafe.org/5de94d923a.png)
