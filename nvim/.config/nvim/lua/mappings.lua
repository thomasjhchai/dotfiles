local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '   -- map <SPACE> as leader

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Mapping for Plugins

-- [[Normal Mode]] --

-- Resizing Windows
map("n", '<S-Left>', ':vertical resize +2<CR>', opts)
map("n", '<S-Right>', ':vertical resize -2<CR>', opts)
map("n", '<S-Up>', ':resize -2<CR>', opts)
map("n", '<S-Down>', ':resize +2<CR>', opts)

-- Windows Controls
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Tabs Controls
map('n', '<M-t>', ':tabnew<CR>', opts)
map('n', '<M-j>', ':tabnext<CR>', opts)
map('n', '<M-k>', ':tabprevious<CR>', opts)

-- Buffers Controls
map('n', '<TAB>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', opts)

-- [[Insert Mode]] -- 
map('i', 'jj', '<ESC>', opts)
map('i', 'jk', '<ESC>', opts)

-- [[Visual Mode]] -- 

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "<M-j>", ":m .+1<CR>==", opts)
map("v", "<M-k>", ":m .-2<CR>==", opts)
map("v", "p", '"_dP', opts)

-- [[Visual Block Mode]] --

-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<M-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<M-k>", ":move '<-2<CR>gv-gv", opts)

-- [[Custom Mode]] --

-- Misc Controls
map('n', '<M-r>', '<cmd>lua reload_lua()<CR>', opts)    -- init.lua quick reload
map('n', '<leader>cc', ':bufdo set cc=80<CR>', opts)    -- set all buffer column guide 
map('n', '<leader>co', ':bufdo set cc=0<CR>', opts)     -- turn off all column guide

-- Packer plugin manager
map('n', '<leader>pu', ':PackerUpdate<CR>', opts)

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
map('n', '<leader>fc', ':Telescope colorscheme<CR>', opts)

-- Nvim-Tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)


-- Toggle Terminal
map('n', '<leader>t', ':ToggleTerm<CR>', opts) -- default floating window
map('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', opts)

-- WhickKey
map('n', '<leader>?', ':WhichKey<CR>', opts)


