return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local fzf = require('fzf-lua')
        vim.keymap.set("n", "<leader>f", function()
            --fzf.files({ resume = true })
            fzf.files()
        end, { silent = true })
        vim.keymap.set("n", "<leader>F", fzf.live_grep_native, { silent = true })
        vim.keymap.set("v", "<leader>F", fzf.grep_visual, { silent = true })
        vim.keymap.set("n", "<leader>b", fzf.buffers, { silent = true })
        vim.keymap.set("n", "<leader>/", fzf.blines, { silent = true })
    end
}
