 " Basic Setting {{{
    set nocompatible            " disable compatibility to old-time vi
    set showmatch               " show matching brackets.
    set ignorecase              " case insensitive matching

    set hlsearch                " highlight search results
    highlight Search cterm=none ctermbg=3 ctermfg=8 " makes search highlight more contrast

    if (has("termguicolors"))
        set t_8f=\[[38;2;%lu;%lu;%lum
        set t_8b=\[[48;2;%lu;%lu;%lum
        set termguicolors           " set terminal to using true colors
    endif
    set splitbelow              " Horizontal splits will automatically be below
    set splitright              " Vertical splits will automatically be to the right
    set cursorline              " Enable line of the current position
    set tabstop=4               " number of columns occupied by a tab character
    set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
    set expandtab               " converts tabs to white space
    set shiftwidth=4            " width for autoindents
    set relativenumber          " add line numbers "
    set autoindent              " indent a new line the same amount as the line just typed
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

" Basic Mappings {{{

    " map <space> as <leader> key
    nnoremap <SPACE> <Nop>
    let mapleader=" " 

    " map for Goyo
    nmap <leader>g :Goyo<CR>
        autocmd! User GoyoLeave source $XDG_CONFIG_HOME/nvim/init.vim   " bug fix when quit Goyo to maintain default highlights
	
    " reload init.vim or .vimrc
    if !exists("*Check_Vim_Type")
        function Check_Vim_Type()
            if has ("nvim")
                source $XDG_CONFIG_HOME/nvim/init.vim
                echo "NVIM Reloaded"
            else
                source $HOME/.vimrc
                echo "VIM Reloaded"
            endif
	    endfunction
    endif

    nmap <leader>r :call Check_Vim_Type()<CR>

    " throw jj, jk, or kj into Normal mode 
    inoremap jj <Esc>
    inoremap jk <Esc>
    inoremap kj <Esc>

    " remap number increment and decrement to Alt or Option key
    nnoremap <A-a> <C-a>
    nnoremap <A-x> <C-x>

" }}}


" vim-plug plugins {{{

    call plug#begin()

        " Aesthetics
        Plug 'vim-airline/vim-airline'		" for status bar
        Plug 'vim-airline/vim-airline-themes'
        Plug 'Yggdroot/indentLine'          " display indentation level for codes"
        Plug 'norcalli/nvim-colorizer.lua'

        " Color Schemes
        Plug 'morhetz/gruvbox'              

        " General
        Plug 'tpope/vim-fugitive'	    	" for git status
        Plug 'junegunn/goyo.vim'
        Plug 'junegunn/limelight.vim'
        Plug 'haya14busa/is.vim'           	" for search highlight improvement

    call plug#end()

" }}}

" vim-plug execution {{{

    " Airline
        let g:airline_powerline_fonts = 1
        "let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
        let g:airline_section_warning = ''
        "let g:airline#extensions#tabline#enabled = 1
        let g:airline_theme = 'gruvbox'

    " Limelight
        " Color name (:help cterm-colors) or ANSI code
        let g:limelight_conceal_ctermfg = 'gray'
        let g:limelight_conceal_ctermfg = 240

        " Color name (:help gui-colors) or RGB color
        let g:limelight_conceal_guifg = 'DarkGray'
        let g:limelight_conceal_guifg = '#777777'

        " Default: 0.5
        let g:limelight_default_coefficient = 0.7

    " Set colorscheme
        let g:gruvbox_contrast_light = 'hard'
        let g:gruvbox_invert_selection = 0
        colorscheme gruvbox

    " Set colorizer"
        if (has("termguicolors"))
            lua require'colorizer'.setup()
        endif

" }}}

"if has ("nvim")
"	echo "NVIM"
"endif

"clear screen upon quit
au VimLeave * :!clear
