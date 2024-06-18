return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local fzf = require('fzf-lua')
        vim.keymap.set("n", "<leader>f", function()
            --fzf.files({ resume = true })
            fzf.files()
        end, { silent = true })
        vim.keymap.set("n", "<leader>F", function()
            fzf.live_grep()
        end, { silent = true })
        vim.keymap.set("n", "<leader>b",
        "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
        vim.keymap.set("n", "<leader>/",
        "<cmd>lua require('fzf-lua').blines()<CR>", { silent = true })
    end
}
