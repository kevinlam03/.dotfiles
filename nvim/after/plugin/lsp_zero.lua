-- LSP
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
    vim.keymap.set('n', '<leader><C-d>', vim.diagnostic.setloclist)
    vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename)
    vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action)
end)
