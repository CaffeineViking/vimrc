Sane, Lightweight and a e s t h e t i c .vimrc
==============================================

![preview](preview.png)

Here is my personal Vim/NeoVim setup, which has been written (and documented) from the ground-up, tried-and-tested for several years by myself and several colleagues. It's built on the premise that regular Vim is awesome, and any additions in this configuration should be made to "enhance" the original Vim experience (not replace it). Therefore, you'll find that none of the bindings have been overwritten, and only a selected few packages have been included (and if you don't like some of them, feel free to remove them, which only requires a couple of lines to be changed). More importantly, the configuration provides more sane defaults to Vim, just as in [tpope/vim-sensible](https://github.com/tpope/vim-sensible).

I hope you will find this Vim configuration useful. Please enjoy, and many happy hacking nights for you! If you think something should be changed, or if you've found a bug, please open a issue or a PR, and I'll take a look at it. I'm fairly happy with my current setup, but I am always open to considering small changes (especially if they can make my life easier as well!).

Installation
------------

The shell script snipplet below will download this repository to `~/.vim_temp` and then execute the setup script. This script creates all the necessary folders in your home folder and fetches the required Vundle package manager. Afterwards, the target `.vimrc` is moved there too (make sure you backup you existing configuration in case you don't like my configuration). Finally, it will automatically open vim and start downloading the required packages for you (go fetch some coffee or maybe fika).

```sh
git clone https://github.com/CaffeineViking/vimrc.git ~/.vim_temp && \
cd ~/.vim_temp && ./setup.sh && rm -rf ~/.vim_temp && cd ~
```

If the script doesn't work automatically, you can just follow these simple steps:

1. Backup your existing `.vimrc` and related folders from your home directory
2. Download this repository, just copy over the .vimrc to your home directory
3. Create two folders, `.vim_bundle` and `.vim_undoes` in your home directory
4. Fetch the data from `Vundle` repository. Put it in `.vim_bundle/Vundle.vim`
5. Run vim and call `:PluginInstall` (make sure you have `git` installed too!)

You should also install [Iosevka](https://github.com/be5invis/Iosevka) fonts which have powerline and ligature support.

For the Win32-version of gvim you might want to copy `gvimfullscreen.dll` to `C:\Program Files\Vim\vim91` to be able to use F11 to go into borderless fullscreen. The copy bundled here (originally based on [this](https://github.com/leonid-shevtsov/gvimfullscreen_win32)) also fixes issues where the background color wouldn't match gruvbox.

Plugins
-------

* [Vundle](VundleVim/Vundle.vim)
* [vim-repeat](tpope/vim-repeat)
* [vim-commentary](tpope/vim-commentary.git)
* [vim-surround](tpope/vim-surround)
* [tabular](godlygeek/tabular)
* [nerdtree](scrooloose/nerdtree)
* [tagbar](majutsushi/tagbar)
* [vim-fugitive](tpope/vim-fugitive)
* [matchit](tmhedberg/matchit)
* [ack.vim](mileszs/ack.vim)
* [gundo.vim](sjl/gundo.vim)
* [VimCompletesMe](vim-scripts/VimCompletesMe)
* [vim-dispatch](tpope/vim-dispatch)
* [vim-vp4](ngemily/vim-vp4)
* [lightline.vim](itchyny/lightline.vim)
* [gruvbox](morhetz/gruvbox)
* [gruvbox-material](sainnhe/gruvbox-material)
* [rainbow](luochen1990/rainbow)
* [hlsl.vim](beyondmarc/hlsl.vim)
* [vim-glsl](CaffeineViking/vim-glsl)
* [vim-spirv.git](kbenzie/vim-spirv.git)
* [vim-pica200](CaffeineViking/vim-pica200)

Bindings
--------

* Default leader key: `<space>`
* Clear highlighting: `<ctrl>l`
* Align and tabulate: `<space>a`
* Find with rg or ag: `<space>f`
* Toggle NERDTree: `<space>d`
* Toggle TagBar: `<space>s`
* Toggle GUndo tree: `<space>g`
* Trigger Makefile: `m<return>`
