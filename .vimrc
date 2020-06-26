
execute pathogen#infect()
syntax on
filetype plugin indent on

set term=screen-256color
set t_ut=

" Show statusbar
set laststatus=2

"set line number
set relativenumber
colorscheme monokai
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

"for syntastic plugins
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"for vim-javascript plugin
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

"for vim-airline theme
let g:airline_solarized_bg='dark'

"for ctrlp plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim

"turn off bell
set visualbell
set t_vb=

" Make `jj` and `jk` throw you into normal mode
inoremap jj <esc>
inoremap jk <esc>

"clear screen upon quit
au VimLeave * :!clear
