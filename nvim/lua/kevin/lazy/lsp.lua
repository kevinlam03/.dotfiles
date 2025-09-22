return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
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
                'ts_ls',
                'eslint',
                'pylsp',
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        on_init = function(client)
                            if client.workspace_folders then
                                local path = client.workspace_folders[1].name
                                if vim.uv.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
                                    return
                                end
                            end

                            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                                runtime = {
                                    -- Tell the language server which version of Lua you're using
                                    -- (most likely LuaJIT in the case of Neovim)
                                    version = 'LuaJIT'
                                },
                                -- Make the server aware of Neovim runtime files
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME
                                        -- Depending on the usage, you might want to add additional paths here.
                                        -- "${3rd}/luv/library"
                                        -- "${3rd}/busted/library",
                                    }
                                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                                    -- library = vim.api.nvim_get_runtime_file("", true)
                                }
                            })
                        end,
                        settings = {
                            Lua = {}
                        }
                    }
                end,
                ["clangd"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.clangd.setup {
                        capabilities = capabilities,
                    }
                end,
            }
        })
        local cmp_insert = { behavior = cmp.SelectBehavior.Insert }

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_insert),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_insert),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            })
        })
        -- Keymaps
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
                vim.keymap.set('n', 'gd', function()
                    vim.lsp.buf.definition()
                    vim.cmd('norm zt')
                end, { buffer = args.buf })
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = args.buf })
                vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { buffer = args.buf })
                vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { buffer = args.buf })
                vim.keymap.set('n', '[d', function()
                    vim.diagnostic.goto_prev()
                    vim.cmd('norm zz')
                end, { buffer = args.buf })
                vim.keymap.set('n', ']d', function()
                    vim.diagnostic.goto_next()
                    vim.cmd('norm zz')
                end, { buffer = args.buf })
                vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, { buffer = args.buf })
                vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action, { buffer = args.buf })
                vim.keymap.set('n', '<leader><C-d>', function()
                    vim.diagnostic.setloclist()
                    vim.cmd('lopen')
                end)
                vim.keymap.set('n', '<leader>lgi', vim.lsp.buf.implementation, { buffer = args.buf })
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
            vim.lsp.handlers.hover,
            {
                border = "rounded",
            }
        )
    end
}
