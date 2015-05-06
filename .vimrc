set nocompatible
filetype off

set rtp+=~/.vim_bundle/Vundle.vim
call vundle#begin('~/.vim_bundle')
Plugin 'gmarik/Vundle.vim'

" Functional:
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'sjl/gundo.vim'

" Pretty:
Plugin 'mkitt/tabline.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on

" General: {
    set autoread " Reload file when changed externally.
    set nobackup " No need for .bkp files when version control exist.
    set nowritebackup " If Vim crashes often then turn backups on again, look at docs for more information.
    set noswapfile " Don't create swap files, nowadays we should have enough memory to store a text file.

    set undodir=~/.vim_undodir " Where do we store all this awesomeness?!?!
    set undofile " Persistent undos are awesome!

    let mapleader=',' " Map <leader> to the ',' key. This is used to extend Vims functionality without overwriting any standard bindings.
    let g:mapleader=',' " Do this globally too.
    set history=1000 " Defines the number of stored commands that Vim can remember, we have so much memory today it doesn't even matter.
" }

" Formatting: {
    set expandtab " Expand tab characters to space characters.
    set shiftwidth=4 " One tab is now 4 spaces.
    set shiftround " Always round up to the nearest tab.
    set tabstop=4 " This one is also needed to acheive the desired effect.
    set softtabstop=4 " Enables easy removal of an indentation level.

    set autoindent " Automatically copy the previous indent level. Don't use smartindent.
    set backspace=indent,eol,start
    set wrap " Wrap text. This is also quite optional, replace with textwidth=80 is you don't want this behaviour.
    set lazyredraw " Good performance boost when executing macros.
    set viminfo^=% " Remember some info on close.
" }

" Searching: {
    set ignorecase " Search is not case sensitive.
    set smartcase " Will override some ignorecase properties, when using caps it will do a special search.
    set incsearch " Enables the user to step through each search 'hit'.
    set hlsearch " Will stop highlighting current search 'hits' when another search is performed.
    set magic " Enables regular expressions. They are a bit like magic.
" }

" UI: {
    set ffs=unix,dos,mac " Prioritize unix as the standard file type.
    set encoding=utf-8 " Vim can now work with a whole bunch more characters.
    set scrolloff=7 " The screen will only scroll when the cursor is 7 characters from the top/bottom.
    set foldmethod=indent " Pressing zc will close a fold at the current indent while zo will open one.

    set wildmenu " Enable the 'autocomplete' menu when in command mode (':').
    set cursorline " For easier cursor spotting. Completly optional though.
    set shortmess=a " Shorten some command mode messages, will keep you from having to hit ENTER all the time.
    set cmdheight=2 " Will also reduce the frequency of having to press ENTER.
    set stal=2 " Always show tabs.

    set showmatch " Will highlight matching brackets.
    set mat=2 " How long the highlight will last.
    set number " Show line numbers on left side.
    set relativenumber " Enables the user to easilty see the relative distance between cursor and target line.
    set ttyfast " Will send characters over a terminal connection faster. We do have pretty fast computers after all.
    set ruler " Always show current cursor position.
    set hidden " Abandon buffer when closed.

    syntax on " The most important feature when coding. Please give!.
    set laststatus=2 " Always have a status line, this is required in order for Lightline to work correctly.
    set noshowmode " Disables standard -INSERT-, -NORMAL-, etc... Lightline will provide a better looking one for us.
    set t_Co=256 " This will 'force' terminals to use 256 colors, enabling Lightline and the colorscheme to look correct.
    set background=dark " Cool programmers only use dark themes.
    silent! colorscheme gruvbox " I love this theme. Big kudos to the developer of this theme.

    " Jellybeans is a nice lightline theme (for another colorscheme) but it blends with gruvbox quite nicely.
    let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

    let g:NERDTreeWinPos = "right"
    let g:gundo_right = 1 " right
    let g:tagbar_autofocus = 1

    if has("gui_running")
        set guifont=SourceCodePro\ 10,Monospace\ 10 " Nice programming font. Source_Code_Pro:h10 on Windows and OSX.
        set guioptions=i " Will disable all nasty GUI toolbars on gvim.
    endif

    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
" }

" Mapping: {
    map <silent> <leader><cr> :noh<cr>
    map <silent> <leader><space> :noh<cr>

    map <leader>n :NERDTreeToggle<cr>
    map <leader>t :TagbarToggle<cr>
    map <leader>g :GundoToggle<cr>

    let g:yankstack_map_keys=0
    nmap <leader>y <Plug>yankstack_substitute_older_paste
    nmap <leader>Y <Plug>yankstack_substitute_newer_paste
" }
