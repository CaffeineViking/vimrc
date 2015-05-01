vimrc
=====

Installation
------------
Provided in this repository is an install script, first, the contents of this repository is downloaded to `~/.vim_temp`, it then creates a backup of your existing `~/.vimrc` and possibly `~/.vim_bundle / ~/.vim_undodir` into `~/.vim_backup`. Thereafter, the appropriate directories and files are copied and created (`~/.vim_bundle`, `~/.vim_undodir` and `~/.vimrc`). Finally, vim will run and install the plugins via Vundle. NOTE: YOU WILL GET A ERROR FROM VUNDLE SAYING GRUVBOX COULDN'T BE FOUND, PLEASE JUST HIT ENTER!
```sh
git clone https://github.com/CaffeineViking/vimrc.git ~/.vim_temp && \
~/.vim_temp/setup.sh
```

Features
--------
* [Vundle](http://github.com/gmarik/vundle): an awesome package manager.
* [NERDTree](https://github.com/scrooloose/nerdtree): fast filesystem browser, see everything!
* [Syntastic](https://github.com/scrooloose/syntastic): syntax checker for several languages and compilers.
* [TagBar](https://github.com/majutsushi/tagbar): painless navigation of tags (functions, classes etc...).
* [Fugitive](https://github.com/tpope/vim-fugitive): easily one of the best Git integrators for Vim.
* [YankStack](https://github.com/maxbrunsfeld/vim-yankstack): choose a yank done before... any yank.
* [GUndo](https://github.com/sjl/gundo.vim): graphical visualization of the Vim undo tree and diffs for them.
* [TabLine](https://github.com/mkitt/tabline.vim): improved tab output, no clutter.
* [LightLine](https://github.com/itchyny/lightline.vim): minimal and lightweight statusline/tabline.
* [GruvBox](https://github.com/morhetz/gruvbox): pretty colors.
* [Rust](https://github.com/wting/rust.vim): syntax and plugins to support the Rust language.
* [Vaxe](https://github.com/jdonaldson/vaxe): same as above, but to support the awesome Haxe language.
* [Vim-GLSL](https://github.com/tikhomirov/vim-glsl): a much needed feature for those programming shaders!
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
![vimrc screenshot 5](http://i60.tinypic.com/x6r92.png)
