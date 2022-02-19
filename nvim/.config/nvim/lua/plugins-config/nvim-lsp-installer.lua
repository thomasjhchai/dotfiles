local lsp_installer = require('nvim-lsp-installer')

local function common_on_attach(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    -- Mappings
    local opts = { noremap=true, silent=true }

    -- see :help vim.lsp.* for documentations
    buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>', opts)
    buf_set_keymap('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>', opts)
    buf_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>gs', ':lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>gc', ':lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>gn', ':lua vim.lsp.buf.rename()<CR>', opts)
end

local server_opts = {
    -- disable lsp config from throwing error for specific vim terms in lua
    ["sumneko_lua"] = function(opts)
         opts.settings = {
                Lua = {
                    diagnostics = {
                        globals = {'vim', 'use'}
                    },
                }
        }
    end,
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = common_on_attach,
        capabilities = capabilities,
    }

    if server_opts[server.name] then
        server_opts[server.name](opts)
    end

    server:setup(opts)
end)


