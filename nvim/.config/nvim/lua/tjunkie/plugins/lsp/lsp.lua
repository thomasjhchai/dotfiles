return { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP
        'j-hui/fidget.nvim',
    },
    config = function()
        -- This is where all the LSP shenanigans will live
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_lspconfig()

        --- if you want to know more about lsp-zero and mason.nvim
        --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        require('mason-lspconfig').setup({
            ensure_installed = {
                'pyright', -- python
                'tsserver', -- js, ts
            },
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    -- (Optional) Configure lua language server for neovim
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require('lspconfig').lua_ls.setup(lua_opts)
                end,
            }
        })

        -- Python environment
        local util = require("lspconfig/util")
        local path = util.path
        require('lspconfig').pyright.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            before_init = function(_, config)
                default_venv_path = path.join(vim.env.HOME, "virtualenvs", "nvim-venv", "bin", "python")
                config.settings.python.pythonPath = default_venv_path
            end,
        }
    end
}
