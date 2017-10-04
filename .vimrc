
execute pathogen#infect()
syntax on
filetype plugin indent on

set term=screen-256color
set t_ut=

"for solarized plugin
syntax enable
let g:solarized_termcolors=256
let g:solarized_degrade=1
set background=dark
colorscheme solarized

" Show statusbar
set laststatus=2

"set line number
set number

"for syntastic plugins
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 

"for vim-javascript plugin
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

"for vim-airline theme
let g:airline_solarized_bg='dark'

"turn off bell
set visualbell
set t_vb=

