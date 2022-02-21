local fn = vim.fn

-- Automactically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    vim.notify('Installing Packer for the first time')
end

-- Automcommand that reloads neovim when you save plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on the first time
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

return packer.startup(function(use)
    -- Add plugins here
    use 'wbthomason/packer.nvim'                -- Have packer managing itself
    use 'neovim/nvim-lspconfig'                 -- Collection of configurations for the built-in LSP client
    use 'williamboman/nvim-lsp-installer'       -- Simplify LSP installing
    -- Completions
    use 'hrsh7th/cmp-nvim-lsp'                  -- Code Completion
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'L3MON4D3/LuaSnip'                      -- Snippets
    use 'nvim-telescope/telescope.nvim'         -- fuzzy frinder like fzf
    use 'nvim-lua/popup.nvim'                   -- An implementation of popup API
    use 'nvim-lua/plenary.nvim'                 -- Useful lua functions for plugins
    use 'nvim-lualine/lualine.nvim'             -- nvim status bar, replace vim-air
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }                                           -- treesitter syntax color
    use 'kyazdani42/nvim-web-devicons'          -- providing icons for some plugins
    use 'kyazdani42/nvim-tree.lua'              -- file explorer
    use 'windwp/nvim-autopairs'                 -- auto pairing {}[]''""()
    use 'akinsho/toggleterm.nvim'               -- floating terminal
    use 'lukas-reineke/indent-blankline.nvim'   -- show indent-line
    use 'akinsho/bufferline.nvim'               -- show buffer tabs
    use 'folke/zen-mode.nvim'                   -- distraction free
    use 'folke/twilight.nvim'                   -- use with zen mode
    use 'folke/which-key.nvim'                  -- key bindings tooltips
    use 'ggandor/lightspeed.nvim'               -- super quick keyword search
    use 'lewis6991/gitsigns.nvim'               -- git decorations
    use {'ojroques/nvim-bufdel'}                -- improve buffer delete

    -- colorscheme
    use 'EdenEast/nightfox.nvim'
    use 'ellisonleao/gruvbox.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)

