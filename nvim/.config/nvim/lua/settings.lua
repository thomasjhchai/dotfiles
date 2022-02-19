local o = vim.opt           -- global setting
local wo = vim.wo           -- window setting
local fn = vim.fn           -- buffer setting

-- Basic Settings
o.timeoutlen = 500          -- overide default of 1000ms
o.showmatch = true          -- show matching brackets
o.ignorecase = true         -- case insensitive matching
o.cursorline = true         -- enable line of current position
o.tabstop = 4               -- number of columns by a tab character
o.softtabstop = 4           -- see multiple spaces as tabstops so <BS> does the right thing
o.expandtab = true          -- converts tab to white spaces
o.shiftwidth = 4            -- width for autoindents
o.relativenumber = true     -- add relative line numbees
o.autoindent = true         -- auto indent new line to follow previous line indentation
o.hlsearch = true           -- highlight search results
o.mouse = 'a'               -- enable mouse

--This part is to fix insert mode cursor missing
o.guicursor = "a:block"
o.guicursor = "n-v-c:blinkon0"
o.guicursor = "i:blinkon1"

-- set column overlength color
vim.cmd[[au VimEnter * highlight colorcolumn guibg=yellow]]


