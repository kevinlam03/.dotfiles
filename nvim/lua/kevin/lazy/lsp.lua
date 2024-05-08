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
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                --["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })
        -- Keymaps
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = args.buf })
                vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { buffer = args.buf })
                vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { buffer = args.buf })
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = args.buf })
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = args.buf })
                vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, { buffer = args.buf })
                vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action, { buffer = args.buf })
                vim.keymap.set('n', '<leader><C-d>', vim.diagnostic.setloclist)
            end
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
                border = "rounded",
            }
        )
    end
}
--lsp_zero.default_keymaps({buffer = bufnr})