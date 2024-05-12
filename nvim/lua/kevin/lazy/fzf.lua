return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        vim.keymap.set("n", "<leader>f", function()
            local fzf = require('fzf-lua')
            --fzf.files({ resume = true })
            fzf.files()
        end, { silent = true })
        vim.keymap.set("n", "<leader>b",
        "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
        vim.keymap.set("n", "<leader>/",
        "<cmd>lua require('fzf-lua').blines()<CR>", { silent = true })
        vim.api.nvim_create_user_command("Rg", function()
            require('fzf-lua').live_grep()
        end, {})
    end
}
