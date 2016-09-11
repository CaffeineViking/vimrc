" This is my vimrc, you might also like it.
" - Erik S. V. Jansson

set nocompatible
filetype off

set rtp+=~/.vim_bundle/Vundle.vim
call vundle#begin('~/.vim_bundle')
Plugin 'gmarik/Vundle.vim'

" Functional:
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'tmhedberg/matchit'
Plugin 'mileszs/ack.vim'
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
    set complete-=i " Completion list for all included files is a bad idea, scanning could take a while.
    set sessionoptions-=options " Don't store options (global variables etc...) when making a session.

    set undodir=~/.vim_undoes " Where do we store all this awesomeness?!?!
    set undofile " Persistent undos are awesome!

    let mapleader=',' " Map <leader> to the ',' key. This is used to extend Vims functionality without overwriting any standard bindings.
    let g:mapleader=',' " Do this globally too.
    set history=1024 " Defines the number of stored commands that Vim can remember, we have so much memory today it doesn't even matter.
" }

" Formatting: {
    set expandtab " Expand tab characters to space characters.
    set shiftwidth=4 " One tab is now 4 spaces.
    set shiftround " Always round up to the nearest tab.
    set tabstop=4 " This one is also needed to acheive the desired effect.
    set softtabstop=4 " Enables easy removal of an indentation level.

    set autoindent " Automatically copy the previous indent level. Don't use smartindent.
    set backspace=2 " Used for making backspace work like in most other editors (remove indents).
    set wrap " Wrap text. This is also quite optional, replace with textwidth=80 is you don't want this behaviour.
    set lazyredraw " Good performance boost when executing macros.
" }

" Searching: {
    set ignorecase " Search is not case sensitive.
    set smartcase " Will override some ignorecase properties, when using caps it will do a special search.
    set incsearch " Enables the user to step through each search 'hit'.
    set hlsearch " Will stop highlighting current search 'hits' when another search is performed.
    set magic " Enables regular expressions. They are a bit like magic.
    " Ack and Ag are incredibly useful for searching really, fast.
    if executable('ag') " The Silver Searcher, faster than 'ack'.
        let g:ackprg = 'ag --vimgrep' " Enables compat. with vim.
    endif " Will use 'ag' if exists, otherwise uses normal Ack.
" }

" UI: {
    set ffs=unix,dos,mac " Prioritize unix as the standard file type.
    set encoding=utf-8 " Vim can now work with a whole bunch more characters.
    set scrolloff=8 " The screen will only scroll when the cursor is 8 characters from the top/bottom.
    set foldmethod=indent " Pressing zc will close a fold at the current indent while zo will open one.

    set wildmenu " Enable the 'autocomplete' menu when in command mode (':').
    set cursorline " For easier cursor spotting. Completly optional though.
    set shortmess=at " Shorten some command mode messages, will keep you from having to hit ENTER all the time.
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

    " LightLine: {
        function! LightLineModified()
            if &filetype == "help"
                return ""
            elseif &modified
                return "+"
            elseif &modifiable
                return ""
            else
                return ""
            endif
        endfunction

        function! LightLineReadonly()
            if &filetype == "help"
                return ""
            elseif &readonly
                return "\ue0a2"
            else
                return ""
            endif
        endfunction

        function! LightLineFugitive()
            if exists("*fugitive#head")
                let branch = fugitive#head()
                return branch !=# '' ? '\ue0a0 '.branch : ''
            endif
            return ''
        endfunction

        function! LightLineFilename()
            return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                 \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                 \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
        endfunction
    " }

    " Window: {
        let g:gundo_width = 48
        let g:tagbar_width = 48
        let g:NERDTreeWinSize = 48
        let g:NERDTreeMinimalUI = 1
        let g:NERDTreeWinPos = "right"
        let g:gundo_right = 1 " right
        let g:tagbar_autofocus = 1
        let g:tagbar_compact = 1
        let g:gundo_help = 0
    " }

    " GUIs: {
        if has("gui_running")
            " Pretty nice here.
            let g:lightline = {
            \ 'colorscheme': 'gundo',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'filename' ] ]
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightLineFugitive',
            \   'readonly': 'LightLineReadonly',
            \   'modified': 'LightLineModified',
            \   'filename': 'LightLineFilename'
            \ },
            \ 'separator': { 'left': '\ue0b0', 'right': '\ue0b2' },
            \ 'subseparator': { 'left': '\ue0b1', 'right': '\ue0b3' }
            \ } " Enable a bunch of nice powerline stuff for lightline. Requires a patched font e.g.: Hack...
            set guifont=Hack\ 10,Monospace\ 10 " Nice programming font. Hack:h10 on Windows, MacOS should work?
            set guioptions=i " Will disable all nasty GUI toolbars on gvim, the power of vim is without mouses!
        else
            " Good-old shell...
            let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }
        endif
    " }

    set list " Enables characters to show.
    " Useful for showing trailing whitespace.
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
" }

" Mapping: {
    map <leader><space> :silent! noh<cr>
    map <leader>n :silent! NERDTreeToggle<cr>
    map <leader>t :silent! TagbarToggle<cr>
    map <leader>g :silent! GundoToggle<cr>
" }
