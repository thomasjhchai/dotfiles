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

    " Better indenting
    vnoremap < <gv
    vnoremap > >gv

" }}}