-- File: ~/.config/nvim/lua/hox/plugins/config/lspconfig.lua

-- This function defines the keymaps that will be set ONLY for buffers wit an active LSP
local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
end

-- This is the new, modern way to tell Neovim to use the on_attach fuction
-- for ALL LSP servers.
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('HoxLspAttach', {}),
    callback = on_attach,
})

-- This is where we configure each language server.
-- The settings we provide here will be merged with the defaults from nvim-lspconfig.

-- Config lua_ls
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

-- Configure csharp_ls
vim.lsp.config('csharp_ls', {

})

-- Configure ts_ls
vim.lsp.config('ts_ls', {

})

-- We need to tell nvim-cmp about LSP capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Apply to all services
require('lspconfig').util.default_config = vim.tbl_deep_extend(
    'force',
    require('lspconfig').util.default_config,
    { capabilities = capabilities }
)
