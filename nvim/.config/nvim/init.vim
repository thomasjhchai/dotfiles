source $XDG_CONFIG_HOME/nvim/viml/general/functions.vim
source $XDG_CONFIG_HOME/nvim/viml/general/settings.vim
source $XDG_CONFIG_HOME/nvim/viml/keys/mappings.vim
source $XDG_CONFIG_HOME/nvim/viml/vim-plug/plugins.vim


" vim-plug execution {{{

source $XDG_CONFIG_HOME/nvim/viml/plug-config/vim-airline.vim
source $XDG_CONFIG_HOME/nvim/viml/plug-config/limelight.vim
source $XDG_CONFIG_HOME/nvim/viml/plug-config/gruvbox.vim
source $XDG_CONFIG_HOME/nvim/viml/plug-config/nvim-colorizer.vim
source $XDG_CONFIG_HOME/nvim/viml/plug-config/nvim-colorizer.vim
source $XDG_CONFIG_HOME/nvim/viml/plug-config/indentline.vim
source $XDG_CONFIG_HOME/nvim/viml/plug-config/coc.vim
source $XDG_CONFIG_HOME/nvim/viml/plug-config/fzf.vim

" }}}

"clear screen upon quit
au VimLeave * :!clear
