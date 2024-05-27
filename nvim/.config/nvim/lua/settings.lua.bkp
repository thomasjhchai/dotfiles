local opt = vim.opt
local cmd = vim.cmd

-- Basic Settings
opt.timeoutlen = 500          -- overide default of 1000ms
opt.showmatch = true          -- show matching brackets
opt.ignorecase = true         -- case insensitive matching
opt.cursorline = true         -- enable line of current position
opt.tabstop = 4               -- number of columns by a tab character
opt.softtabstop = 4           -- see multiple spaces as tabstops so <BS> does the right thing
opt.expandtab = true          -- converts tab to white spaces
opt.shiftwidth = 4            -- width for autoindents
opt.relativenumber = true     -- add relative line numbees
opt.autoindent = true         -- auto indent new line to follow previous line indentation
opt.hlsearch = true           -- highlight search results
opt.mouse = 'a'               -- enable mouse
opt.termguicolors = true      -- set term to gui
opt.completeopt = {"menu", "menuone", "noselect"}

--This part is to fix insert mode cursor missing
opt.guicursor = "a:block"
opt.guicursor = "n-v-c:blinkon0"
opt.guicursor = "i:blinkon1"

cmd([[
    "set column overlength color
    au VimEnter * highlight colorcolumn guibg=#afff00 

    "clear screen upon quit
    au VimLeave * :!clear
]])


