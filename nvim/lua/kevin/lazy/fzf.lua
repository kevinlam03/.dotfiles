return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() 
        vim.keymap.set("n", "<leader>f",
        "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
        vim.keymap.set("n", "<leader>b",
        "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
        vim.keymap.set("n", "<leader>/",
        "<cmd>lua require('fzf-lua').blines()<CR>", { silent = true })
    end
}
