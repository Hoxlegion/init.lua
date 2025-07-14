-- File: ~/.config/nvim/lua/hox/lsp.lua
-- This file is now a "helper" module, not a plugin spec.

local M = {}

-- This defines the capabilities the language servers should have.
-- We're adding the nvim-cmp capabilities to the default ones.
M.capabilities = require('cmp_nvim_lsp').default_capabilities()

-- This is the function that runs when a language server attaches to a buffer.
-- It's where we set all our keymaps for LSP features
M.on_attach = function(client, bufnr)
	local opts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", vim.lsp.buf.open_float, opts)
	vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "[d", vim.lsp.buf.goto_next, opts)
	vim.keymap.set("n", "]d", vim.lsp.buf.goto_prev, opts)
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.decleration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
end

return M
