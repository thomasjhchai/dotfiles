" Basic Setting {{{
    set nocompatible            " disable compatibility to old-time vi
    set showmatch               " show matching brackets.
    set ignorecase              " case insensitive matching

    set hlsearch                " highlight search results
    highlight Search cterm=none ctermbg=3 ctermfg=8 " makes search highlight more contrast
    
    set splitbelow              " Horizontal splits will automatically be below
    set splitright              " Vertical splits will automatically be to the right
    set cursorline              " Enable line of the current position
    set tabstop=4               " number of columns occupied by a tab character
    set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
    set expandtab               " converts tabs to white space
    set shiftwidth=4            " width for autoindents
    set relativenumber          " add line numbers "
    set autoindent              " indent a new line the same amount as the line just typed
    set scrolloff=7             " bottom page 7 line - end of scroll
    set backspace=indent,eol,start  
    set wildmode=longest,list   " get bash-like tab completions
    filetype plugin indent on   " allows auto-indenting depending on file type
    syntax on                   " syntax highlighting

    " set 79 column border for good coding style. Text overlow will be
    " highlighted
    highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
    augroup vimrc_autocmds
        autocmd!
"        autocmd BufEnter,WinEnter *.py,*.c,*.js call matchadd('OverLength', '\%>78v.\+', -1)       " when using gruvbox highlight got cleared
        autocmd BufEnter,WinEnter *.py,*.c,*.js call matchadd('ErrorMsg', '\%>78v.\+', -1)          " need this when use gruvbox 
    augroup END

" }}}

" Auto commands {{{

    " remove blank characters at the end of every line when saving file, need to be disabled for some
    " filetypes like markdown or latex where trailing spaces are important
    autocmd FileType c,cpp,java,python,javascript autocmd BufWritePre <buffer> %s/\s\+$//e

" }}}

" Filetype-Specific Configurations {{{

    " HTML, XML, Jinja
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
    autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
    autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

    " Markdown
    autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
    
" }}}