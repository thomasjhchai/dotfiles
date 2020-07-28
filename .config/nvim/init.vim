" 24-bit true color: neovim 0.1.5+ / vim 7.4.1799+
" enable ONLY if TERM is set valid and it is NOT under mosh
    function! IsMosh()
        let output = system('~/dotfiles/bin/is_mosh.sh -v')
        if v:shell_error
            return 0
        endif
        return !empty(l:output)
    endfunction
    
    function! s:auto_termguicolors(...)
        if !(has('termguicolors'))
            return
        endif
    
        if (&term == 'xterm-256color' || &term == 'nvim') && !IsMosh()
            set termguicolors
            echom "GUI colors set"
        else
            set notermguicolors
            echom "256 colors set"
        endif
    endfunction

    if has('termguicolors')
        " by default, enable 24-bit color, but lazily disable if under mosh
        set termguicolors
    
        if exists('*timer_start')
            call timer_start(0, function('s:auto_termguicolors'))
        else
            call s:auto_termguicolors()
        endif
    endif

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
        Plug 'Yggdroot/indentLine'          " display indentation level for codes
        Plug 'norcalli/nvim-colorizer.lua'

        " Color Schemes
        Plug 'morhetz/gruvbox'              

        " General
        Plug 'tpope/vim-fugitive'	    	" for git status
        Plug 'junegunn/goyo.vim'
        Plug 'junegunn/limelight.vim'
        Plug 'haya14busa/is.vim'           	" for search highlight improvement
        Plug 'jiangmiao/auto-pairs'
        Plug 'SirVer/ultisnips'             " Snippets  
        Plug 'airblade/vim-gitgutter'

        " Coding
        Plug 'neoclide/coc.nvim', {'branch': 'release'}            " Intellisense auto complete

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
        if has('termguicolors')
            lua require'colorizer'.setup()
        endif

" }}}

" {{{ Default coc.vim configuration
    " TextEdit might fail if hidden is not set.
    set hidden
    
    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup
    
    " Give more space for displaying messages.
    set cmdheight=2
    
    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300
    
    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c
    
    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
      " Recently vim can merge signcolumn and number column into one
      set signcolumn=number
    else
      set signcolumn=yes
    endif
    
    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    
    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif
    
    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif
    
    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    
    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    
    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction
    
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
    
    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)
    
    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    
    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
    
    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    
    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)
    
    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)
    
    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)
    
    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')
    
    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    
    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
    
    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    
    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" }}}


"if has ("nvim")
"	echo "NVIM"
"endif

"clear screen upon quit
au VimLeave * :!clear
