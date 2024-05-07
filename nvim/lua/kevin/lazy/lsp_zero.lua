-- LSP
-- 
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function() 
        local cmp = require('cmp')
        local cmp_lsp = require('cmp_nvim_lsp')
        local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities())
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                'tsserver',
                'eslint',
                'pylsp',
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
            }
        })
    end
}
--[[
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
-- see :help lsp-zero-keybindings
-- to learn the available actions
lsp_zero.default_keymaps({buffer = bufnr})
vim.keymap.set('n', '<leader><C-d>', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action)
end)
--]]
