" sourced idea from https://github.com/ChristianChiarulli/nvim

" auto-install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs 
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall 
endif

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

        " FZF
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'

    call plug#end()

" }}}


" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif