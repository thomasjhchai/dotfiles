require('settings')
require('mappings')
require('plugins')

require('functions')

-- colorscheme setting
require('colorschemes-config.gruvbox')

-- packer plugins settings
require('plugins-config.web-devicons')
require('plugins-config.nvim-tree')
require('plugins-config.indentline')
require('plugins-config.lualine')
require('plugins-config.bufferline')
require('plugins-config.nvim-autopairs')
require('plugins-config.nvim-treesitter')
require('plugins-config.toggleterm')
require('plugins-config.which-key')
require('plugins-config.zen-mode')
require('plugins-config.twilight')
require('plugins-config.gitsigns')

-- clear screen upon quit
vim.cmd([[
    au VimLeave * :!clear
]])
