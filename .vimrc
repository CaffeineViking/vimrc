"
" __   _(-)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
" ============================
" Sane, Lightweight, Aesthetic
"
"    --Erik S. V. Jansson--
"

" Initialization: {
    set nocompatible " Enable features which aren't compatible with Vi.
    filetype off " Required by Vundle before setting the runtime paths.

    set rtp+=~/.vim_bundle/Vundle.vim " Specify the Vim runtime path...
    call vundle#begin('~/.vim_bundle') " The package install directory.
    Plugin 'VundleVim/Vundle.vim' " Useful if Vundle itself has update.
" }

" Plugins: {
    " Functional: {
        Plugin 'tpope/vim-repeat' " Extend the Vim '.' operator.
        Plugin 'tpope/vim-commentary.git' " Comment stuff out...
        Plugin 'tpope/vim-surround' " Change (){}<>'' in a snap.
        Plugin 'godlygeek/tabular' " Easy automatic tabulations.
        Plugin 'scrooloose/nerdtree' " Better than NetRw, maybe.
        Plugin 'majutsushi/tagbar' " Nice to get a code topview.
        Plugin 'tpope/vim-fugitive' " Probably best Git wrapper.
        Plugin 'tmhedberg/matchit' " The '%' now matches more k?
        Plugin 'mileszs/ack.vim' " Forget IDE searches gtg fast!
        Plugin 'sjl/gundo.vim' " Why only have linear undo tree?
        Plugin 'ajh17/VimCompletesMe' " Standardized auto-compl.
        Plugin 'tpope/vim-dispatch' " When launching async jobs.
        " SuperTab vs VimCompletesMe: while the latter has fewer
        " features, it also has significantly less code/bloat...
        " However, I still wonder if the trade-offs is worth it.
    " }

    " Cosmetic: {
        Plugin 'itchyny/lightline.vim' " For lightweight tbline.
        Plugin 'morhetz/gruvbox' " The most amazing colorscheme.
    "}

    " Language: {
        Plugin 'beyondmarc/hlsl.vim' " Integrate HLSL highlight.
        Plugin 'CaffeineViking/vim-glsl' " Add support for GLSL.
        Plugin 'kbenzie/vim-spirv.git' " SPIRV syntax highlight.
    "}
" }

" Preliminaries: {
    call vundle#end() " Let Vundle finish initializing itself now.
    filetype plugin indent on " Enable file specific features...
" }

" General: {
    set viminfo+=n~/.viminfo " Windows wants to use _viminfo >:(
    set autowrite " Write automatically when :make, :next etc...
    set autoread " Reload file when it has been changed externally.
    set nobackup " No need for .bkp files when version control exist.
    set nowritebackup " If Vim crashes often then turn backups on again, look at docs for more information.
    set noswapfile " Don't create swap files, nowadays we should have enough memory to store a text file.
    set complete-=i " Completion list for all included files is a bad idea, scanning could take a while.
    set sessionoptions-=options " Don't store options (global variables etc...) when making a session.

    set undodir=~/.vim_undoes " Where do we store all this awesomeness?!?!
    set undofile " Persistent undos are completely freaking awesome!!!

    let mapleader="\<Space>" " This vimrc frowns on overwritten vim bindings, I use the ',' quite a lot.
    let g:mapleader="\<Space>" " It is very rare to see Vim user use <Space> in normal mode, hence this.
    set history=1024 " Defines the number of stored commands Vim can remember, doesn't really matter :).
" }

" Autocompletions: { Basically, Vim's built-in auto-completions support with uniform keyboard shortcuts.
    " We are using VimCompletesMe as the plugin of choice for making Vim's " built-in autocompletions be
    " more uniformly handled with an single key: <Tab> and <Shift>-<Tab>. It will attempt to derive what
    " the most suitable autocompletion function is to be called based on the context (omni, user etc...)
    set omnifunc=syntaxcomplete#Complete " Enables only the default Vim auto-completion (quite fast!!!).
    " The above autocompletion types will not call any external programs (it might however, call ctags).
    set completeopt+=longest " Attempts to insert longest obviously current common match found so far.
    set completeopt-=preview " Sometimes the [Scratch] preview window will pop-up. We don't want that.
    let g:vcm_direction='p' " First choice should be the *closest* matching entry (as Bram intended).
" }

" Formatting: {
    set expandtab " Expand tab characters to space characters.
    set shiftwidth=4 " One tab is now 4 spaces.
    set shiftround " Always round up to the nearest tab.
    set tabstop=4 " This one is also needed to achieve the desired effect.
    set softtabstop=4 " Enables easy removal of an indentation level.

    set autoindent " Automatically copy the previous indent level. Don't use smartindent!!!
    set backspace=2 " Used for making backspace work like in most other editors (e.g. removing a single indent).
    set wrap " Wrap text. This is also quite optional, replace with textwidth=80 is you don't want this behaviour.
    set lazyredraw " Good performance boost when executing macros, redraw the screen only on certain commands.
" }

" Searching: {
    set ignorecase " Search is not case sensitive, which is usually what we want.
    set smartcase " Will override some ignorecase properties, when using caps it will do a special search.
    set incsearch " Enables the user to step through each search 'hit', usually what is desired here.
    set hlsearch " Will stop highlighting current search 'hits' when another search is performed.
    set magic " Enables regular expressions. They are a bit like magic (not really though, DFA).

    " Ack and Ag are incredibly useful for searching really fast, forget slow IDE searching.
    if executable('ag') " The Silver Searcher, faster than 'ack' (mostly)
        let g:ackprg = 'ag --vimgrep' " Enables ag compat. with vim.
    endif " Will use 'ag' if exists, otherwise uses normal Ack.
" }

" Interface: {
    set ffs=unix,dos,mac " Prioritize unix as the standard file type.
    set encoding=utf-8 " Vim can now work with a whole bunch more characters (powerline too).
    set scrolloff=8 " The screen will only scroll when the cursor is 8 characters from the top/bottom.
    set foldmethod=indent " Pressing zc will close a fold at the current indent while zo will open one.
    set foldopen+=jump " Additionally, open folds when there is a direct jump to the location.

    set wildmenu " Enable the 'autocomplete' menu when in command mode (':').
    set cursorline " For easier cursor spotting. Completely optional though (but so is bathing).
    set shortmess=at " Shorten some command mode messages, will keep you from having to hit ENTER all the time.
    " set cmdheight=2 " Might decrease the number of times for hitting enter even more, double default height.
    set stal=2 " Always show the tab lines, which makes the user interface a bit more consistent.

    set showmatch " Will highlight matching brackets.
    set mat=2 " How long the highlight will last.
    set number " Show line numbers on left side.
    set relativenumber " Enables the user to easily see the relative distance between cursor and target line.
    set ttyfast " Will send characters over a terminal connection faster. We do have fast connections after all.
    set ruler " Always show current cursor position, which might be needed for the character column location.
    set hidden " Abandon buffer when closed, which is usually what we want to do in this case.

    syntax on " The most important feature when coding. Vim please bless us with this option right now!.
    set laststatus=2 " Always have a status line, this is required in order for Lightline to work correctly.
    set noshowmode " Disables standard -INSERT-, -NORMAL-, etc... Lightline will provide a better looking one for us.
    set t_Co=256 " This will 'force' terminals to use 256 colors, enabling Lightline and the colorscheme to look correct.
    set background=dark " Cool programmers only use dark themes. It's good for your eyes man, really nice!
    silent! colorscheme gruvbox " I love this theme. Big kudos to the developer of this theme.

    " LightLine Components: {
        function! LightLineModified()
            if &modified
                return "+"
            else
                return ""
            endif
        endfunction
        function! LightLineReadonly()
            if &readonly
                return ""
            else
                return ""
            endif
        endfunction
        function! LightLineFugitive()
            if exists("*fugitive#head")
                let branch = fugitive#head()
                return branch !=# '' ? ' '.branch : ' [No Head]'
            else
                return ' [No Head]'
            endif
            return ''
        endfunction
        function! LightLineFilename()
            return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                 \ ('' != expand('%:f') ? expand('%:f') : '[No Name]') .
                 \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
        endfunction
    " }

    " Windows: {
        let g:gundo_width = 48
        let g:tagbar_width = 48
        let g:NERDTreeWinSize = 48
        let g:NERDTreeMinimalUI = 1
        let g:NERDTreeShowLineNumbers = 1
        autocmd FileType nerdtree setlocal relativenumber
        let g:tagbar_show_linenumbers = -1 " Global conf.

        let g:gundo_preview_height = 13
        let g:gundo_preview_bottom = 1
        let g:NERDTreeWinPos = "right"
        let g:gundo_right = 1 " right
        let g:tagbar_map_showproto=""
        let g:tagbar_autofocus = 1
        let g:tagbar_compact = 1
        let g:gundo_help = 0
    " }

    " Graphical: {
        if has("gui_running")
            set guioptions=i " Kill them toolbars!
            if has("win32")
                set shellslash " Fix for Fugitive.
                set guifont=Hack:h10,Monospace:h10
                " Below we inject a DLL that removes the annoying GTK padding when using Win32.
                map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
            else
                set guifont=Hack\ 10,Monospace\ 10
            endif
        else
            set mouse=a " Mouse support if needed.
        endif

        " A LightLine Theme
        let g:lightline = {
        \ 'colorscheme': 'gruvbox',
        \ 'active': {
        \  'left': [[ 'mode' ], [ 'fugitive' ], [ 'filename' ]],
        \  'right': [[ 'linenums' ], [ 'fileencoding', 'fileformat' ], [ 'filetype']]
        \ },
        \ 'inactive': {
        \  'left': [[ 'mode' ], [ 'fugitive' ], [ 'filename' ]],
        \  'right': [[ 'linenums' ], [ 'fileencoding', 'fileformat' ], [ 'filetype']]
        \ },
        \ 'component': {
        \   'linenums': '☰  %3l/%L:%-2c',
        \   'filetype': '%{&ft!=#""?&ft:"[No Type]"}'
        \ },
        \ 'component_function': {
        \   'fugitive': 'LightLineFugitive',
        \   'readonly': 'LightLineReadonly',
        \   'modified': 'LightLineModified',
        \   'filename': 'LightLineFilename',
        \ },
        \ 'separator':    { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' }
        \ }
    " }

    set list " Enables the characters to be displayed.
    " Useful for showing trailing whitespace and others.
    set listchars=tab:›\ ,trail:•,extends:>,precedes:<,nbsp:_
" }

" Mappings: {
    " Will remove latest search/replace highlight.
    nnoremap <silent> <C-L> :silent! nohl<cr><C-L>

    " Useful to toggle the NERDTree window back and forth.
    noremap <silent> <leader>d :silent! NERDTreeToggle<cr>
    " Same thing as above, but for the TagBar plugin...
    noremap <silent> <leader>s :silent! TagbarToggle<cr>
    " For another window, this time for the GUndo tree.
    noremap <silent> <leader>g :silent! GundoToggle<cr>

    " Here we have one of the things I and regular Vim
    " disagree on. Both 'C' and 'D' behave as c$ or d$
    " while Y behaves as yy. I don't like this at all.
    nmap Y y$

    " Shortcut Ag searching.
    noremap <leader>f :Ack! 
    " Shortcut for Tabulate.
    noremap <leader>a :Tab /
" }
