-- WIP: temporary not using. using nvim-lsp-installer instead
local nvim_lsp = require ('lspconfig')
local servers = {
    'tsserver',
    'html',
    'emmet_ls',
    'pyright',
    'sumneko_lua'
}      -- add all lspservers here

local on_attach = function(_, bufnr)

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

--Enable (broadcasting) snippet capability for completion
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(servers) do
    local settings = {}

    if lsp == 'sumneko_lua' then
        settings = {
             Lua = {
              diagnostics = {
                 -- Get the language server to recognize the `vim` global
                 globals = {'vim', 'use'},
               },
            },
        }
    end

   nvim_lsp[lsp].setup{
        settings = settings,
        on_attach = on_attach,
        capabilities = capabilities,
    }
end
