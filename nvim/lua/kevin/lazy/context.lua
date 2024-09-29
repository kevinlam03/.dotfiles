return {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false,
    config = function()
        local context = require('treesitter-context')
        context.setup {
            enable = false,
            mode = 'topline',
        }
        vim.keymap.set('n', '[oc', '<cmd>TSContextToggle<cr>')
    end
}
