source $XDG_CONFIG_HOME/nvim/src/general/functions.vim
source $XDG_CONFIG_HOME/nvim/src/general/settings.vim
source $XDG_CONFIG_HOME/nvim/src/keys/mappings.vim
source $XDG_CONFIG_HOME/nvim/src/vim-plug/plugins.vim


" vim-plug execution {{{

source $XDG_CONFIG_HOME/nvim/src/plug-config/vim-airline.vim
source $XDG_CONFIG_HOME/nvim/src/plug-config/limelight.vim
source $XDG_CONFIG_HOME/nvim/src/plug-config/gruvbox.vim
source $XDG_CONFIG_HOME/nvim/src/plug-config/nvim-colorizer.vim
source $XDG_CONFIG_HOME/nvim/src/plug-config/nvim-colorizer.vim
source $XDG_CONFIG_HOME/nvim/src/plug-config/indentline.vim
source $XDG_CONFIG_HOME/nvim/src/plug-config/coc.vim

" }}}

"clear screen upon quit
au VimLeave * :!clear
