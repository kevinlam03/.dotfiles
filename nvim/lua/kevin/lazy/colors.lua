return {
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        priority = 1000,
        config = function ()
            -- vim.cmd('colorscheme moonfly')
        end,
    },
    {
        'rose-pine/neovim',
        config = function()
            require('rose-pine').setup({})
            -- vim.cmd('colorscheme rose-pine-moon')
        end,
    },
    {
        'EdenEast/nightfox.nvim',
        config = function()
            require('nightfox').setup({})
            vim.cmd('colorscheme carbonfox')
        end
    }
}
