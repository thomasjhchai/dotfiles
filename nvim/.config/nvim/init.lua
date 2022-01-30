require('settings')
require('mappings')
require('plugins')
require('autocmds')

-- packer plugins settings

-- clear screen upon quit
vim.cmd([[
    au VimLeave * :!clear
]])
